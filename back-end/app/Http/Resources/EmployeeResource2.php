<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class EmployeeResource2 extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'userCode' => $this->code,
            'createdBy' => $this->created_by,
            'createdDate' => $this->created_date,
            'dateOfBirth' => $this->date_of_bird,
            'editedBy' => $this->edited_by,
            'editedDate' => $this->edited_date,
            'email' => $this->email,
            'gender' => $this->gender,
            'isWorking' => $this->is_working,
            'fullName' => $this->name,
            'phoneNumber' => $this->phonenumber,
            'status' => $this->status,
            'idDepartment' => $this->idDepartment,
            'departmentName' => $this->departmentName,
            'idPositions' => $this->idPositions,
            'positionsName' => $this->positionsName,
            'salary' => $this->salary
        ];
    }
}
