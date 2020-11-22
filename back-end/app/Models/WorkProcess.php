<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WorkProcess extends Model
{
    use HasFactory;

    protected $table = 'work_process';

    protected $fillable = ['id', 'start_date', 'end_date', 'id_department', 'id_positions', 'id_employee', 'updated_at', 'created_at'];
}
