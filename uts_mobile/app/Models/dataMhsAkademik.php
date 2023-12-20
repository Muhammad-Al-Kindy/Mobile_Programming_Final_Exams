<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class dataMhsAkademik extends Model
{
    use HasFactory;
    protected $fillable = [
        'nim',
        'name',
        'status_akhir',
        'status_2018_1',
        'ipk_2018_1',
        'sks_2018_1',
        'status_2018_2',
        'ipk_2018_2',
        'sks_2018_2',
        'status_2019_1',
        'ipk_2019_1',
        'sks_2019_1',
        'status_2019_2',
        'ipk_2019_2',
        'sks_2019_2',
        'status_2020_1',
        'ipk_2020_1',
        'sks_2020_1',
        'status_2020_2',
        'ipk_2020_2',
        'sks_2020_2',
        'status_2021_1',
        'ipk_2021_1',
        'sks_2021_1',
        'status_2021_2',
        'ipk_2021_2',
        'sks_2021_2',
        'status_2022_1',
        'ipk_2022_1',
        'sks_2022_1',
        'status_2022_2',
        'ipk_2022_2',
        'sks_2022_2',
        'status_2023_1',
        'ipk_2023_1',
        'sks_2023_1',
    ];
}