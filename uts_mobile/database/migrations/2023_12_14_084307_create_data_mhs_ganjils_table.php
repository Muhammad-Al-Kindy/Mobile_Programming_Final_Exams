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
        Schema::create('data_mhs_ganjils', function (Blueprint $table) {
            $table->id();
            $table->string('nim');
            $table->string('name');
            $table->double('ns_manajemen_proyek');
            $table->string('nh_manajemen_proyek');
            $table->double('ns_keamanan_informasi');
            $table->string('nh_keamanan_informasi');
            $table->double('ns_ebusiness');
            $table->string('nh_ebusiness');
            $table->double('ns_mobile');
            $table->string('nh_mobile');
            $table->double('ns_spk');
            $table->string('nh_spk');
            $table->double('ns_pengolahan_citra_digital');
            $table->string('nh_pengolahan_citra_digital');
            $table->double('ns_proyek_tingkat3');
            $table->string('nh_proyek_tingkat3');
            $table->integer('total_sks');
            $table->double('ips');
            $table->string('status2017');
            $table->string('status2018');
            $table->integer('a');
            $table->integer('i');
            $table->integer('s');
            $table->integer('jmlah_ais');
            $table->string('status_akhir');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('data_mhs_ganjils');
    }
};