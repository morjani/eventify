<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Media extends Model
{
    use HasFactory;

    protected $table = 'medias'; // optional, but explicit

    protected $fillable = [
        'mediaable_id',
        'mediaable_type',
        'user_id',
        'path',
        'url',
        'disk',
        'alt',
        'position',
        'mime_type',
        'size',
        'width',
        'height',
        'is_primary',
        'is_active',
    ];

    protected $casts = [
        'is_primary' => 'boolean',
        'is_active'  => 'boolean',
        'size'       => 'integer',
        'width'      => 'integer',
        'height'     => 'integer',
        'position'   => 'integer',
    ];

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */

    // Polymorphic relation
    public function mediaable()
    {
        return $this->morphTo();
    }

    // Uploader (optional)
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /*
    |--------------------------------------------------------------------------
    | Scopes (best practice)
    |--------------------------------------------------------------------------
    */

    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    public function scopePrimary($query)
    {
        return $query->where('is_primary', true);
    }

    /*
    |--------------------------------------------------------------------------
    | Helpers
    |--------------------------------------------------------------------------
    */

    public function getFullUrlAttribute(): string
    {
        return $this->url ?? \Storage::disk($this->disk)->url($this->path);
    }
}
