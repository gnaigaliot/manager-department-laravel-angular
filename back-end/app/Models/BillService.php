<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BillService extends Model
{
    use HasFactory;

    protected $table = 'bill_service';

    protected $fillable = ['id', 'code', 'from_date', 'to_date', 'status', 'month', 'year', 'created_date', 'edited_date', 'created_by', 'edited_by', 'id_department', 'total_price', 'code_apartment'];
}
