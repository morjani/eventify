<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Customer extends Model
{
    use HasFactory;

    protected $table = 'customers';

    protected $fillable = [
        'shopify_customer_id',
        'user_id',
        'first_name',
        'last_name',
        'phone',
        'mobile',
        'fax',
        'email',
        'country_id',
        'country_name',
        'city_id',
        'city_name',
        'zip_code',
        'address',
        'prospect',
        'deleted',
    ];

    protected $casts = [
        'user_id'    => 'integer',
        'country_id' => 'integer',
        'city_id'    => 'integer',
        'prospect'   => 'boolean',
        'deleted'    => 'boolean',
    ];

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Uncomment if you have these models
    /*
    public function country()
    {
        return $this->belongsTo(Country::class);
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }
    */

    /*
    |--------------------------------------------------------------------------
    | Accessors
    |--------------------------------------------------------------------------
    */

    public function getFullNameAttribute()
    {
        return trim($this->first_name . ' ' . $this->last_name);
    }

    /*
    |--------------------------------------------------------------------------
    | Scopes
    |--------------------------------------------------------------------------
    */

    public function scopeActive($query)
    {
        return $query->where('deleted', 0);
    }

    public function scopeProspects($query)
    {
        return $query->where('prospect', 1);
    }
}
