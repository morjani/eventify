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
        Schema::create('order_items', function (Blueprint $table) {
            $table->id();

            // Relations
            $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('order_id')->index(); // local order id
            $table->unsignedBigInteger('product_id')->nullable();
            $table->unsignedBigInteger('shopify_product_id')->nullable();
            $table->unsignedBigInteger('shopify_variant_id')->nullable();

            // Product info snapshot (never trust future changes)
            $table->string('title');
            $table->string('sku')->nullable();

            // Pricing
            $table->decimal('price', 10, 2);
            $table->integer('quantity')->default(1);
            $table->decimal('total_discount', 10, 2)->default(0);
            $table->decimal('tax', 10, 2)->default(0);

            // Meta
            $table->boolean('requires_shipping')->default(true);
            $table->boolean('is_gift_card')->default(false);
            $table->string('vendor')->nullable();

            // Raw payload (optional but VERY useful)
            $table->json('payload')->nullable();

            $table->integer('deleted')->default(0);

            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_items');
    }
};
