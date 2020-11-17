<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Apartment extends Model
{
    use HasFactory;

    protected $table = 'apartment';

    protected $fillable = ['id', 'code', 'price', 'area', 'description', 'status', 'created_date', 'edited_date', 'created_by', 'edited_by', 'name'];

}
