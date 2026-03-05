<?php

namespace App\Http\Controllers\Webhooks;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Symfony\Component\HttpFoundation\Response;

class ShopifyWebhookController extends Controller
{
    public function orderCreated(Request $request)
    {
        Log::info('Shopify order webhook okkkkk');

        // ✅ 1. Verify signature
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

            // ✅ 3. Create order
            $orderId = DB::table('orders')->insertGetId([
                'user_id'        => 1,
                'customer_id' => 1,
                'shopify_order_id'  => $payload['id'],
                'number'      => $payload['order_number'],
                /*'currency'          => $payload['currency'],*/
                'total_ht'          => $payload['subtotal_price'],
                'tva'               => $payload['total_tax'],
                'total_ttc'          => $payload['total_shipping_price_set']['shop_money']['amount'] ?? 0,
                /*'total'             => $payload['total_price'],*/
                /*'customer_email'    => $payload['email'],*/
                /*'payload'           => json_encode($payload),*/
                'date'             => isset($payload['created_at'])
                    ? \Carbon\Carbon::parse($payload['created_at'])->toDateString()
                    : now()->toDateString(),
                'created_at'        => now(),
            ]);

            // ✅ 4. Line items
            foreach ($payload['line_items'] as $item) {

                // 🔹 Skip custom items (Shopify allows product_id = null)
                if (!$item['product_id']) {
                    continue;
                }

                // ✅ 4.1 Find or create product
                $product = DB::table('products')
                    ->where('shopify_product_id', $item['product_id'])
                    ->first();

                if (!$product) {
                    $productId = DB::table('products')->insertGetId([
                        'shopify_product_id' => $item['product_id'],
                        'name'              => $item['title'],
                        'price'              => $item['price'],
                        'created_at'         => now(),
                        'user_id'        => 1,

                    ]);
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
                    'quantity'           => $item['quantity'],
                    'tax'                => $item['tax_lines'][0]['price'] ?? 0,
                    'created_at'         => now(),
                ]);
            }

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

        return hash_equals($hmacHeader, $calculatedHmac);
    }

}
