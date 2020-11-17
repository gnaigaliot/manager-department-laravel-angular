<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BillServiceType extends Model
{
    use HasFactory;

    protected $table = 'bill_service_type';

    protected $fillable = ['id', 'code', 'name', 'price', 'unit', 'status', 'created_date', 'created_by', 'edited_date', 'edited_by', 'is_service'];
}
