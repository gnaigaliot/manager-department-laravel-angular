<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Resources\UserResource;
use App\Http\Resources\UserRoleResource;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {   
        $userCode = $request->userCode;
        $fullName = $request->fullName;
        $query = DB::table('users');
        if($userCode) {
            $query->where('user_code', $userCode);
        }
        if($fullName) {
            $query->where(function($q) use ($fullName) {
                $q->where('name','LIKE',"%$fullName%");
            });
        }
        $data = $query->get();
        return response()->json(UserResource::collection($data), Response::HTTP_OK);
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
        DB::beginTransaction();
        try {
            return $request;
            $user = User::create([
                'name' => $request['fullName'],
                'email' => $request['email'],
                'password' => $request['password'],
                'date_of_birth' => $request['dateOfBirth'],
                'gender' => $request['gender'],
                'mobile_number' => $request['mobileNumber'],
                'user_code' => $request['userCode']
            ]);
            return $user;
            $lstRoleId = $request->lstRoleId;
            foreach ($lstRoleId as $value) {
                $userRole = UserRole::create([
                    
                ]);
            }
            DB::commit();
            return $this->login($request);
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
