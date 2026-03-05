<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Models\Media;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use App\Services\Log\LoggerService;

class ProductController extends RootController
{
    /**
     * Display products page
     */
    public function index()
    {
        // Load categories main page (datatable handled via AJAX)
        return backView('product.products', [
            'page' => 'Products'
        ]);
    }

    /**
     * Datatable AJAX source for products list
     */
    public function dtProducts(Request $request): JsonResponse
    {
        try {
            // Base query for datatable
            $productClass = addslashes(Product::class); // escapes backslashes
            $query = "
                SELECT p.*, c.name as `category`, CONCAT(u.first_name,' ',u.last_name) AS `user`, m.path
                FROM products p
                LEFT JOIN categories c ON c.id = p.category_id
                LEFT JOIN users u ON u.id = p.user_id
                LEFT JOIN medias m ON m.mediaable_id = p.id AND m.mediaable_type = '{$productClass}' and m.is_primary = 1
                WHERE p.deleted = 0
            ";


            // Datatable processing (pagination, search, ordering)
            $result = $this->DoDatatable($query, $request, function ($i, $row) {

                //image
                $imageUrl = $row->path
                    ? asset('uploads/' . $row->path)
                    : asset('assets/images/no-image.png'); // fallback

                $row->image = '<div class="product-names">
                  <div class="light-product-box">
                      <img class="img-fluid" src="'.$imageUrl.'" alt="'.htmlspecialchars($row->name).'">
                  </div>
                </div>';

                // Actions column (edit / delete buttons)
                $row->actions = '<div class="btn-group">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Actions
                        </button>
                        <ul class="dropdown-menu" style="">
                          <li>
                          <a class="dropdown-item" href="JavaScript:void(0)" data-action="edit-product"
                          data-id="'.$row->id.'">Edit</a>
                          </li>
                          <li>
                          <a class="dropdown-item" href="JavaScript:void(0)" data-action="delete-product"
                          data-id="'.$row->id.'">Delete</a>
                          </li>
                        </ul>
                      </div>';
            });

            return response()->json($result);

        } catch (Throwable $e) {

            // Log error for debugging
            logger()->error('Datatable products error', [
                'message' => $e->getMessage(),
            ]);

            // Return JSON error response
            return response()->json([
                'success' => false,
                'message' => 'Unable to load products list',
            ], 500);
        }
    }

    /**
     * Create / Edit product form
     */
    public function newProduct(?int $id = null)
    {
        try {
            // Edit mode → load product + primary image
            $product = $id
                ? Product::with('primaryMedia')->findOrFail($id)
                : null;

            $categories = Category::where('deleted', 0)->get();

            return backView('product.new_product', [
                'page'       => 'New product',
                'product'    => $product,
                'categories' => $categories,
            ], true);

        } catch (ModelNotFoundException $e) {
            return redirect()->back()->with('error', 'Product not found');

        } catch (Throwable $e) {
            logger()->error('Product form error', ['message' => $e->getMessage()]);
            return redirect()->back()->with('error', 'Something went wrong');
        }
    }

    public function storeProduct(Request $request): JsonResponse
    {
        DB::beginTransaction();

        try {
            // ✅ Validate request
            $validated = $request->validate([
                'product_id'    => 'nullable|exists:products,id',
                'name'          => 'required|string|min:3|max:255',
                'category_id'   => 'required|exists:categories,id',
                'price'         => 'required|numeric|min:0',
                'sku'           => 'required|string|max:100|unique:products,sku,' . $request->product_id,
                'quantity'      => 'required|integer|min:0',
                'description'   => 'nullable|string',
                'product_images.*' => 'nullable|image|max:2048',
                'remove_image' => 'nullable|boolean', // 0 or 1
            ]);

            // ✅ Load existing product if updating
            $productId = $validated['product_id'] ?? null;
            $product   = $productId ? Product::find($productId) : null;

            $before = $product ? $product->getAttributes() : null;

            // ✅ Create or update product
            $product = Product::updateOrCreate(
                ['id' => $productId],
                [
                    'name'        => $validated['name'],
                    'slug'        => Str::slug($validated['name']),
                    'category_id' => $validated['category_id'],
                    'price'       => $validated['price'],
                    'sku'         => $validated['sku'],
                    'quantity'    => $validated['quantity'],
                    'description' => $validated['description'] ?? null,
                    'user_id'     => auth()->id(),
                ]
            );
            // ✅ Remove primary image
            if (!empty($validated['remove_image']) && (int) $validated['remove_image'] === 1) {

                $primaryMedia = $product->medias()
                    ->where('is_primary', true)
                    ->first();

                if ($primaryMedia) {

                    Storage::disk($primaryMedia->disk)->delete($primaryMedia->path);
                    $primaryMedia->delete();

                    // Promote next image
                    $nextMedia = $product->medias()
                        ->orderBy('id', 'asc')
                        ->first();

                    if ($nextMedia) {
                        $nextMedia->update(['is_primary' => true]);
                    }
                }
            }

            // ✅ Upload new images
            if ($request->hasFile('product_image')) {

                $file  = $request->file('product_image');

                $path = $file->store('products', 'uploads');

                Media::create([
                    'mediaable_id'   => $product->id,
                    'mediaable_type' => Product::class,
                    'user_id'        => auth()->id(),
                    'path'           => $path,
                    'disk'           => 'uploads',
                    'mime_type'      => $file->getClientMimeType(),
                    'size'           => $file->getSize(),
                    'is_primary'     => 1,
                    'is_active'      => true,
                ]);
            }

            $after = $product->getAttributes();

            // ✅ Log action
            LoggerService::logModelChange(
                $product,
                $productId ? 'update' : 'create',
                $before,
                $after
            );

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Product saved successfully',
                'data'    => $product->load('medias'), // eager load medias
            ]);

        } catch (ValidationException $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'errors'  => $e->errors(),
            ], 422);

        } catch (\Throwable $e) {
            DB::rollBack();
            logger()->error('Store product error', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ], 500);
        }
    }

    public function deleteProduct(Request $request): JsonResponse
    {
        try {
            // Validate request
            $request->validate([
                'product_id' => 'required|integer|exists:products,id',
            ]);

            // Get product (not already deleted)
            $product = Product::where('id', $request->post('product_id'))
                ->where('deleted', 0)
                ->firstOrFail();

            // Soft delete (custom)
            $product->update([
                'deleted' => 1,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Product deleted successfully',
            ]);

        } catch (ModelNotFoundException $e) {

            return response()->json([
                'success' => false,
                'message' => 'Product not found',
            ], 404);

        } catch (\Throwable $e) {

            \Log::error('Delete product error: '.$e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ], 500);
        }
    }

    public function searchProducts(Request $request): JsonResponse
    {
        $search = $request->get('q');

        if (!$search) {
            return response()->json([]);
        }

        $products = \DB::table('products as p')
            ->leftJoin('product_variants as v', 'v.product_id', '=', 'p.id')
            ->where(function ($query) use ($search) {
                $query->where('p.name', 'LIKE', "%{$search}%")
                    ->orWhere('v.sku', 'LIKE', "%{$search}%");
            })
            ->select(
                'p.id',
                'p.name',
                'v.sku'
            )
            ->limit(20)
            ->get();

        return response()->json($products);
    }

    /**
     * Create custom product form
     */
    public function newCustomProduct()
    {
        try {

            $categories = Category::where('deleted', 0)->get();

            return backView('product.new_custom_product', [
                'page'       => 'Custom product',
                'categories' => $categories,
            ], true,true);

        } catch (ModelNotFoundException $e) {
            return redirect()->back()->with('error', 'Product not found');

        } catch (Throwable $e) {
            logger()->error('Product form error', ['message' => $e->getMessage()]);
            return redirect()->back()->with('error', 'Something went wrong');
        }
    }

    public function storeCustomProduct(Request $request): JsonResponse
    {
        DB::beginTransaction();

        try {
            // ✅ Validate request
            $validated = $request->validate([
                'order_id'    => 'nullable|exists:orders,id',
                'name'          => 'required|string|min:3|max:255',
                'category_id'   => 'nullable|exists:categories,id',
                'price'         => 'required|numeric|min:0',
                'sku'           => 'required|string|max:100',
                'quantity'      => 'required|integer|min:0',
                'description'   => 'nullable|string',
                'product_images.*' => 'nullable|image|max:2048',
            ]);
            // ✅ Create custom product
            $productId = DB::table('products')->insertGetId(
                [
                    'name'        => $validated['name'],
                    'slug'        => Str::slug($validated['name']),
                    'category_id' => $validated['category_id'],
                    'price'       => $validated['price'],
                    'sku'         => $validated['sku'],
                    'quantity'    => $validated['quantity'],
                    'description' => $validated['description'] ?? null,
                    'user_id'     => auth()->id(),
                    'custom_product'     => 1,
                ]
            );

            // ✅ Upload new images
            if ($request->hasFile('product_image')) {

                $file  = $request->file('product_image');

                $path = $file->store('products', 'uploads');

                Media::create([
                    'mediaable_id'   => $productId,
                    'mediaable_type' => Product::class,
                    'user_id'        => auth()->id(),
                    'path'           => $path,
                    'disk'           => 'uploads',
                    'mime_type'      => $file->getClientMimeType(),
                    'size'           => $file->getSize(),
                    'is_primary'     => 1,
                    'is_active'      => true,
                ]);
            }

            // Get custom product full inserted row
            $product = DB::table('products')
                ->where('id', $productId)
                ->first();

            // Convert to array
            $productAfter = (array) $product;

            // ✅ Log product
            LoggerService::logModelChange(
                Product::class,
                $productId,
                'create',
                '',
                $productAfter,
                'Add custom product'
            );

            // ✅ Create order item
            $orderItemId = DB::table('order_items')->insertGetId([
                'order_id'   => $validated['order_id'],
                'product_id' => $productId,
                'price'      => $validated['price'],
                'sku'        => $validated['sku'],
                'quantity'   => $validated['quantity'],
                'user_id'    => auth()->id(),
                'created_at' => now(),
            ]);

            // Get full inserted row
            $orderItem = DB::table('order_items')
                ->where('id', $orderItemId)
                ->first();

            // Convert to array
            $orderItemAfter = (array) $orderItem;

            LoggerService::logModelChange(
                Order::class,
                $validated['order_id'],
                'create',
                '',
                $orderItemAfter,
                'Add custom product'
            );

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Product saved successfully',
            ]);

        } catch (ValidationException $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'errors'  => $e->errors(),
            ], 422);

        } catch (\Throwable $e) {
            DB::rollBack();
            logger()->error('Store product error', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ], 500);
        }
    }

}
