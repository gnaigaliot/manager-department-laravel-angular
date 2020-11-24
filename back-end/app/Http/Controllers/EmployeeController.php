<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\Employee;
use App\Http\Resources\EmployeeResource;
use App\Http\Resources\EmployeeResource2;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Models\WorkProcess;
use App\Models\Department;
use App\Models\Position;

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

        $query = DB::table('employee')->select(
            'employee.id as id',
            'employee.code as userCode',
            'employee.name as fullName',
            'employee.date_of_bird as dateOfBirth',
            'employee.gender as gender',
            'employee.email as email',
            'employee.phonenumber as phoneNumber',
            'employee.created_by as createdBy',
            'employee.created_date as createdDate',
            'employee.is_working as isWorking',
            'department.id as idDepartment',
            'department.name as departmentName',
            'positions.id as idPositions',
            'positions.name as positionsName',
            'positions.salary as salary'
        );
        $query->leftJoin('work_process', 'employee.id', '=', 'work_process.id_employee');
        $query->leftJoin('department', 'department.id', '=', 'work_process.id_department');
        $query->leftJoin('positions', 'work_process.id_positions', '=', 'positions.id');
        $query->where('employee.status', 1);
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
        $query->orderBy('employee.id', 'DESC');
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
        $id = $request->id;
        DB::beginTransaction();
        try {
            if($id && $id > 0) {
                $employee = DB::table('employee')->where('id', $id)->limit(1);
                $employee->update([
                    'name' => $request['name'],
                    'date_of_bird' => $request['dateOfBird'],
                    'gender' => $request['gender'],
                    'email' => $request['email'],
                    'phonenumber' => $request['phonenumber'],
                    'status' => 1,
                    'edited_date' => Carbon::now(),
                    'edited_by' => 'admin',
                    'is_working' => 1
                ]);
                $workProcess = WorkProcess::select('*')->where('id_employee', $id)->first();
                $workProcess->update([
                    'start_date' => $request['startDate'],
                    'end_date' => $request['endDate'],
                    'id_department' => $request['idDepartment'],
                    'id_positions' => $request['idPositions'],
                    'update_at' => Carbon::now()
                ]);
            } else {
                $employeeId = DB::table('employee')->insertGetId([
                    'name' => $request['name'],
                    'date_of_bird' => $request['dateOfBird'],
                    'gender' => $request['gender'],
                    'email' => $request['email'],
                    'phonenumber' => $request['phonenumber'],
                    'status' => 1,
                    'created_date' => Carbon::now(),
                    'created_by' => 'admin',
                    'is_working' => 1,
                ]);
                $employee = DB::table('employee')->where('id', $employeeId)->limit(1);
                $employee->update([
                    'code' => 'EMP' . "" . $employeeId
                ]);
                $workProcess = WorkProcess::create([
                    'id_employee' => $employeeId,
                    'start_date' => $request['startDate'],
                    'end_date' => $request['endDate'],
                    'id_department' => $request['idDepartment'],
                    'id_positions' => $request['idPositions']
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
        $query = Employee::select(
            'id as id',
            'code as userCode',
            'name as name',
            'date_of_bird as dateOfBird',
            'gender as gender',
            'email as email',
            'phonenumber as phonenumber',
            'created_by as createdBy',
            'created_date as createdDate',
            'is_working as isWorking'
        )->where('id', $id)->first();
        $workProcess = WorkProcess::select('*')->where('id_employee', $id)->first();
        $department = Department::select('*')->where('id', $workProcess['id_department'])->first();
        $position = Position::select('*')->where('id', $workProcess['id_positions'])->first();
        $query['idDepartment'] = $department['id'];
        $query['departmentName'] = $department['name'];
        $query['idPositions'] = $position['id'];
        $query['positionsName'] = $position['name'];
        $query['salary'] = $position['salary'];
        $query['startDate'] = $workProcess['start_date'];
        $query['endDate'] = $workProcess['end_date'];
        return response()->json([
            'data' => $query,
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
        $employee = DB::table('employee')->where('id', $id)->limit(1);
        if($employee->count() > 0) {
            $employee->update([
                'status' => 0
            ]);
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
