<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use App\Models\Position;
use App\Http\Resources\PositionResource;
use Carbon\Carbon;

class PositionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {   
        $name = $request->name;
        $salary = $request->salary;

        $query = DB::table('positions');
        $query->where('status', 1);
        if($name) {
            $query->where(function($q) use ($name) {
                $q->where('name','LIKE',"%$name%");
            });
        }
        if($salary) {
            $query->where('salary', $salary);
        }
        $query->orderBy('id', 'asc');
        $data = $query->get();
        return response()->json([
            'data' => PositionResource::collection($data),
            'type' => 'SUCCESS',
            'status' => Response::HTTP_OK,
            'code' => null
        ]);;
    }
    
    public function getAllPosition(Request $request) {
        $query = DB::table('positions')->where('status', 1);
        $query->orderBy('id', 'asc');
        $data = $query->get();
        return response()->json([
            'data' => PositionResource::collection($data),
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
                $position = DB::table('positions')->where('id', $id)->limit(1);
                $position->update([
                    'code' => $request['code'],
                    'name' => $request['name'],
                    'salary' => $request['salary'],
                    'edited_date' => Carbon::now(),
                    'edited_by' => 'admin',
                    'status' => 1
                ]);
            } else {
                $position = DB::table('positions')->insert([ 
                    'code' => $request['code'],
                    'name' => $request['name'],
                    'salary' => $request['salary'],
                    'created_date' => Carbon::now(),
                    'created_by' => 'admin',
                    'status' => 1
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
        $query = Position::select('*')->find($id);
        $data = new PositionResource($query);
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
     * @param  \App\Models\Apartment  $apartment
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $position = DB::table('positions')->where('id', $id)->limit(1);
        if($position->count() > 0) {
            DB::table('positions')->where('id', $id)->delete();
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
}
