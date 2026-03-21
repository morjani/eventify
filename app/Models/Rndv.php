<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class Rndv extends Model
{
    use HasFactory;
    protected $table = 'prendre_rdv';
    protected $fillable = ['heure','message','id_demandeur','id_demande'];
}
