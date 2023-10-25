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
        Schema::create('uts_tables', function (Blueprint $table) {
            $table->id();
            $table->string('genre');
            $table->string('reports');
            $table->integer('age');
            $table->double('gpa');
            $table->integer('year');
            $table->integer('count');
            $table->string('gender');
            $table->string('nationality');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('uts_tables');
    }
};