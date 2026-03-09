<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FrontController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\Webhooks\ShopifyWebhookController;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\AuthController; 
use App\Http\Controllers\UserController;



/*Route::post('/webhooks/shopify/orders', [ShopifyWebhookController::class, 'orderCreated'])->name('orderCreated');*/
Route::post('/ajax/store-user', [UserController::class, 'store'])->name('user.store');
Route::get('/',[FrontController::class,'create'])->name('index');

Route::middleware('auth')->group(function () {



    Route::middleware(['auth', 'role:admin,order_confirmation'])->group(function () {

        Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
        Route::patch('/profile', [ProfileController::class, 'update'])->name(name: 'profile.update');
        Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');


        Route::get('/product/categories',[CategoryController::class,'index'])->name('categories');
        Route::get('/ajax/dt-categories',[CategoryController::class,'dtCategories'])->name('dt-categories');
        Route::get('/ajax/new-category',[CategoryController::class,'newCategory'])->name('new-category');
        Route::get('/ajax/new-category/{id}',[CategoryController::class,'newCategory'])->name('new-category');
        Route::post('/ajax/store-category',[CategoryController::class,'storeCategory'])->name('store-category');
        Route::post('/ajax/delete-category',[CategoryController::class,'deleteCategory'])->name('delete-category');

        Route::get('/products',[ProductController::class,'index'])->name('products');
        Route::get('/ajax/dt-products',[ProductController::class,'dtProducts'])->name('dt-products');
        Route::get('/ajax/new-product',[ProductController::class,'newProduct'])->name('new-product');
        Route::get('/ajax/new-product/{id}',[ProductController::class,'newProduct'])->name('new-product');
        Route::post('/ajax/store-product',[ProductController::class,'storeProduct'])->name('store-product');
        Route::post('/ajax/delete-product',[ProductController::class,'deleteProduct'])->name('delete-product');

        Route::get('/ajax/new-order',[OrderController::class,'newOrder'])->name('new-order');
        Route::post('/ajax/store-order',[OrderController::class,'storeOrder'])->name('store-order');
        Route::get('/shopify/orders',[OrderController::class,'orders'])->name('shopify-orders');

        Route::get('/ajax/order-new-product',[OrderController::class,'orderNewProduct'])->name('order-new-product');
        Route::get('/ajax/get-variants-product/{id}',[OrderController::class,'getVariantsProduct'])->name('get-variants-product');
        Route::post('/ajax/store-order-product',[OrderController::class,'storeOrderProduct'])->name('store-order-product');
        Route::get('/ajax/edit-order-item/{id}',[OrderController::class,'editOrderItem'])->name('edit-order-item');
        Route::post('/ajax/update-order-item/{id}',[OrderController::class,'updateOrderItem'])->name('update-order-item');
        Route::post('/ajax/delete-order-item',[OrderController::class,'deleteOrderItem'])->name('delete-order-item');
        Route::get('/ajax/edit-order-customer/{id}',[OrderController::class,'editOrderCustomer'])->name('edit-order-customer');
        Route::post('/ajax/update-order-customer',[OrderController::class,'updateOrderCustomer'])->name('update-order-customer');
        Route::post('/ajax/change-order-status', [OrderController::class, 'changeStatusOrder'])->name('change-order-status');
        Route::post('/ajax/order-no-response', [OrderController::class, 'orderNoResponse'])->name('order-no-response');
        Route::get('/ajax/order-cancel-reason/{id}', [OrderController::class, 'orderCancelReason'])->name('order-cancel-reason');
        Route::get('/ajax/search-products', [ProductController::class, 'searchProducts'])->name('search-product');
        Route::get('/ajax/new-custom-product', [ProductController::class, 'newCustomProduct'])->name('new-custom-product');
        Route::post('/ajax/store-custom-product', [ProductController::class, 'storeCustomProduct'])->name('store-custom-product');
        Route::get('/ajax/search-customers', [CustomerController::class, 'searchCustomers'])->name('search-customers');
        Route::get('/ajax/get-customer/{id}', [CustomerController::class, 'getCustomer'])->name('get-customer');
        Route::get('/ajax/check-order-number', [OrderController::class, 'checkNumber'])->name('check-order-number');
        Route::get('/ajax/edit-order-note/{id}', [OrderController::class, 'editOrderNote'])->name('edit-order-note');
        Route::post('/ajax/update-order-note', [OrderController::class, 'updateOrderNote'])->name('update-order-note');
        Route::post('/ajax/order/update-total-price', [OrderController::class, 'updateTotalPrice'])->name('update-total-price');


    });

    Route::middleware(['auth', 'role:admin,order_confirmation,order_handler'])->group(function () {

        Route::get('/orders',[OrderController::class,'index'])->name('orders');
        Route::get('/ajax/order-statis',[OrderController::class,'billStatis'])->name('bill-statis');
        Route::get('/ajax/dt-orders',[OrderController::class,'dtOrders'])->name('dt-orders');
        Route::get('/order/details/{id}',[OrderController::class,'detailsOrder'])->name('details-order');
        Route::get('/order/load/{id}',[OrderController::class,'loadOrder'])->name('load-order');
        Route::get('/order/load-products/{id}',[OrderController::class,'loadOrderProducts'])->name('load-order-products');
        Route::get('/order/recent-activities/{id}',[OrderController::class,'recentActivities'])->name('order-recent-activities');
        Route::post('/ajax/update-shipping-status',[OrderController::class,'updateShippingStatus'])->name('update-shipping-status');
        Route::post('/ajax/order/cancel-shipping', [OrderController::class, 'cancelShipping'])->name('order_cancel_shipping');
        Route::get('/logout', [AuthController::class, 'logout'])->name('logout');

    });




});

Route::get('/clear-cache', function() {
    Artisan::call('cache:clear');
});

require __DIR__.'/auth.php';
