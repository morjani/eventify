<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('prendre_rdv', function (Blueprint $table) {
            $table->enum('status', ['en attente', 'confirmé', 'annulé'])->default('en attente')->after('id_demandeur');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('prendre_rdv', function (Blueprint $table) {
            $table->dropColumn('status');
        });
    }
};