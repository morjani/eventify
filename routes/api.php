<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Webhooks\ShopifyWebhookController;
use App\Http\Controllers\OrderController;

// Shopify webhook route
Route::post('/webhooks/shopify/create-order', [ShopifyWebhookController::class, 'createOrder']);
Route::post('/webhooks/shopify/create-product', [ShopifyWebhookController::class, 'createProduct']);

//Load order

