<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    // Fillable fields for mass assignment
    protected $fillable = [
        'user_id',
        'action',
        'model_type',
        'model_id',
        'before',
        'after',
        'ip_address',
        'user_agent',
        'description',
        'log_at',
    ];

    // Cast JSON columns to array automatically
    protected $casts = [
        'before' => 'array',
        'after'  => 'array',
        'log_at' => 'datetime',
    ];

    /**
     * The user who performed the action
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
