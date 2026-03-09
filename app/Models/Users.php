<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Users extends Model
{
    protected $fillable = ['last_name','first_name','id_pays','ville','email','password'];
}
