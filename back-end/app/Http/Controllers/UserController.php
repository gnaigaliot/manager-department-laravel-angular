<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Resources\UserResource;
use App\Http\Resources\UserResource2;
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
                $q->where('full_name','LIKE',"%$fullName%");
            });
        }
        $query->orderBy('created_at', 'desc');
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
        $userId = $request->userId;
        $lstRoleId = $request->lstRoleId;
        DB::beginTransaction();
        try {
            if($userId && $userId > 0) {    // update
                $user = DB::table('users')->where('user_id', $userId)->limit(1);
                $user->update([
                    'full_name' => $request['fullName'],
                    'email' => $request['email'],
                    'password' => bcrypt($request['password']),
                    'date_of_birth' => $request['dateOfBirth'],
                    'gender' => $request['gender'],
                    'mobile_number' => $request['mobileNumber'],
                    'user_code' => $request['userCode']
                ]);
                $listRole = DB::table('user_role')->where('user_id', $userId)->delete();
                foreach ($lstRoleId as $value) {
                    $userRole = UserRole::create([
                        'user_id' => $userId,
                        'role_id' => $value
                    ]);
                }
            } else {    // create
                $id = DB::table('users')->insertGetId([
                    'full_name' => $request['fullName'],
                    'email' => $request['email'],
                    'password' => bcrypt($request['password']),
                    'date_of_birth' => $request['dateOfBirth'],
                    'gender' => $request['gender'],
                    'mobile_number' => $request['mobileNumber'],
                    'user_code' => $request['userCode']
                ]);
                foreach ($lstRoleId as $value) {
                    $userRole = UserRole::create([
                        'user_id' => $id,
                        'role_id' => $value
                    ]);
                }
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
        $query = User::select('*')->find($id);
        // lay list role cua moi user
        $lstRoleId = UserRole::select('role_id as roleId')->where('user_id', $id)->get();
        $list = array();
        foreach ($lstRoleId as $value) {
            array_push($list, $value['roleId']);
        }
        $query['lstRoleId'] = $list;
        $data = new UserResource2($query);
        return response()->json([
            'data' => $data,
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
