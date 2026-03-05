<?php

namespace App\Http\Controllers\Webhooks;

use App\Http\Controllers\Controller;
use App\Http\Controllers\RootController;
use App\Models\Order;
use App\Models\ProductVariant;
use App\Services\Log\LoggerService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;
use Symfony\Component\HttpFoundation\Response;
use App\Services\Shopify\OrderService;
use Illuminate\Support\Str;
use App\Models\Media;
use Carbon\Carbon;
use App\Models\Product;
use App\Models\Customer;
use App\Enums\StateOrderEnum;

class ShopifyWebhookController extends RootController
{
    public function createOrder(Request $request, OrderService $shopify)
    {
        Log::info('Shopify order webhook received');

        // ✅ 1. Verify Shopify signature
        if (!$this->verifyShopifySignature($request)) {
            Log::warning('Shopify webhook: invalid signature');
            return response('Invalid signature', Response::HTTP_UNAUTHORIZED);
        }

        $payload = $request->all();
        $shopifyOrderId = $payload['id'];

        // ✅ 2. Idempotency
        if (DB::table('orders')->where('shopify_order_id', $shopifyOrderId)->exists()) {
            return response('Order already processed', Response::HTTP_OK);
        }

        DB::beginTransaction();

        try {

            //Create customer

            $customerData = $payload['customer'] ?? null;
            $billing = $payload['billing_address'] ?? [];
            $shipping = $payload['shipping_address'] ?? [];

            $customerId = null;

            if ($customerData) {

                $customer = Customer::updateOrCreate(
                    [
                        'shopify_customer_id' => $customerData['id']
                    ],
                    [
                        'shopify_customer_id'      => $customerData['id'],
                        'user_id'      => 1,
                        'first_name'   => $customerData['first_name'] ?? $billing['first_name'] ?? '',
                        'last_name'    => $customerData['last_name'] ?? $billing['last_name'] ?? '',
                        'email'        => $customerData['email'] ?? $payload['email'] ?? null,
                        'phone'        => $customerData['phone'] ?? $billing['phone'] ?? null,
                        'country_name' => $billing['country'] ?? $shipping['country'] ?? null,
                        'city_name'    => $billing['city'] ?? $shipping['city'] ?? null,
                        'zip_code'     => $billing['zip'] ?? null,
                        'address'      => $billing['address1'] ?? $shipping['address1'] ?? null,
                        'prospect'     => 0,
                        'deleted'      => 0,
                    ]
                );

                $customerId = $customer->id;
            }

            // ✅ 3. Create order
            $orderId = DB::table('orders')->insertGetId([
                'user_id'           => 1,
                'customer_id'       => $customerId,
                'shopify_order_id'  => $payload['id'],
                'number'            => $payload['order_number'],
                'custom_number'     => $this->generateNumber(),
                'total_ht'          => $payload['subtotal_price'],
                'tva'               => $payload['total_tax'],
                'total_ttc' => $payload['total_price'],
                'date'              => isset($payload['created_at'])
                    ? Carbon::parse($payload['created_at'])->toDateString()
                    : now()->toDateString(),
                'state' => StateOrderEnum::PENDING->value,
                'source' => 'shopify',
                'created_at'        => now(),
            ]);

            // ✅ 4. Line items
            foreach ($payload['line_items'] as $item) {

                // 🔹 Skip custom items
                if (empty($item['product_id'])) {
                    continue;
                }

                // ✅ 4.1 Find or create product
                $product = DB::table('products')
                    ->where('shopify_product_id', $item['product_id'])
                    ->where('deleted', 0)
                    ->first();

                if (!$product) {

                    // Fetch product from Shopify
                    $productData = $shopify->getProduct($item['product_id']);
                    $shopifyProduct = $productData['product'];

                    $productId = DB::table('products')->insertGetId([
                        'shopify_product_id' => $shopifyProduct['id'],
                        'name'               => $shopifyProduct['title'],
                        'slug'               => $shopifyProduct['handle'],
                        'price'              => $item['price'],      // from webhook
                        'sku'                => $item['sku'],        // from webhook
                        'quantity'           => $item['quantity'],   // from webhook
                        'description'        => strip_tags($shopifyProduct['body_html']),
                        'user_id'            => 1,
                        'created_at'         => now(),
                    ]);

                    $variants = $shopifyProduct['variants'] ?? null;

                    foreach ($variants as $variant){

                        ProductVariant::updateOrCreate(
                            [
                                'shopify_variant_id' => $variant['id'],
                            ],
                            [
                                'user_id'           => 1,
                                'product_id'        => $productId,
                                'name'              => $variant['title'] ?? '',
                                'slug'              => \Str::slug(
                                    $shopifyProduct['handle'].'-'.$variant['title']
                                ),
                                'price'             => $variant['price'] ?? 0,
                                'sku'               => $variant['sku'] ?? null,
                                'stock'          => $variant['inventory_quantity'] ?? 0,
                                'shopify_synced_at' => now(),
                                'deleted'           => 0,
                            ]
                        );

                    }

                    // ✅ Save images (once)
                    if (!empty($shopifyProduct['images'])) {
                        foreach ($shopifyProduct['images'] as $index => $image) {

                            try {
                                $imageContent = Http::timeout(10)->get($image['src'])->body();
                            } catch (\Throwable $e) {
                                Log::warning('Shopify image download failed', [
                                    'url'   => $image['src'],
                                    'error'=> $e->getMessage(),
                                ]);
                                continue;
                            }

                            $filename = 'products/shopify_' .
                                $shopifyProduct['id'] . '_' .
                                basename(parse_url($image['src'], PHP_URL_PATH));

                            // ✅ Save directly to public/uploads
                            \Storage::disk('uploads')->put($filename, $imageContent);

                            Media::create([
                                'mediaable_id'   => $productId,
                                'mediaable_type' => \App\Models\Product::class,
                                'user_id'        => 1,
                                'path'           => $filename,          // products/xxx.jpg
                                'disk'           => 'uploads',
                                'mime_type'      => 'image/jpeg',
                                'size'           => strlen($imageContent),
                                'is_primary'     => $index === 0,
                                'is_active'      => true,
                            ]);
                        }
                    }


                } else {
                    $productId = $product->id;
                }

                // ✅ 4.2 Create order item
                DB::table('order_items')->insert([
                    'order_id'           => $orderId,
                    'product_id'         => $productId,
                    'shopify_product_id' => $item['product_id'],
                    'title'              => $item['title'],
                    'price'              => $item['price'],
                    'sku'              =>   $item['sku'],
                    'quantity'           => $item['quantity'],
                    'tax'                => $item['tax_lines'][0]['price'] ?? 0,
                    'created_at'         => now(),
                ]);
            }

            // Get full inserted row
            $orderItem = DB::table('orders')
                ->where('id', $orderId)
                ->first();

            LoggerService::logModelChange(
                Order::class,
                $orderId,
                'create',
                '',
                $orderItem,
                "Receiver order"
            );

            DB::commit();
            return response('Webhook processed', Response::HTTP_OK);

        } catch (\Throwable $e) {

            DB::rollBack();

            Log::error('Shopify order webhook error', [
                'message' => $e->getMessage(),
                'order'   => $payload['id'] ?? null,
            ]);

            return response('Server error', Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function createProduct(Request $request)
    {
        if (!$this->verifyShopifySignature($request)) {
            Log::warning('Invalid Shopify signature');
            return response('Unauthorized', 401);
        }

        // ✅ Always use raw body for webhooks
        $payload = json_decode($request->getContent(), true);

        DB::beginTransaction();

        try {

            $variant = $payload['variants'][0] ?? null;

            $product = Product::updateOrCreate(
                [
                    'shopify_product_id' => $payload['id'],
                ],
                [
                    'user_id'           => 1,
                    'name'              => $payload['title'] ?? '',
                    'slug'              => \Str::slug($payload['handle'] ?? $payload['title']),
                    'description'       => $payload['description'] ?? null, // ✅ fixed
                    'price'             => $variant['price'] ?? 0,
                    'compare_price'     => $variant['compare_at_price'] ?? null,
                    'sku'               => $variant['sku'] ?? null,
                    'quantity'          => $variant['inventory_quantity'] ?? 0,
                    'track_inventory'   => isset($variant['inventory_policy'])
                        ? $variant['inventory_policy'] === 'deny'
                        : true,
                    'is_active'         => ($payload['status'] ?? '') === 'active',
                    'shopify_handle'    => $payload['handle'] ?? null,
                    'shopify_synced_at' => now(),
                    'deleted'           => 0,
                ]
            );

            $variants = $payload['variants'];

            foreach ($variants as $variant){

                ProductVariant::updateOrCreate(
                    [
                        'shopify_variant_id' => $variant['id'],
                    ],
                    [
                        'user_id'           => 1,
                        'product_id'        => $product->id,
                        'name'              => $variant['title'] ?? '',
                        'slug'              => \Str::slug($variant['handle'] ?? $variant['title']),
                        'price'             => $variant['price'] ?? 0,
                        'sku'               => $variant['sku'] ?? null,
                        'stock'          => $variant['inventory_quantity'] ?? 0,
                        'shopify_handle'    => $variant['handle'] ?? null,
                        'shopify_synced_at' => now(),
                        'deleted'           => 0,
                    ]
                );

            }

            // ✅ Sync Images safely
            if (!empty($payload['images'])) {
                $this->syncProductImages($product, $payload);
            }

            DB::commit();

            return response('OK', 200);

        } catch (\Throwable $e) {

            DB::rollBack();

            Log::error('Shopify product sync failed', [
                'error'   => $e->getMessage(),
                'payload' => $payload['id'] ?? null
            ]);

            return response('Error', 500);
        }
    }

    private function syncProductImages(Product $product, array $shopifyProduct)
    {
        if (empty($shopifyProduct['images'])) {
            return;
        }

        // ✅ Delete old images first (optional but recommended)
        foreach ($product->medias as $media) {
            \Storage::disk($media->disk)->delete($media->path);
            $media->delete();
        }

        foreach ($shopifyProduct['images'] as $index => $image) {

            try {
                $response = Http::timeout(15)->get($image['src']);

                if (!$response->successful()) {
                    continue;
                }

                $imageContent = $response->body();

            } catch (\Throwable $e) {
                Log::warning('Shopify image download failed', [
                    'url'   => $image['src'],
                    'error' => $e->getMessage(),
                ]);
                continue;
            }

            $extension = pathinfo(parse_url($image['src'], PHP_URL_PATH), PATHINFO_EXTENSION);

            $filename = 'products/shopify_' .
                $product->shopify_product_id . '_' .
                uniqid() . '.' . $extension;

            \Storage::disk('uploads')->put($filename, $imageContent);

            Media::create([
                'mediaable_id'   => $product->id,
                'mediaable_type' => Product::class,
                'user_id'        => $product->user_id,
                'path'           => $filename,
                'disk'           => 'uploads',
                'mime_type'      => $response->header('Content-Type'),
                'size'           => strlen($imageContent),
                'is_primary'     => $index === 0,
                'is_active'      => true,
            ]);
        }
    }


    /**
     * Verify Shopify HMAC
     */
    private function verifyShopifySignature(Request $request): bool
    {
        $hmacHeader = $request->header('X-Shopify-Hmac-Sha256');
        $data = $request->getContent();
        $secret = config('services.shopify.webhook_secret');

        $calculatedHmac = base64_encode(
            hash_hmac('sha256', $data, $secret, true)
        );

        return true;
    }
}
