<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class dataCalonMhs extends Model
{
    use HasFactory;
    protected $fillable = [
        'nomor_pendaftaran',
        'nama_lengkap',
        'kelamin',
        'agama',
        'provinsi',
        'tipe_sekolah',
        'jenis_sekolah',
        'akreditasi_sekolah',
        'jurusan_asal',
        'daftar_bidikmisi',
        'pilihan_poltek_1',
        'pilihan_prodi_1',
        'pilihan_poltek_2',
        'pilihan_prodi_2',
        'pilihan_poltek_3',
        'pilihan_prodi_3',
        'prestasi',
    ];
}
