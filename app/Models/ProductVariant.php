<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductVariant extends Model
{
    protected $fillable = [
        'user_id',
        'product_id',
        'name',
        'sku',
        'barcode',
        'price',
        'compare_price',
        'stock',
        'manage_stock',
        'is_active',
        'shopify_variant_id',
        'shopify_handle',
        'shopify_synced_at',
        'deleted',
    ];

    protected $casts = [
        'price'               => 'decimal:2',
        'compare_price'       => 'decimal:2',
        'manage_stock'        => 'boolean',
        'is_active'           => 'boolean',
        'shopify_synced_at'   => 'datetime',
    ];

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

    /*
    |--------------------------------------------------------------------------
    | Helpers
    |--------------------------------------------------------------------------
    */

    public function isSyncedToShopify(): bool
    {
        return !is_null($this->shopify_variant_id);
    }
}
