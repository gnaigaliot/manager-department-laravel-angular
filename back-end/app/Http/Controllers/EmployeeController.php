<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\Employee;
use App\Http\Resources\EmployeeResource;
use Illuminate\Support\Facades\DB;

class EmployeeController extends Controller
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
        $gender = $request->gender;
        $email = $request->email;
        $phoneNumber = $request->phoneNumber;
        $salary = $request->salary;
        $departmentName = $request->departmentName;
        $positionsName = $request->positionsName;

        $query = DB::table('employee');
        if($code) {
            $query->where('code', $code);
        }
        if($name) {
            $query->where(function($q) use ($name) {
                $q->where('name','LIKE',"%$name%");
            });
        }
        if($gender) {
            $query->where('gender', $gender);
        }
        if($email) {
            $query->where(function($q) use ($email) {
                $q->where('email','LIKE',"%$email%");
            });
        }
        if($phoneNumber) {
            $query->where('phonenumber', $phoneNumber);
        }
        if($salary) {
            $query->where('salary', $salary);
        }
        if($gender) {
            $query->where('gender', $gender);
        }
        $data = $query->get();
        return response()->json(EmployeeResource::collection($data), Response::HTTP_OK);
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
