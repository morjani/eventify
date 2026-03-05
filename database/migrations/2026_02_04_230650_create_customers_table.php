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
        Schema::create('customers', function (Blueprint $table) {
            $table->id(); // Primary key, bigint unsigned, auto_increment

            $table->unsignedBigInteger('user_id')->nullable(); // Related user ID (optional)
            $table->unsignedBigInteger('shopify_customer_id')->nullable();

            $table->string('first_name')->nullable(); // Customer first name
            $table->string('last_name')->nullable();  // Customer last name
            $table->string('phone')->nullable();      // Phone number
            $table->string('mobile')->nullable();     // Mobile number
            $table->string('fax')->nullable();        // Fax
            $table->string('email')->nullable();      // Email

            $table->unsignedBigInteger('country_id')->nullable(); // Country reference (integer)
            $table->unsignedBigInteger('city_id')->nullable();    // City reference (integer)
            $table->string('zip_code')->nullable();               // Zip code

            $table->text('address')->nullable(); // Full address

            $table->integer('prospect')->default(0); // Flag if prospect (default 0)
            $table->integer('deleted')->default(0);  // Soft-delete flag (0 = active, 1 = deleted)

            $table->timestamps(); // created_at and updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('customers');
    }
};
