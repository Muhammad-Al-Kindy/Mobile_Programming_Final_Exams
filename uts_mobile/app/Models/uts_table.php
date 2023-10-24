<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class uts_table extends Model
{
    use HasFactory;
    protected $fillable = [
        'genre',
        'reports',
        'age',
        'gpa',
        'year',
        'count',
        'gender',
        'nationality',
    ];
}