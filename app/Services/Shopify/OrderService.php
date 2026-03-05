<?php

namespace App\Services\Shopify;

use App\Models\Shop;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Client\RequestException;
use Illuminate\Http\Client\ConnectionException;
use Illuminate\Contracts\Encryption\DecryptException;

class OrderService
{
    protected string $shop;
    protected ?string $token;
    protected string $version;

    /**
     * Constructeur
     */
    public function __construct()
    {
        $shop = DB::table('shops')
            ->where('shop_domain', 'eqpca6-z4.myshopify.com')
            ->where('is_active', true)
            ->first();

        $this->shop = $shop->shop_domain;
        $this->version = config('services.shopify.version');

        try {
            $this->token = $shop->access_token;
        } catch (DecryptException $e) {
            Log::error("Token corrompu pour shop {$shop->shop_domain}");
            $shop->access_token = null;
            $shop->save();

            $this->token = null;
            throw new \RuntimeException("Le token est corrompu, merci de réinstaller l'application.");
        }
    }

    /**
     * Envoie la requête Shopify avec retry automatique sur 401
     */
    protected function request(string $endpoint, array $params = [], bool $retry = true)
    {
        try {
            return $this->sendRequest($endpoint, $params);
        } catch (RequestException $e) {

            // 401 Unauthorized → token invalide
            if ($e->response?->status() === 401 && $retry) {
                Log::warning("Shopify token invalid, regenerating token for shop {$this->shop}");

                $newToken = $this->regenerateToken();

                if (!$newToken) {
                    throw new \RuntimeException('Impossible de régénérer le token Shopify. Veuillez réinstaller l’application.');
                }

                $this->token = $newToken;

                // Retry une seule fois
                return $this->request($endpoint, $params, false);
            }

            // Autres erreurs
            Log::error('Shopify API error', [
                'endpoint' => $endpoint,
                'status' => $e->response?->status(),
                'body' => $e->response?->json(),
            ]);

            throw $e;
        } catch (ConnectionException $e) {
            Log::critical('Shopify connection error', [
                'endpoint' => $endpoint,
                'message' => $e->getMessage(),
            ]);

            throw $e;
        }
    }

    /**
     * Effectue la requête HTTP vers Shopify
     */
    protected function sendRequest(string $endpoint, array $params = [])
    {
        if (!$this->token) {
            throw new \RuntimeException("Token Shopify manquant pour le shop {$this->shop}");
        }

        $response = Http::timeout(10)
            ->retry(3, 500, function ($exception) {
                return $exception instanceof ConnectionException
                    || ($exception instanceof RequestException
                        && in_array($exception->response?->status(), [429, 500, 502, 503]));
            })
            ->withHeaders([
                'X-Shopify-Access-Token' => $this->token,
                'Accept' => 'application/json',
            ])
            ->get("https://{$this->shop}/admin/api/{$this->version}/{$endpoint}", $params)
            ->throw();

        return $response->json();
    }

    /**
     * Régénère un nouveau token via OAuth et met à jour la DB
     */
    protected function regenerateToken(): ?string
    {
        try {
            $shop = DB::table('shops')
                ->where('shop_domain', 'eqpca6-z4.myshopify.com')
                ->where('is_active', true)
                ->first();

            if (!$shop) {
                Log::error("No OAuth code stored for shop {$this->shop}");
                return null;
            }

            $response = Http::post("https://{$this->shop}/admin/oauth/access_token", [
                'client_id'     => config('services.shopify.client_id'),
                'client_secret' => config('services.shopify.client_secret'),
                'grant_type'          => 'client_credentials',
            ])->throw();


            $data = $response->json();

            DB::table('shops')
                ->where('id', $shop->id)
                ->update([
                    'access_token' => $data['access_token'],
                    'updated_at'    => now(),
                ]);

            return $data['access_token'];
        } catch (\Throwable $e) {
            Log::error("Failed to regenerate Shopify token", [
                'shop' => $this->shop,
                'error' => $e->getMessage(),
            ]);
            return null;
        }
    }

    // ==============================
    // Méthodes publiques pour Shopify
    // ==============================

    public function getOrders(array $params = [])
    {
        return $this->request('orders.json', $params);
    }

    public function getProduct(int $productId)
    {
        return $this->request("products/{$productId}.json");
    }

    public function getVariant(int $variantId)
    {
        return $this->request("variants/{$variantId}.json");
    }
}
