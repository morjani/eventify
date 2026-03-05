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
        Schema::create('medias', function (Blueprint $table) {
            $table->id();

            // Polymorphic relation
            $table->unsignedBigInteger('mediaable_id');
            $table->string('mediaable_type');

            $table->unsignedBigInteger('user_id')->nullable();

            // File data
            $table->string('path');
            $table->string('url')->nullable();
            $table->string('disk')->default('public');
            $table->string('alt')->nullable();
            $table->integer('position')->default(0);

            // Metadata
            $table->string('mime_type')->nullable();
            $table->integer('size')->nullable();
            $table->integer('width')->nullable();
            $table->integer('height')->nullable();

            // Status
            $table->boolean('is_primary')->default(false);
            $table->boolean('is_active')->default(true);

            $table->timestamps();

            $table->index(['mediaable_id', 'mediaable_type']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('medias');
    }
};
