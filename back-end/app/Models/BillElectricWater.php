<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BillElectricWater extends Model
{
    use HasFactory;

    protected $table = 'bill_water_electric';

    protected $fillable = ['id', 'code', 'old_number', 'new_number', 'amount', 'from_date', 'to_date', 'status', 'month', 'year', 'created_date', 'edited_date', 'created_by', 'edited_by', 'id_apartment', 'total_price', 'id_bill_type', 'code_apartment'];
}
