<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Position extends Model
{
    use HasFactory;

    protected $table = 'positions';

    protected $fillable = ['id', 'code', 'name', 'salary', 'status', 'created_date', 'edited_date', 'created_by', 'edited_by'];
}
