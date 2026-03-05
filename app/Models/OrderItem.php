<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class OrderItem extends Model
{
    // Mass assignable attributes
    protected $fillable = [
        'user_id',
        'order_id',
        'product_id',
        'shopify_product_id',
        'shopify_variant_id',
        'title',
        'sku',
        'price',
        'quantity',
        'total_discount',
        'tax',
        'requires_shipping',
        'is_gift_card',
        'vendor',
        'payload',
        'deleted',
    ];

    // Casts
    protected $casts = [
        'payload' => 'array',
        'requires_shipping' => 'boolean',
        'is_gift_card' => 'boolean',
        'price' => 'decimal:2',
        'total_discount' => 'decimal:2',
        'tax' => 'decimal:2',
        'deleted' => 'boolean',
    ];

    // ----------------------
    // Relationships
    // ----------------------

    /**
     * The order this item belongs to.
     */
    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class);
    }

    /**
     * The product this item belongs to (if synced locally).
     */
    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class);
    }

    /**
     * The user who created or processed this item.
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    // ----------------------
    // Scopes
    // ----------------------

    /**
     * Only non-deleted items.
     */
    public function scopeActive($query)
    {
        return $query->where('deleted', 0);
    }
}
