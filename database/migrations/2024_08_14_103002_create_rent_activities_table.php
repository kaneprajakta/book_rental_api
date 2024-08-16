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
        Schema::create('rent_activities', function (Blueprint $table) {
            $table->id('ra_id');
            $table->integer('ra_b_id'); 
            $table->integer('ra_u_id'); 
            $table->dateTime('ra_rented_on'); 
            $table->dateTime('ra_return_due_on'); 
            $table->dateTime('ra_actual_return_dt')->nullable(); 
            $table->tinyInteger('ra_is_overdue')->default(0); 
            $table->tinyInteger('ra_is_notified')->default(0);
            $table->timestamps();
            $table->foreign('ra_b_id')->references('b_id')->on('books');		
            $table->foreign('ra_u_id')->references('u_id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rent_activities');
    }
};
