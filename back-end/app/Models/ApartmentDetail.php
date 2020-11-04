<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ApartmentDetail extends Model
{
    use HasFactory;

    protected $table = 'apartment_detail';

    protected $fillable = ['id', 'name', 'start_date', 'end_date', 'status', 'id_person', 'id_apartment'];
}
