<?php

namespace App\Http\Controllers;

use App\Enums\ShippingStatusEnum;
use App\Enums\StateOrderEnum;
use App\Models\Category;
use App\Models\Customer;
use App\Models\Log;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\OrderNoResponse;
use App\Models\Product;
use App\Models\ProductVariant;
use App\Services\Log\LoggerService;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Services\Shopify\OrderService;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;
use RuntimeException;
use Illuminate\Validation\Rules\Enum;
use function PHPUnit\Framework\isNull;

class OrderController extends RootController
{
    public function index(){
        backView('order.orders',['page'=>'Orders']);
    }

    public function dtOrders(Request $request): JsonResponse
    {
        $user = auth()->user();

        $isAdminOrConfirm = $user->hasRole('admin', 'order_confirmation');
        $isHandler = $user->hasRole('order_handler');

        $conditions = [];

        $query = "
    SELECT
        o.*,
        CONCAT(c.first_name,' ',c.last_name) AS customer,
        IFNULL((
            SELECT GROUP_CONCAT(p.sku SEPARATOR ', ')
            FROM order_items oi
            LEFT JOIN products p ON p.id = oi.product_id
            WHERE oi.order_id = o.id
              AND oi.deleted = 0
        ), '-') AS products
    FROM orders o
    LEFT JOIN customers c ON c.id = o.customer_id
";


// 👇 Role condition
        if ($isHandler) {
            $conditions[] = "o.state = '" . StateOrderEnum::CONFIRMED->value . "'";
        }


// 👇 Status filter
        if ($request->has('status')) {

            switch ($request->get('status')) {

                case 'PENDING':
                    $conditions[] = "o.state = '" . StateOrderEnum::PENDING->value . "'";
                    break;

                case 'CONFIRMED':
                    $conditions[] = "o.state = '" . StateOrderEnum::CONFIRMED->value . "'";
                    break;

                case 'CANCELED':
                    $conditions[] = "o.state = '" . StateOrderEnum::CANCELLED->value . "'";
                    break;

                case 'SHIPPING':
                    $conditions[] = "o.state = '" . StateOrderEnum::CONFIRMED->value . "'";
                    $conditions[] = "o.status_shipping IN (
                '" . ShippingStatusEnum::PROCESSING->value . "',
                '" . ShippingStatusEnum::SHIPPED->value . "',
                '" . ShippingStatusEnum::DELIVERED->value . "'
            )";
                    break;
            }
        }


// 👇 Inject WHERE only once
        if (!empty($conditions)) {
            $query .= " WHERE " . implode(' AND ', $conditions);
        }

        $result = $this->DoDatatable($query, $request, function($i, $row){

            $note = $row->note ? '<div class="currency-icon warning">
                        <svg>
                          <use href="../assets/svg/icon-sprite.svg#stroke-note"></use>
                        </svg>
                    </div>' : '';

            $row->number = '<a href="'.route('details-order',['id'=>$row->id]).'">#'.$row->id.'
                    '.$note.'</a>';

            $state = StateOrderEnum::from($row->state);

            $row->state = '<span class="badge badge-light-' . $state->color() . '">'
                . $state->label()
                . '</span>';

           // $row->status_shipping = '';

            if(!empty($row->status_shipping)){

                $statusShipping = ShippingStatusEnum::from($row->status_shipping);

                $row->status_shipping = '<span class="badge badge-light-' . $statusShipping->color() . '">'
                    . $statusShipping->label()
                    . '</span>';

            }


            $row->products = $row->products ?? '-';

            if($row->source == 'shopify'){
                $row->source = '<span class="badge badge-light-primary">SHOPIFY</span>';
            }
            else{
                $row->source = '<span class="badge badge-light-secondary">CRM</span>';
            }

            $row->actions = '<div class="btn-group">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Actions</button>
                        <ul class="dropdown-menu dropdown-block" style="">
                          <li><a class="dropdown-item" href="'.route('details-order',['id'=>$row->id]).'">Details</a></li>
                        </ul>
                      </div>';
        });


        return response()->json($result);

    }

    public function newOrder(){

        $number = $this->generateNumber();

        backView('order.new_order',[
            'page'=>'New order',
            'number'=>$number,
        ],true);

    }

    public function updateOrderNote(Request $request): JsonResponse
    {
        try {
            DB::beginTransaction();

            $orderId = $request->get('order_id');

            if (!$orderId) {
                return response()->json([
                    'success' => false,
                    'message' => 'Order ID is required'
                ], 400);
            }

            // ✅ Validate only necessary fields
            $validated = $request->validate([
                'order_custom_number' => [
                    'required',
                    'string',
                    'max:50',
                    Rule::unique('orders', 'custom_number')->ignore($orderId),
                ],
                'order_note' => 'nullable|string',
            ]);

            // ✅ Get existing order
            $orderBefore = DB::table('orders')->where('id', $orderId)->first();

            if (!$orderBefore) {
                return response()->json([
                    'success' => false,
                    'message' => 'Order not found'
                ], 404);
            }

            // ✅ Update order
            DB::table('orders')
                ->where('id', $orderId)
                ->update([
                    'custom_number' => $validated['order_custom_number'],
                    'note'          => $validated['order_note'] ?? null,
                    'updated_at'    => now(),
                ]);

            $orderAfter = DB::table('orders')->where('id', $orderId)->first();

            // ✅ Logging
            LoggerService::logModelChange(
                Order::class,
                $orderId,
                'update',
                (array) $orderBefore,
                (array) $orderAfter,
                "Order updated"
            );

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Order updated successfully',
                'order_id' => $orderId,
            ]);

        } catch (ValidationException $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'errors'  => $e->errors(),
            ], 422);

        } catch (Throwable $e) {
            DB::rollBack();

            logger()->error('Update order error', [
                'error' => $e->getMessage()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ], 500);
        }
    }

    public function checkNumber(Request $request): JsonResponse
    {
        $orderId = $request->order_id; // may be null for new order
        $number  = $request->number;

        $query = Order::where('custom_number', $number);

        if ($orderId) {
            // Exclude current order from check
            $query->where('id', '<>', $orderId);
        }

        $exists = $query->exists();

        return response()->json([
            'exists' => $exists
        ]);
    }

    public function storeOrder(Request $request): JsonResponse
    {
        try {

            DB::beginTransaction();

            // ✅ Validation
            $validated = $request->validate([
                'customer_id'             => 'nullable|exists:customers,id',
                'order_first_name'        => 'required|string|min:2|max:255',
                'order_last_name'         => 'required|string|min:2|max:255',
                'order_email'             => 'required|email|max:255',
                'order_phone'             => 'required|string|min:6|max:30',
                'order_billing_address'   => 'required|string|min:5',
                'order_shipping_address'  => 'required|string|min:5',
                'order_custom_number'     => 'required|string|max:50|unique:orders,custom_number',
                'order_note'              => 'nullable|string',
            ]);

            /**
             * ------------------------------------------------
             * 1️⃣ Create or Get Customer
             * ------------------------------------------------
             */

            $customBefore = null;
            $customAfter  = null;

            if (!empty($validated['customer_id'])) {

                // 🔹 Get existing customer
                $customer = DB::table('customers')
                    ->where('id', $validated['customer_id'])
                    ->first();

                if (!$customer) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Customer not found'
                    ], 404);
                }

                $customBefore = (array) $customer;

                // 🔹 Update customer
                DB::table('customers')
                    ->where('id', $validated['customer_id'])
                    ->update([
                        'first_name' => $validated['order_first_name'],
                        'last_name'  => $validated['order_last_name'],
                        'email'      => $validated['order_email'],
                        'phone'      => $validated['order_phone'],
                        'address'    => $validated['order_billing_address'],
                        'updated_at' => now(),
                    ]);

                // 🔹 Get updated customer (AFTER)
                $updatedCustomer = DB::table('customers')
                    ->where('id', $validated['customer_id'])
                    ->first();

                $customAfter = (array) $updatedCustomer;

                $customerId = $validated['customer_id'];

            } else {

                // 🔹 Create new customer
                $customerId = DB::table('customers')->insertGetId([
                    'first_name' => $validated['order_first_name'],
                    'last_name'  => $validated['order_last_name'],
                    'email'      => $validated['order_email'],
                    'phone'      => $validated['order_phone'],
                    'address'    => $validated['order_billing_address'],
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);

                // 🔹 Get created customer (AFTER)
                $newCustomer = DB::table('customers')
                    ->where('id', $customerId)
                    ->first();

                $customAfter = (array) $newCustomer;
            }

            LoggerService::logModelChange(
                Customer::class,
                $customerId,
                !empty($validated['customer_id']) ? 'update' : 'create',
                $customBefore,
                $customAfter,
                "New customer created"
            );

            /**
             * ------------------------------------------------
             * 2️⃣ Create Order
             * ------------------------------------------------
             */
            $orderId = DB::table('orders')->insertGetId([
                'date'             => date('Y-m-d'),
                'user_id'          => auth()->id(),
                'customer_id'      => $customerId,
                'custom_number'    => $validated['order_custom_number'],
                'customer_address' => $validated['order_shipping_address'], // shipping
                'note'             => $validated['order_note'] ?? null,
                'state'            => 'pending', // default status
                'created_at'       => now(),
                'updated_at'       => now(),
            ]);

            /**
             * ------------------------------------------------
             * 3️⃣ Logging
             * ------------------------------------------------
             */

            $orderAfter = DB::table('orders')->where('id', $orderId)->first();

            LoggerService::logModelChange(
                Order::class,
                $orderId,
                'create',
                [],
                $orderAfter,
                "New order created"
            );

            DB::commit();

            return response()->json([
                'success'   => true,
                'message'   => 'Order created successfully',
                'order_id'  => $orderId,
            ]);

        } catch (ValidationException $e) {

            DB::rollBack();

            return response()->json([
                'success' => false,
                'errors'  => $e->errors(),
            ], 422);

        } catch (Throwable $e) {

            DB::rollBack();

            logger()->error('Store order error', [
                'error' => $e->getMessage()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ], 500);
        }
    }

    public function orders(OrderService $order): JsonResponse
    {
        try {
            $orders = $order->getOrders([
                'limit'  => 50,
                'status' => 'any',
            ]);

            return response()->json([
                'success' => true,
                'data'    => $orders,
            ]);

        } catch (RuntimeException $e) {

            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 502); // Bad Gateway (external API)
        }
    }

    public function detailsOrder(int $id)
    {
        $user = auth()->user();

        // Check role
        $isHandler = $user->hasRole('order_handler');
        $isAdmin = $user->hasRole('admin');

        // Fetch order
        $orderQuery = DB::table('orders')->where('id', $id);

        // If user is order_handler, only allow confirmed orders
        if ($isHandler) {
            $orderQuery->where('state', StateOrderEnum::CONFIRMED->value);
        }

        $order = $orderQuery->first();

        // Block access if order not found (either doesn't exist or not confirmed)
        if (!$order) {
            abort(403, 'You do not have permission to view this order.');
        }

        return backView('order.details', [
            'page'       => 'Details order',
            'orderId'    => $id,
            'order'      => $order,
            'isHandler'  => $isHandler,
            'isAdmin' => $isAdmin,
        ]);
    }

    /**
     * Load Order
     */
    public function loadOrder(int $id): JsonResponse
    {

        // Check role
        $user = auth()->user();
        $isHandler   = $user->hasRole('admin','order_handler');
        $isConfirmed = $user->hasRole('admin','order_confirmation');

        try {

            $order = DB::table('orders as o')
                ->leftJoin('customers as c', 'c.id', '=', 'o.customer_id')
                ->select(
                    'o.*',
                    'c.email',
                    'c.address as billing_address',
                    'c.phone',
                    DB::raw("CONCAT(c.first_name,' ',c.last_name) AS customer")
                )
                ->where('o.id', $id)
                ->first();

            $countNoResponses = DB::table('order_no_responses')
                ->where('order_id', $order->id)
                ->count();

            $orderActions = auth()->user()->hasRole('admin', 'order_confirmation');

            return response()->json([
                'success' => true,
                'order' => $order,
                'order_status' => [
                    'pending' => 'Pending Validation',
                    'confirmed' => 'Confirmed',
                    'no_response' => 'No Response',
                    'cancelled' => 'Cancelled',
                ],
                'count_no_response'=> $countNoResponses,
                'order_actions'=> $orderActions,
                'is_confirmed'=> $isConfirmed,
                'is_handler'=> $isHandler,
            ]);

        }
        catch (ModelNotFoundException $e) {
            return response()->json([
                'success' => false,
                'items' => null,
                'message' => 'Order not found'
            ]);

        } catch (Throwable $e) {
            logger()->error('Something went wrong', ['message' => $e->getMessage()]);

            return response()->json([
                'success' => false,
                'items' => null,
                'message' => 'Something went wrong'
            ]);

        }
    }
    /**
     * Load Order Products
     */
    public function loadOrderProducts(int $id): JsonResponse
    {

        // Check role
        $user = auth()->user();
        $isHandler = $user->hasRole('order_handler');
        $isAdmin = $user->hasRole('admin');

        try {
            $items = DB::table('order_items as oi')
                ->leftJoin('products as p', 'p.id', '=', 'oi.product_id')

                ->leftJoin('medias as m', function ($join) {
                    $join->on('m.mediaable_id', '=', 'p.id')
                        ->where('m.mediaable_type', '=', Product::class)
                        ->where('m.is_primary', '=', 1);
                })

                ->select(
                    'oi.id',
                    'p.name',
                    'oi.sku',
                    'oi.price',
                    'oi.quantity',
                    DB::raw('(oi.price * oi.quantity) as total'),
                    'p.name as product_name',
                    'm.path'
                )
                ->where('oi.order_id', $id)
                ->where('oi.deleted', 0)
                ->get();

            $productActions = auth()->user()->hasRole('admin', 'order_confirmation');

            return response()->json([
                'success' => true,
                'product_actions' => $productActions,
                'is_admin' => $isAdmin,
                'is_hanlder' => $isHandler,
                'items' => $items
            ]);

        } catch (ModelNotFoundException $e) {
            return response()->json([
                'success' => false,
                'items' => null,
                'message' => 'Products not found'
            ]);

        } catch (Throwable $e) {
            logger()->error('Something went wrong', ['message' => $e->getMessage()]);

            return response()->json([
                'success' => false,
                'items' => null,
                'message' => 'Something went wrong'
            ]);

        }
    }

    /**
     * Load recent activities
     */
    public function recentActivities(int $id): JsonResponse
    {
        try {

            //Fetch Order Logs
            $activities = Log::with('user')
                ->where('model_type', Order::class)
                ->where('model_id', $id)
                ->latest()
                ->limit(20)
                ->get()
                ->map(function ($log) {

                    return [
                        'id'          => $log->id,
                        'action'      => $log->action,
                        'description' => $log->description,
                        'user' => $log->user
                            ? trim("{$log->user->first_name} {$log->user->last_name}")
                            : 'System',
                        'date'        => $log->created_at?->format('d M Y, H:i'),
                    ];
                });

            return response()->json([
                'success' => true,
                'activities' => $activities
            ]);

        } catch (\Throwable $e) {

            //Log the Exception for Debugging
            logger()->error('Failed to load recent activities', ['error' => $e->getMessage()]);

            return response()->json([
                'success' => false,
                'message' => 'Unable to load recent activities.'
            ], 500);
        }
    }

    public function orderNewProduct(int $id = null){

        try {

            $products = Product::all();

            return backView('order.order_new_product', [
                'page'       => 'New product',
                'products'    => $products
            ], true,true);

        } catch (ModelNotFoundException $e) {
            return redirect()->back()->with('error', 'Product not found');

        } catch (Throwable $e) {
            logger()->error('Product form error', ['message' => $e->getMessage()]);
            return redirect()->back()->with('error', 'Something went wrong');
        }

    }

    public function getVariantsProduct(int $id): JsonResponse
    {
        try {

            // Check if Product Exists
            $product = Product::find($id);

            if (!$product) {
                return response()->json([
                    'success' => false,
                    'message' => 'Product not found',
                    'variants' => []
                ], 404);
            }

            // Fetch Variants
            $variants = ProductVariant::where('product_id', $id)
                ->orderByDesc('id')
                ->get()
                ->map(function ($variant) {

                    return [
                        'id'                  => $variant->id,
                        'name'                => $variant->name,
                        'sku'                 => $variant->sku,
                        'barcode'             => $variant->barcode,
                        'price'               => $variant->price,
                        'compare_price'       => $variant->compare_price,
                        'stock'               => $variant->stock,
                        'is_active'           => $variant->is_active,
                        'shopify_variant_id'  => $variant->shopify_variant_id,
                        'shopify_handle'      => $variant->shopify_handle,
                        'shopify_synced_at'   => optional($variant->shopify_synced_at)?->format('Y-m-d H:i'),
                    ];
                });

            return response()->json([
                'success' => true,
                'message' => 'Variants loaded successfully',
                'variants' => $variants
            ]);

        } catch (\Throwable $e) {
            //Log Error (Never expose real error in production)
            logger()->error('Failed to load product variants', [
                'product_id' => $id,
                'error'      => $e->getMessage(),
                'file'       => $e->getFile(),
                'line'       => $e->getLine(),
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Unable to load variants',
                'variants' => []
            ], 500);
        }
    }

    public function storeOrderProduct(Request $request): JsonResponse
    {

        try {
            DB::beginTransaction();

            // ✅ Validate request
            $validated = $request->validate([
                'product_id'    => 'nullable|exists:products,id',
                'order_id'    => 'nullable|exists:orders,id',
                'product_variants'          => 'required|string|min:3|max:255',
                'product_sku'         => 'required|string|min:3|max:255',
                'product_price'         => 'required|numeric|min:0',
                'product_quantity'      => 'required|integer|min:0',
            ]);

            // ✅ Create order item
            $orderItemId = DB::table('order_items')->insertGetId([
                'order_id'   => $validated['order_id'],
                'product_id' => $validated['product_id'],
                'price'      => $validated['product_price'],
                'sku'        => $validated['product_sku'],
                'quantity'   => $validated['product_quantity'],
                'user_id'    => auth()->id(),
                'created_at' => now(),
            ]);

            // Get full inserted row
            $orderItem = DB::table('order_items')
                ->where('id', $orderItemId)
                ->first();

            // Convert to array
            $after = (array) $orderItem;

            LoggerService::logModelChange(
                Order::class,
                $validated['order_id'],
                'create',
                '',
                $after,
                "Add new product"
            );

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Order item saved successfully',
            ]);
        }
        catch (ValidationException $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'errors'  => $e->errors(),
            ], 422);

        } catch (\Throwable $e) {
            DB::rollBack();
            logger()->error('Store order item error', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ], 500);
        }

    }

    public function editOrderItem(int $id){

        try {

            $orderItem = OrderItem::findOrFail($id);

            return backView('order.edit_order_item', [
                'page'    => 'Edit product',
                'product' => $orderItem
            ], true);

        } catch (ModelNotFoundException $e) {

            return redirect()->back()->with('error', 'Order item not found');

        } catch (Throwable $e) {

            logger()->error('Order item form error', [
                'message' => $e->getMessage()
            ]);

            return redirect()->back()->with('error', 'Something went wrong');
        }

    }

    public function updateOrderItem(Request $request): JsonResponse
    {

        try {
            DB::beginTransaction();

            // ✅ Validate request
            $validated = $request->validate([
                'order_id'    => 'nullable|exists:orders,id',
                'order_item_id'    => 'nullable|exists:order_items,id',
                'product_sku'         => 'required|string|min:3|max:255',
                'product_price'         => 'required|numeric|min:0',
                'product_quantity'      => 'required|integer|min:0',
            ]);

            // ✅ Get current order item (BEFORE)
            $orderItem = DB::table('order_items')
                ->where('id', $validated['order_item_id'])
                ->first();

            if (!$orderItem) {
                return response()->json([
                    'success' => false,
                    'message' => 'Order item not found'
                ], 404);
            }

            $before = (array) $orderItem;

            // ✅ Update specific row (IMPORTANT)
            DB::table('order_items')
                ->where('id', $validated['order_item_id'])
                ->update([
                    'price'      => $validated['product_price'],
                    'sku'        => $validated['product_sku'],
                    'quantity'   => $validated['product_quantity'],
                    'user_id'    => auth()->id(),
                    'updated_at' => now(),
                ]);

            // ✅ Get updated row (AFTER)
            $updatedOrderItem = DB::table('order_items')
                ->where('id', $validated['order_item_id'])
                ->first();

            $after = (array) $updatedOrderItem;

            // ✅ Log update
            LoggerService::logModelChange(
                Order::class,
                $validated['order_id'],
                'update',
                $before,
                $after,
                "Update order item"
            );

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Order item updated successfully',
            ]);
        }
        catch (ValidationException $e) {

            DB::rollBack();

            return response()->json([
                'success' => false,
                'errors'  => $e->errors(),
            ], 422);

        } catch (Throwable $e) {

            DB::rollBack();

            logger()->error('Update order item error', [
                'error' => $e->getMessage()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ], 500);
        }

    }

    public function deleteOrderItem(Request $request): JsonResponse
    {
        try {
            // Validate request
            $request->validate([
                'order_item_id' => 'required|integer|exists:order_items,id',
            ]);

            // Get product (not already deleted)
            $product = OrderItem::where('id', $request->post('order_item_id'))
                ->where('deleted', 0)
                ->firstOrFail();

            // Soft delete (custom)
            $product->update([
                'deleted' => 1,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Order item deleted successfully',
            ]);

        } catch (ModelNotFoundException $e) {

            return response()->json([
                'success' => false,
                'message' => 'Order item not found',
            ], 404);

        } catch (\Throwable $e) {

            logger()->error('Delete Order item error: '.$e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ], 500);
        }
    }

    public function editOrderCustomer(int $id)
    {
        try {

            $order = DB::table('orders as o')
                ->leftJoin('customers as c', 'c.id', '=', 'o.customer_id')
                ->select(
                    'o.*',
                    'c.id as customer_id',
                    'c.first_name',
                    'c.last_name',
                    'c.email',
                    'c.address as billing_address',
                    'c.phone',
                    DB::raw("CONCAT(c.first_name,' ',c.last_name) AS customer")
                )
                ->where('o.id', $id)
                ->first();

            if (!$order) {
                throw new ModelNotFoundException();
            }

            return backView('order.edit_order_customer', [
                'page'  => 'Edit customer',
                'order' => $order
            ], true);

        } catch (ModelNotFoundException $e) {

            return redirect()->back()->with('error', 'Order customer not found');

        } catch (Throwable $e) {

            logger()->error('Order customer form error', [
                'message' => $e->getMessage()
            ]);

            return redirect()->back()->with('error', 'Something went wrong');
        }
    }

    public function updateOrderCustomer(Request $request): JsonResponse
    {
        try {

            DB::beginTransaction();

            // ✅ Validate request
            $validated = $request->validate([
                'order_id'                  => 'required|exists:orders,id',
                'customer_first_name'       => 'required|string|min:2|max:255',
                'customer_last_name'        => 'required|string|min:2|max:255',
                'customer_email'            => 'required|email|max:255',
                'customer_phone'            => 'required|string|min:6|max:30',
                'customer_billing_address'  => 'required|string|min:5',
                'customer_shipping_address' => 'required|string|min:5',
            ]);

            // ✅ Get order
            $order = DB::table('orders')
                ->where('id', $validated['order_id'])
                ->first();

            if (!$order) {
                return response()->json([
                    'success' => false,
                    'message' => 'Order not found'
                ], 404);
            }

            // ✅ Get customer (BEFORE)
            $customer = DB::table('customers')
                ->where('id', $order->customer_id)
                ->first();

            if (!$customer) {
                return response()->json([
                    'success' => false,
                    'message' => 'Customer not found'
                ], 404);
            }

            $before = [
                'customer' => (array) $customer,
                'order_shipping_address' => $order->customer_address
            ];

            // ✅ Update customer
            DB::table('customers')
                ->where('id', $customer->id)
                ->update([
                    'first_name' => $validated['customer_first_name'],
                    'last_name'  => $validated['customer_last_name'],
                    'email'      => $validated['customer_email'],
                    'phone'      => $validated['customer_phone'],
                    'address'    => $validated['customer_billing_address'],
                    'updated_at' => now(),
                ]);

            // ✅ Update order shipping address
            DB::table('orders')
                ->where('id', $validated['order_id'])
                ->update([
                    'customer_address' => $validated['customer_shipping_address'],
                    'updated_at'       => now(),
                ]);

            // ✅ Get AFTER state
            $updatedCustomer = DB::table('customers')
                ->where('id', $customer->id)
                ->first();

            $updatedOrder = DB::table('orders')
                ->where('id', $validated['order_id'])
                ->first();

            $after = [
                'customer' => (array) $updatedCustomer,
                'order_shipping_address' => $updatedOrder->customer_address
            ];

            // ✅ Log
            LoggerService::logModelChange(
                Order::class,
                $validated['order_id'],
                'update',
                $before,
                $after,
                "Update order customer"
            );

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Customer updated successfully',
            ]);

        } catch (ValidationException $e) {

            DB::rollBack();

            return response()->json([
                'success' => false,
                'errors'  => $e->errors(),
            ], 422);

        } catch (Throwable $e) {

            DB::rollBack();

            logger()->error('Update order customer error', [
                'error' => $e->getMessage()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ], 500);
        }
    }

    public function changeStatusOrder(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'order_id' => ['required', 'exists:orders,id'],
            'order_status'   => ['required', new Enum(StateOrderEnum::class)],
            'cancel_reason' => ['nullable', 'string', 'max:500'], // only for cancelled
        ]);

        try {

            DB::beginTransaction();

            $order = Order::findOrFail($validated['order_id']);

            $newStatus = StateOrderEnum::from($validated['order_status']);

            // ✅ Already same status
            if ($order->state === $newStatus->value) {
                return response()->json([
                    'success' => false,
                    'message' => "Order is already {$newStatus->label()}."
                ], 409);
            }

            $before = $order->toArray();

            $dataUpdated = [
                'state' => $newStatus->value,
            ];

            // ✅ If cancelled, store reason
            if ($newStatus === StateOrderEnum::CANCELLED) {
                $dataUpdated['cancel_reason'] = $validated['cancel_reason'] ?? null;
            }

            // Auto-update shipping status if order confirmed
            if ($newStatus === StateOrderEnum::CONFIRMED) {

                $dataUpdated['status_shipping'] = ShippingStatusEnum::PENDING->value;

            }
            else {
                $dataUpdated['status_shipping'] = null;
            }

            // ✅ Update using Eloquent
            $order->update($dataUpdated);

            if ($newStatus === StateOrderEnum::NO_RESPONSE) {
                OrderNoResponse::create([
                    'order_id' => $order->id,
                    'user_id'  => auth()->id(),
                ]);
            }

            $after = $order->fresh()->toArray();

            // ✅ Log change
            LoggerService::logModelChange(
                Order::class,
                $order->id,
                'update',
                $before,
                $after,
                "Order status changed to {$newStatus->label()}"
            );

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => "Order status updated to {$newStatus->label()} successfully."
            ]);

        } catch (\Throwable $e) {

            DB::rollBack();

            logger()->error('Order status update failed', [
                'order_id' => $validated['order_id'] ?? null,
                'error'    => $e->getMessage(),
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Failed to update order status.'
            ], 500);
        }
    }


    public function orderNoResponse(Request $request): JsonResponse
    {
        // ✅ Validate input
        $validated = $request->validate([
            'order_id'     => ['required', 'exists:orders,id'],
            'order_status' => ['required', new Enum(StateOrderEnum::class)],
        ]);

        try {
            DB::beginTransaction();

            // ✅ Fetch the order
            $order = Order::findOrFail($validated['order_id']);

            $newStatus = StateOrderEnum::from($validated['order_status']);

            // ✅ Only log if status is no-response
            if ($validated['order_status'] != StateOrderEnum::NO_RESPONSE->value) {
                return response()->json([
                    'success' => false,
                    'message' => 'Only if status is  ' . $newStatus->label(),
                ]);
            }

            // ✅ Capture previous state for logging
            $before = $order->toArray();

            // ✅ Update order status
            $order->update([
                'state'      => $newStatus->value,
                'updated_at' => now(),
            ]);

            // ✅ Log change
            $after = $order->fresh()->toArray();

            LoggerService::logModelChange(
                Order::class,
                $order->id,
                'update',
                $before,
                $after,
                "Order status changed to {$newStatus->label()}"
            );

            // ✅ If status is no-response, create a record
            OrderNoResponse::create([
                'order_id' => $order->id,
                'user_id'  => auth()->id(),
            ]);

            DB::commit();

            // ✅ Return JSON
            return response()->json([
                'success'           => true,
                'message'           => 'Order status updated successfully',
                'order_id'          => $order->id,
                'order_status'      => $newStatus->value,
                'count_no_response' => $order->noResponses()->count(),
            ]);

        } catch (\Throwable $e) {
            DB::rollBack();

            logger()->error('Order status update error', [
                'error' => $e->getMessage(),
                'order_id' => $request->order_id ?? null,
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ], 500);
        }
    }

    public function orderCancelReason(int $id)
    {
        try {
            // ✅ Fetch order
            $order = Order::findOrFail($id);

            // ✅ Return cancel reason view
            return view('order.cancel_reason', [
                'page'  => 'Cancel Order',
                'order' => $order,
            ]);

        } catch (ModelNotFoundException $e) {
            return redirect()->back()->with('error', 'Order not found.');
        } catch (Throwable $e) {
            logger()->error('Order cancel reason error', [
                'message'  => $e->getMessage(),
                'order_id' => $id,
            ]);

            return redirect()->back()->with('error', 'Something went wrong.');
        }
    }

    public function editOrderNote(int $id){

        try {

            $order = DB::table('orders')
                ->select('note','custom_number')
                ->where('id', $id)
                ->first();

            if (!$order) {
                throw new ModelNotFoundException();
            }

            return backView('order.edit_order_note', [
                'page'  => 'Edit note',
                'order' => $order
            ], true,true);

        } catch (ModelNotFoundException $e) {

            return redirect()->back()->with('error', 'Order not found');

        } catch (Throwable $e) {

            logger()->error('Order form error', [
                'message' => $e->getMessage()
            ]);

            return redirect()->back()->with('error', 'Something went wrong');
        }

    }

    public function updateShippingStatus(Request $request): JsonResponse
    {
        try {
            $user = auth()->user();

            // ✅ Permission check
            if (! $user->hasRole('admin', 'order_confirmation', 'order_handler')) {
                return response()->json([
                    'success' => false,
                    'message' => 'Unauthorized',
                ], 403);
            }

            $orderId = $request->get('order_id');
            $order = DB::table('orders')->where('id', $orderId)->first();

            if (!$order) {
                return response()->json([
                    'success' => false,
                    'message' => 'Order not found',
                ], 404);
            }

            // ✅ Only allow shipping update if order is confirmed
            if ($order->state !== 'confirmed') {
                return response()->json([
                    'success' => false,
                    'message' => 'Shipping status can only be updated for confirmed orders.'
                ], 400);
            }

            // ✅ Determine new shipping status
            $newShippingStatus = 'processing';

            $before = $order;

            // ✅ Update shipping status
            DB::table('orders')->where('id', $orderId)->update([
                'status_shipping' => $newShippingStatus,
                'updated_at' => now(),
            ]);

            $after = DB::table('orders')->where('id', $orderId)->first();

            // ✅ Log the change
            LoggerService::logModelChange(
                Order::class,
                $orderId,
                'update',
                (array) $before,
                (array) $after,
                "Shipping status set to {$newShippingStatus}"
            );

            return response()->json([
                'success' => true,
                'message' => "Shipping status updated to {$newShippingStatus}",
            ]);

        } catch (Throwable $e) {
            logger()->error('Update shipping status error', [
                'error' => $e->getMessage(),
                'order_id' => $request->get('order_id'),
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Something went wrong while updating shipping status',
            ], 500);
        }
    }

    public function billStatis(): JsonResponse
    {
        try {

            $totalPending= DB::table('orders')
                ->where('state', StateOrderEnum::PENDING->value)
                ->where('deleted', 0)
                ->count();

            $totalCanceled = DB::table('orders')
                ->where('state', StateOrderEnum::CANCELLED->value)
                ->where('deleted', 0)
                ->count();

            $totalConfirmed = DB::table('orders')
                ->where('state', StateOrderEnum::CONFIRMED->value)
                ->where('deleted', 0)
                ->count();

            $totalShipping = DB::table('orders')
                ->where('state', StateOrderEnum::CONFIRMED->value)
                ->where('deleted', 0)
                ->whereIn('status_shipping', [
                    ShippingStatusEnum::PROCESSING->value,
                    ShippingStatusEnum::SHIPPED->value,
                ])
                ->count();

            return response()->json([
                'success' => true,
                'data' => [
                    'total_pending'  => $totalPending,
                    'total_canceled'  => $totalCanceled,
                    'total_confirmed' => $totalConfirmed,
                    'total_shipping'  => $totalShipping,
                ]
            ]);

        } catch (\Throwable $e) {

            \Log::error('Bill statistics error: ' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Something went wrong while fetching statistics.'
            ], 500);
        }
    }

    public function cancelShipping(Request $request): JsonResponse
    {
        try {

            $orderId = $request->get('order_id');
            $order = Order::findOrFail($orderId);

            // Sécurité : seulement si confirmé
            if ($order->state != StateOrderEnum::CONFIRMED->value) {
                return response()->json([
                    'success' => false,
                    'message' => 'Order not confirmed'
                ], 400);
            }

            $order->status_shipping = ShippingStatusEnum::PENDING->value;
            $order->save();

            return response()->json([
                'success' => true,
                'message' => 'Shipping cancelled successfully'
            ]);

        } catch (\Throwable $e) {

            \Log::error($e);

            return response()->json([
                'success' => false,
                'message' => 'Server error'
            ], 500);
        }
    }

    public function updateTotalPrice(Request $request): JsonResponse
    {
        try {
            $request->validate([
                'order_id' => 'required|integer|exists:orders,id',
                'total_price' => 'required|numeric|min:0',
            ]);

            $order = Order::findOrFail($request->order_id);
            $order->total_ttc = $request->total_price;
            $order->save();

            return response()->json([
                'success' => true,
                'message' => "Total price updated successfully",
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

}
