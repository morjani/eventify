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
        Schema::create('product_variants', function (Blueprint $table) {

            $table->id();

            // Relation (manual bigint instead of foreignId)
            $table->unsignedBigInteger('product_id');
            $table->unsignedBigInteger('user_id');

            // Variant Info
            $table->string('name')->nullable();   // Example: Red - XL
            $table->string('sku')->nullable();
            $table->string('barcode')->nullable();

            // Pricing
            $table->decimal('price', 12, 2)->nullable();
            $table->decimal('compare_price', 12, 2)->nullable();

            // Stock
            $table->integer('stock')->default(0);
            $table->boolean('manage_stock')->default(true);

            // Shopify Fields
            $table->unsignedBigInteger('shopify_variant_id')->nullable();
            $table->string('shopify_handle')->nullable();
            $table->timestamp('shopify_synced_at')->nullable();

            // Status
            $table->boolean('is_active')->default(true);

            $table->integer('deleted')->default(0);

            $table->timestamps();


        });
    }

    public function down(): void
    {
        Schema::dropIfExists('product_variants');
    }
};
