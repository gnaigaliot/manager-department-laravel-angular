<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;

    protected $table = 'employee';

    protected $fillable = ['id', 'code', 'name', 'date_of_bird', 'gender', 'email', 'phonenumber', 'status', 
    'created_date', 'edited_date', 'created_by', 'edited_by', 'is_working'];
}
