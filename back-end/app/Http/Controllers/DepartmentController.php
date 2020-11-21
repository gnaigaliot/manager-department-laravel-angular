<?php

namespace App\Http\Controllers;

use App\Models\Department;
use Illuminate\Http\Response;
use Illuminate\Http\Request;
use App\Http\Resources\DepartmentResource;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class DepartmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $reqCode = $request->code;
        $reqName = $request->name;
        $query = DB::table('department')->where('status', 1);
        if($reqCode) {
            $query->where('code', $reqCode);
        }
        if($reqName) {
            $query->where(function($q) use ($reqName) {
                $q->where('name','LIKE',"%$reqName%");
            });
        }
        $query->orderBy('id', 'asc');
        $data = $query->get();
        return response()->json(DepartmentResource::collection($data), Response::HTTP_OK);
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
        $id = $request->id;
        DB::beginTransaction();
        try {
            if($id && $id > 0) {
                $department = DB::table('department')->where('id', $id)->limit(1);
                $department->update([
                    'code' => $request['code'],
                    'name' => $request['name'],
                    'status' => 1,
                    'edited_date' => Carbon::now()
                ]);
            } else {
                $department = DB::table('department')->insert([
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
     * @param  \App\Models\Department  $department
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $query = Department::select('*')->find($id);
        $data = new DepartmentResource($query);
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
     * @param  \App\Models\Department  $department
     * @return \Illuminate\Http\Response
     */
    public function edit(Department $department)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Department  $department
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Department $department)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Department  $department
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DB::table('department')->where('id', $id)->delete();
        return response()->json([
            'data' => null,
            'type' => 'SUCCESS',
            'status' => Response::HTTP_OK,
            'code' => 'Xóa bản ghi thành công',
            'message' => null
        ]);
    }
}
