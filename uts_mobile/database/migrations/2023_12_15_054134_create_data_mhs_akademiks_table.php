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
        Schema::create('data_mhs_akademiks', function (Blueprint $table) {
            $table->id();
            $table->string('nim');
            $table->string('name');
            $table->string('status_akhir');
            $table->string('status_2018_1');
            $table->double('ipk_2018_1');
            $table->integer('sks_2018_1');
            $table->string('status_2018_2');
            $table->double('ipk_2018_2');
            $table->integer('sks_2018_2');
            $table->string('status_2019_1');
            $table->double('ipk_2019_1');
            $table->integer('sks_2019_1');
            $table->string('status_2019_2');
            $table->double('ipk_2019_2');
            $table->integer('sks_2019_2');
            $table->string('status_2020_1');
            $table->double('ipk_2020_1');
            $table->integer('sks_2020_1');
            $table->string('status_2020_2');
            $table->double('ipk_2020_2');
            $table->integer('sks_2020_2');
            $table->string('status_2021_1');
            $table->double('ipk_2021_1');
            $table->integer('sks_2021_1');
            $table->string('status_2021_2');
            $table->double('ipk_2021_2');
            $table->integer('sks_2021_2');
            $table->string('status_2022_1');
            $table->double('ipk_2022_1');
            $table->integer('sks_2022_1');
            $table->string('status_2022_2');
            $table->double('ipk_2022_2');
            $table->integer('sks_2022_2');
            $table->string('status_2023_1');
            $table->double('ipk_2023_1');
            $table->integer('sks_2023_1');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('data_mhs_akademiks');
    }
};