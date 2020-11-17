<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Person extends Model
{
    use HasFactory;

    protected $table = 'person';

    protected $fillable = ['id', 'code', 'name', 'gender', 'address', 'identity_number', 'date_of_bird', 'email', 'id_person', 'is_main', 'phone_number'];
}
