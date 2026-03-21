<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class Prendre extends Model
{
   use HasFactory;

    protected $fillable = [
      'last_name','first_name','name','id_pays','ville','email','phone','role_id','password'
    ];
     public function pays()
    {
        return $this->belongsTo(Pays::class);
    }

    public function role()
    {
        return $this->belongsTo(Role::class);
    }

}
