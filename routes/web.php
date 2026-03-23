<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FrontController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\RdvController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ParticipantController;


Route::middleware('auth')->group(function () {



    Route::middleware(['auth', 'role:admin,participant'])->group(function () {

        Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
        Route::patch('/profile', [ProfileController::class, 'update'])->name(name: 'profile.update');
        Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

        Route::get('/rdv',[RdvController::class,'index'])->name('rdv.index');
        Route::get('/ajax/page-event',[RdvController::class,'PageEvent'])->name('page-event');
        Route::get('/ajax/rdv-cancel-form/{id_rdv}', [RdvController::class, 'cancelForm'])->name('rdv.cancel-form');
        Route::post('/ajax/rdv-change-status',[RdvController::class,'changeStatus'])->name('rdv.change-status');
        Route::get('/ajax/dt-participants',[ParticipantController::class,'dtParticipants'])->name('dt-participants');
        Route::post('/ajax/Rndv',[ParticipantController::class,'store'])->name('Rndv');
        Route::post('/ajax/store-user', [UserController::class, 'store'])->name('user.store');
        Route::get('/',[FrontController::class,'create'])->name('index');
        Route::get('/participants',[ParticipantController::class,'index'])->name('participant.index');
        Route::get('/ajax/prendre-rdv',[ParticipantController::class,'prendreRdv'])->name('prendre.rdv');
        Route::get('/ajax/available-hours/{participantId}',[ParticipantController::class,'getAvailableHours'])->name('available-hours');

        Route::get('/logout', [AuthController::class, 'logout'])->name('logout');




    });

    Route::middleware(['auth', 'role:admin'])->group(function () {

        Route::get('/config-event/{id_event}', [RDVController::class, 'edit'])->name('config-event');
        Route::put('/config-event/{id_event}', [RDVController::class, 'update'])->name('update-config-event');


    });




});

Route::get('/clear-cache', function() {
    Artisan::call('cache:clear');
});

require __DIR__.'/auth.php';
