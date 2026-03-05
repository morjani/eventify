<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Order extends Model
{
    // Mass assignable attributes
    protected $fillable = [
        'date',
        'user_id',
        'customer_id',
        'shopify_order_id',
        'shopify_handle',
        'shopify_synced_at',
        'number',
        'custom_number',
        'reference',
        'state',
        'status_shipping',
        'payment_method',
        'total_ht',
        'total_ttc',
        'tva',
        'description',
        'note',
        'source',
        'customer_address',
        'cancel_reason',
        'deleted',
        'sort',
    ];

    // Casts for proper types
    protected $casts = [
        'date' => 'date',
        'shopify_synced_at' => 'datetime',
        'total_ht' => 'decimal:2',
        'total_ttc' => 'decimal:2',
        'tva' => 'decimal:2',
        'deleted' => 'boolean',
        'sort' => 'integer',
    ];

    // ----------------------
    // Relationships
    // ----------------------

    /**
     * The user who created or processed the order
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * The customer who placed the order
     */
    public function customer(): BelongsTo
    {
        return $this->belongsTo(Customer::class); // Assuming you have a Customer model
    }

    /**
     * Order items for this order
     */
    public function items(): HasMany
    {
        return $this->hasMany(OrderItem::class);
    }

    // ----------------------
    // Scopes
    // ----------------------

    /**
     * Only non-deleted orders
     */
    public function scopeActive($query)
    {
        return $query->where('deleted', 0);
    }

    /**
     * No Respones items for this order
     */

    public function noResponses()
    {
        return $this->hasMany(OrderNoResponse::class, 'order_id');
    }
}
