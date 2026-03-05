<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    /**
     * The attributes that are mass assignable.
     * These are the columns you can safely fill via create() or update().
     */
    protected $fillable = [
        'guard_name',       // Role name (e.g., "Admin", "Customer Support")
        'name',        // Role key (e.g., "admin", "support") for programmatic checks
    ];

    /**
     * Define a relationship: A Role can have many Users.
     *
     * Example usage:
     *   $role = Role::find(1);
     *   $users = $role->users; // Collection of all users with this role
     */
    public function users()
    {
        return $this->hasMany(User::class);
    }
}
