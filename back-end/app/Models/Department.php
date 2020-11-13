<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    use HasFactory;

    protected $table = 'department';

    protected $fillable = ['id', 'code', 'name', 'status', 'created_date', 'edited_date', 'created_by', 'edited_by'];
}
