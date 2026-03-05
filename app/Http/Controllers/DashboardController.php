<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends RootController
{
    public function index(){

        backView('dashboard.dashboard',['page'=>'Dashboard']);
    }
}
