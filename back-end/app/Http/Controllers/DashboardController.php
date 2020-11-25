<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use App\Models\Person;
use App\Models\Apartment;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        // tong so cu dan
        $totalPerson = Person::all()->count();
        $data['totalPerson'] = $totalPerson;
        // so can ho da dung + so can con trong
        $totalApart = Apartment::all()->count();
        $activeApart = DB::table('apartment')->selectRaw('DISTINCT apartment.id AS id')->join('apartment_detail', 'apartment.id', '=', 'apartment_detail.id_apartment')->get()->count();
        $emptyApart = $totalApart - $activeApart;
        $data['active'] = $activeApart;
        $data['empty'] = $emptyApart;
        return response()->json([
            'data' => $data,
            'type' => 'SUCCESS',
            'status' => Response::HTTP_OK,
            'code' => null
        ]);
    }
    
    public function getListEmployeeByYear($year) {
        $query = Person::select(
            DB::raw("COUNT( CASE WHEN EXTRACT( MONTH FROM start_date ) = 1 THEN id END ) AS January"),
            DB::raw("COUNT( CASE WHEN EXTRACT( MONTH FROM start_date ) = 2 THEN id END ) AS February"),
            DB::raw("COUNT( CASE WHEN EXTRACT( MONTH FROM start_date ) = 3 THEN id END ) AS March"),
            DB::raw("COUNT( CASE WHEN EXTRACT( MONTH FROM start_date ) = 4 THEN id END ) AS April"),
            DB::raw("COUNT( CASE WHEN EXTRACT( MONTH FROM start_date ) = 5 THEN id END ) AS May"),
            DB::raw("COUNT( CASE WHEN EXTRACT( MONTH FROM start_date ) = 6 THEN id END ) AS Jun"),
            DB::raw("COUNT( CASE WHEN EXTRACT( MONTH FROM start_date ) = 7 THEN id END ) AS July"),
            DB::raw("COUNT( CASE WHEN EXTRACT( MONTH FROM start_date ) = 8 THEN id END ) AS August"),
            DB::raw("COUNT( CASE WHEN EXTRACT( MONTH FROM start_date ) = 9 THEN id END ) AS September"),
            DB::raw("COUNT( CASE WHEN EXTRACT( MONTH FROM start_date ) = 10 THEN id END ) AS October"),
            DB::raw("COUNT( CASE WHEN EXTRACT( MONTH FROM start_date ) = 11 THEN id END ) AS November"),
            DB::raw("COUNT( CASE WHEN EXTRACT( MONTH FROM start_date ) = 12 THEN id END ) AS December"),
        );
        $query->whereRaw(" 1=1 AND YEAR ( start_date ) = $year");
        $data = $query->first();
        $list = array();
        array_push($list, $data['January']);
        array_push($list, $data['February']);
        array_push($list, $data['March']);
        array_push($list, $data['April']);
        array_push($list, $data['May']);
        array_push($list, $data['Jun']);
        array_push($list, $data['July']);
        array_push($list, $data['August']);
        array_push($list, $data['September']);
        array_push($list, $data['October']);
        array_push($list, $data['November']);
        array_push($list, $data['December']);
        return response()->json([
            'data' => $list,
            'type' => 'SUCCESS',
            'status' => Response::HTTP_OK,
            'code' => null
        ]);
    }
}
