<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Resources\UserResource;
use App\Http\Resources\UserRoleResource;
use Illuminate\Support\Facades\DB;
use App\User;
use App\Models\UserRole;


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
        return response()->json([
            'data' => UserResource::collection($data),
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
        // return $request;
        DB::beginTransaction();
        try {
            $id = DB::table('users')->insertGetId([
                'name' => $request['fullName'],
                'email' => $request['email'],
                'password' => $request['password'],
                'date_of_birth' => $request['dateOfBirth'],
                'gender' => $request['gender'],
                'mobile_number' => $request['mobileNumber'],
                'user_code' => $request['userCode']
            ]);
            $lstRoleId = $request->lstRoleId;
            foreach ($lstRoleId as $value) {
                $userRole = UserRole::create([
                    'user_id' => $id,
                    'role_id' => $value
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
     * @param  \App\Models\Apartment  $apartment
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $query = DB::table('users')->where('user_id', $id);
        $data = $query->get();
        $data['lstRoleId'] = 1;
        return response()->json([
            'data' => UserResource::collection($data)[0],
            'type' => 'SUCCESS',
            'status' => Response::HTTP_OK,
            'code' => null
        ]);
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
    public function destroy($id)
    {
        DB::table('users')->where('user_id', $id)->delete();
        return response()->json([
            'data' => null,
            'type' => 'SUCCESS',
            'status' => Response::HTTP_OK,
            'code' => 'Xóa bản ghi thành công',
            'message' => null
        ]);
    }
}
