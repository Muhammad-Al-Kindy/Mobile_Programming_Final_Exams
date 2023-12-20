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
        Schema::create('data_calon_mhs', function (Blueprint $table) {
            $table->id();
            $table->integer('nomor_pendaftaran');
            $table->string('nama_lengkap');
            $table->enum('kelamin',['L','P']);
            $table->string('agama');
            $table->string('provinsi');
            $table->string('tipe_sekolah');
            $table->string('jenis_sekolah');
            $table->string('akreditasi_sekolah');
            $table->string('jurusan_asal');
            $table->string('daftar_bidikmisi');
            $table->string('pilihan_poltek_1');
            $table->string('pilihan_prodi_1');
            $table->string('pilihan_poltek_2');
            $table->string('pilihan_prodi_2');
            $table->string('pilihan_poltek_3');
            $table->string('pilihan_prodi_3');
            $table->string('prestasi');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('data_calon_mhs');
    }
};