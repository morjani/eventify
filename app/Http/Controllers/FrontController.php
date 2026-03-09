<?php

namespace App\Http\Controllers;
use App\Models\Pays;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FrontController extends RootController
{
    public function index(){

        return view('front.index');
    }
   public function create()
{
    $pays = Pays::all();
    return view('front.index', compact('pays'));
}

}
