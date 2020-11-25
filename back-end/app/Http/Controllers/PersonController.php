<?php

namespace App\Http\Controllers;

use App\Models\Person;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Resources\PersonResource;
use Illuminate\Support\Facades\DB;

class PersonController extends Controller
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
        $listApartmentId = $request->lstApartmentId;
        $query = DB::table('person')->select(
            'id As id',
            'code As code',
            'name As name',
            'gender As gender',
            'address As address',
            'identity_number As identifyNumber',
            'date_of_birth As dateOfBirth',
            'phone_number As phoneNumber',
            'email As email',
            'start_date as startDate',
            'end_date as endDate'
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
        if($listApartmentId) {
            
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
                $person = DB::table('person')->where('id', $id)->limit(1);
                $person->update([
                    'code' => $request['code'],
                    'name' => $request['name'],
                    'gender' => $request['gender'],
                    'address' => $request['address'],
                    'identity_number' => $request['identityNumber'],
                    'date_of_birth' => $request['dateOfBirth'],
                    'email' => $request['email'],
                    'phone_number' => $request['phoneNumber'],
                    'start_date' => $request['startDate'],
                    'end_date' => $request['endDate']
                ]);
            } else {
                $person = DB::table('person')->insert([
                    'code' => $request['code'],
                    'name' => $request['name'],
                    'gender' => $request['gender'],
                    'address' => $request['address'],
                    'identity_number' => $request['identityNumber'],
                    'date_of_birth' => $request['dateOfBirth'],
                    'email' => $request['email'],
                    'phone_number' => $request['phoneNumber'],
                    'start_date' => $request['startDate'],
                    'end_date' => $request['endDate']
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
     * @param  \App\Models\Person  $person
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $query = Person::select('*')->find($id);
        $data = new PersonResource($query);
        return response()->json([
            'data' => $data,
            'type' => 'SUCCESS',
            'status' => Response::HTTP_OK,
            'code' => null
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Person  $person
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $person = DB::table('person')->where('id', $id)->limit(1);
        if($person->count() > 0) {
            DB::table('person')->where('id', $id)->delete();
            return response()->json([
                'data' => null,
                'type' => 'SUCCESS',
                'status' => Response::HTTP_OK,
                'code' => 'Xóa bản ghi thành công',
                'message' => null
            ]);
        } else {
            return response()->json([
                'data' => null,
                'type' => 'WARNING',
                'code' => 'Bản ghi không tồn tại',
                'message' => null
            ]);
        }
    }

    public function findAutoComplete($codeOrName) {
        $query = DB::table('person')->select(
            'id As id',
            'code As code',
            'name As name',
            'gender As gender',
            'address As address',
            'identity_number As identifyNumber',
            'date_of_birth As dateOfBirth',
            'phone_number As phoneNumber',
            'email As email',
            'start_date as startDate',
            'end_date as endDate'
        );
        if($codeOrName) {
            $query->where(function($q) use ($codeOrName) {
                $q->where('name','LIKE',"%$codeOrName%");
            });
        }
        $data = $query->get();
        return response()->json([
            'data' => $data,
            'type' => 'SUCCESS',
            'status' => Response::HTTP_OK,
            'code' => null
        ]);
    }
}
