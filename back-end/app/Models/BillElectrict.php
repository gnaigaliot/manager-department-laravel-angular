<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BillElectrict extends Model
{
    use HasFactory;

    protected $table = 'bill_electrict';

    protected $fillable = ['id', 'code', 'old_number', 'new_number', 'amount', 'from_date', 'to_date', 'status', 'month', 'year', 'created_date', 'edited_date', 'created_by', 'edited_by', 'id_department'];
}
