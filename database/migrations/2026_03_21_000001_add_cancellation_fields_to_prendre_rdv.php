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
            if (!Schema::hasColumn('prendre_rdv', 'motif_annulation')) {
                $table->text('motif_annulation')->nullable()->after('status');
            }
            if (!Schema::hasColumn('prendre_rdv', 'annule_par')) {
                $table->unsignedBigInteger('annule_par')->nullable()->after('motif_annulation');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('prendre_rdv', function (Blueprint $table) {
            $table->dropColumn(['motif_annulation', 'annule_par']);
        });
    }
};