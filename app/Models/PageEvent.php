<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PageEvent extends Model
{
    use HasFactory;

    protected $fillable = [
      'heure','message','id_demande','id_demandeur','date'
    ];
     public function evenements()
    {
        return $this->belongsTo(Evenement::class);
    }

   
}
