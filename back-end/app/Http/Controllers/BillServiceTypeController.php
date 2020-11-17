<?php

namespace App\Http\Controllers;

use App\Models\BillServiceType;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\BillServiceTypeResource;

class BillServiceTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $code = $request->code;
        $name = $request->name;
        $query = DB::table('bill_service_type')->select(
            'id as id',
            'code as code',
            'name as name',
            'price as price',
            'created_by as createdBy',
            'created_date as createdDate',
            'edited_by as editedBy',
            'edited_date as editedDate',
            'unit as unit'
        );
        $query->whereRaw(" 1 = 1 ");
        if($code) {
            $query->where('code', $code);
        }
        if($name) {
            $query->where(function($q) use ($name) {
                $q->where('name','LIKE',"%$name%");
            });
        }
        $query->orderBy('created_date', 'DESC');
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
     * @param  \App\Models\BillServiceType  $billServiceType
     * @return \Illuminate\Http\Response
     */
    public function show(BillServiceType $billServiceType)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\BillServiceType  $billServiceType
     * @return \Illuminate\Http\Response
     */
    public function edit(BillServiceType $billServiceType)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\BillServiceType  $billServiceType
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BillServiceType $billServiceType)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\BillServiceType  $billServiceType
     * @return \Illuminate\Http\Response
     */
    public function destroy(BillServiceType $billServiceType)
    {
        //
    }
}
