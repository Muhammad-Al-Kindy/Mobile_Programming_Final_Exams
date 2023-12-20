<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DataPelecehan extends Model
{
    use HasFactory;
    protected $fillable = [
        'nim',
        'name',
        'nohp',
        'jenisLaporan',
        'kronologi',
        'bukti',
    ];
}
