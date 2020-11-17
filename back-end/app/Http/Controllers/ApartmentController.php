<?php

namespace App\Http\Controllers;

use App\Models\Apartment;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Resources\ApartmentResource;
use Illuminate\Support\Facades\DB;

class ApartmentController extends Controller
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
        $haveLive = $request->haveLive;
        $notHaveLive = $request->notHaveLive;
        $query = DB::table('apartment')->select(
            'code as code',
            'id as id',
            'price as price',
            'area as area',
            'name as name',
            'description as description',
            'status as status',
            'created_date as createdDate',
            'edited_date As editedDate',
            'created_by As createdBy',
            'edited_by As editedBy',
            DB::raw("(select count(*) from apartment_detail ad where ad.id_apartment = apartment.id) as amountPersonOfApart")
        );
        $query->whereRaw(" 1=1 ");
        if($code) {
            $query->where('code', $code);
        }
        if($name) {
            $query->where(function($q) use ($name) {
                $q->where('name','LIKE',"%$name%");
            });
        }
        if(($haveLive == 1 && $notHaveLive == 0) || ($haveLive == 0 && $notHaveLive == 1)) {
            if($haveLive == 1) {
                $query->whereRaw(" exists (select * from apartment_detail addd where addd.id_apartment = apartment.id) ");
            } else {
                $query->whereRaw(" not exists (select * from apartment_detail addd where addd.id_apartment = apartment.id) ");
            }
        }
        $query->orderBy('id');
        $data = $query->get();
        return response()->json([
            'data' => $data,
            'type' => 'SUCCESS',
            'status' => Response::HTTP_OK,
            'code' => null
        ]);
    }

    public function getAllApartment() {
        $data = DB::table('apartment')->get();
        return response()->json([
            'data' => ApartmentResource::collection($data),
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
     * @param  \App\Models\Apartment  $apartment
     * @return \Illuminate\Http\Response
     */
    public function show(Apartment $apartment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Apartment  $apartment
     * @return \Illuminate\Http\Response
     */
    public function edit(Apartment $apartment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Apartment  $apartment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Apartment $apartment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Apartment  $apartment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Apartment $apartment)
    {
        //
    }
}
