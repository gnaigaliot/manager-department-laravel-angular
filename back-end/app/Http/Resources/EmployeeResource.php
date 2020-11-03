<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class EmployeeResource extends JsonResource
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
            'userCode' => $this->code,
            'createdBy' => $this->created_by,
            'createdDate' => $this->created_date,
            'dateOfBirth' => $this->date_of_bird,
            'editedBy' => $this->edited_by,
            'editedDate' => $this->edited_date,
            'email' => $this->email,
            'gender' => $this->gender,
            'id' => $this->id,
            'isWorking' => $this->is_working,
            'fullName' => $this->name,
            'phoneNumber' => $this->phonenumber,
            'status' => $this->status
        ];
    }
}
