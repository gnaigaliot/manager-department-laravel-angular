<?php

namespace App\Http\Controllers;

use App\Models\BillElectricWater;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\BillElectricWaterResource;

class BillElectricWaterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $type = $request->type;
        $codeBill = $request->codeBill;
        $idApartment = $request->idApartment;
        $query = DB::table('apartment')->select(
            'bill_water_electric.id as id',
            'bill_water_electric.code as codeBill',
            'apartment.code as codeApartment',
            'person.name as personName',
            'person.phone_number as numberPhone',
            'bill_water_electric.total_price as totalPrice',
            'bill_water_electric.status as status',
            'bill_water_electric.id_bill_type as type',
            'bill_water_electric.created_date as createdDate'
        );
        $query->join('apartment_detail', 'apartment.id', '=', 'apartment_detail.id_apartment');
        $query->join('person', 'person.id', '=', 'apartment_detail.id_person');
        $query->join('bill_water_electric', 'bill_water_electric.id_apartment', '=', 'apartment.id');
        $query->whereRaw(" apartment_detail.is_main ");
        if($type) {
            $query->where('bill_water_electric.id_bill_type', $type);
        }
        if($codeBill) {
            $query->where('bill_water_electric.code', $codeBill);
        }
        if($idApartment) {
            $query->where('apartment.id', $idApartment);
        }
        $query->orderBy('bill_water_electric.id', 'DESC');
        $data = $query->get();
        return response()->json([
            'data' => $data,
            'type' => 'SUCCESS',
            'status' => Response::HTTP_OK,
            'code' => null
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\BillElectricWater  $billElectricWater
     * @return \Illuminate\Http\Response
     */
    public function show(BillElectricWater $billElectricWater)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\BillElectricWater  $billElectricWater
     * @return \Illuminate\Http\Response
     */
    public function edit(BillElectricWater $billElectricWater)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\BillElectricWater  $billElectricWater
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BillElectricWater $billElectricWater)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\BillElectricWater  $billElectricWater
     * @return \Illuminate\Http\Response
     */
    public function destroy(BillElectricWater $billElectricWater)
    {
        //
    }
}
