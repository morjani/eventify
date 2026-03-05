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
        Schema::create('orders', function (Blueprint $table) {
            $table->id(); // Primary key

            $table->date('date'); // Date of the order

            //Relation
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('customer_id');
            $table->unsignedBigInteger('shopify_order_id')->nullable()->index();
            $table->string('shopify_handle')->nullable();
            $table->timestamp('shopify_synced_at')->nullable();

            $table->string('number')->nullable(); // Internal order number
            $table->string('custom_number')->nullable();
            $table->string('reference')->nullable(); // Reference from external system

            $table->string('state')->nullable(); // Order state (e.g., pending, confirmed)
            $table->string('status_shipping')->nullable();
            $table->string('payment_method')->nullable(); // Payment method

            $table->decimal('total_ht', 12, 2)->default(0); // Total HT (before tax)
            $table->decimal('total_ttc', 12, 2)->default(0); // Total TTC (with tax)
            $table->decimal('tva', 12, 2)->default(0); // TVA amount

            $table->text('description')->nullable(); // Optional description
            $table->text('note')->nullable();
            $table->string('source')->nullable()->default('crm');
            $table->text('customer_address')->nullable(); // Customer address
            $table->text('cancel_reason')->nullable(); // cancel reason

            $table->integer('deleted')->default(0); // Soft-delete flag (0 = active, 1 = deleted)

            $table->integer('sort')->default(0); // Sort order for admin list

            $table->timestamps(); // created_at and updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
