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
        Schema::create('logs', function (Blueprint $table) {
            $table->id();

            // User who performed the action
            $table->unsignedBigInteger('user_id')->nullable()->index();

            // Type of action: create, update, delete
            $table->string('action', 50);

            // Affected model/table
            $table->string('model_type')->nullable();
            $table->unsignedBigInteger('model_id')->nullable();

            // Snapshots of the data before and after
            $table->json('before')->nullable();
            $table->json('after')->nullable();

            // Optional: IP and User Agent for auditing
            $table->string('ip_address', 45)->nullable();
            $table->string('user_agent')->nullable();

            // Optional description for extra context
            $table->text('description')->nullable();

            // Log timestamp
            $table->timestamp('log_at')->useCurrent();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('logs');
    }
};
