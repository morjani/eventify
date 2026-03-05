<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'category_id',
        'name',
        'slug',
        'description',
        'price',
        'compare_price',
        'sku',
        'quantity',
        'custom_product',
        'track_inventory',
        'is_active',
        'shopify_product_id',
        'shopify_handle',
        'shopify_synced_at',
        'deleted',
    ];

    protected $casts = [
        'price'              => 'decimal:2',
        'compare_price'      => 'decimal:2',
        'quantity'           => 'integer',
        'track_inventory'    => 'boolean',
        'is_active'          => 'boolean',
        'shopify_synced_at'  => 'datetime',
    ];

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function medias()
    {
        return $this->morphMany(Media::class, 'mediaable');
    }

    public function primaryMedia()
    {
        return $this->morphOne(Media::class, 'mediaable')
            ->where('is_primary', true);
    }

    /*
    |--------------------------------------------------------------------------
    | Scopes
    |--------------------------------------------------------------------------
    */

    public function scopeActive($query)
    {
        return $query->where('is_active', true)
            ->where('deleted', 0);
    }

    /*
    |--------------------------------------------------------------------------
    | Helpers
    |--------------------------------------------------------------------------
    */

    public function getImageAttribute(): ?string
    {
        return $this->primaryMedia?->full_url;
    }
}
