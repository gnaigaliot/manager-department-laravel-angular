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
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $id = $request->id;
        DB::beginTransaction();
        try {
            if($id && $id > 0) {
                $billElectricWater = DB::table('bill_water_electric')->where('id', $id)->limit(1);
                $department->update([
                    'code' => $request['code'],
                    'name' => $request['name'],
                    'status' => 1,
                    'edited_date' => Carbon::now()
                ]);
            } else {
                $department = DB::table('bill_water_electric')->insert([
                    'code' => $request['code'],
                    'name' => $request['name'],
                    'status' => 1,
                    'created_date' => Carbon::now()
                ]);
            }
            DB::commit();
            return response()->json([
                'type' => 'SUCCESS',
                'message' => null,
                'code' => 'Thành công'
            ], 200);
        } catch (Exception $exception) {
            report($exception);
            DB::rollback();
            return response()->json([
                'error' => true,
                'success' => false,
                'message' => $exception->getMessage()
            ], 400);
        }
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
