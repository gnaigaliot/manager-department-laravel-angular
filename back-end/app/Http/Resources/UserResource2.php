<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource2 extends JsonResource
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
            'userId' => $this->user_id,
            'userName' => $this->user_name,
            'password' => $this->password,
            'fullName' => $this->full_name,
            'dateOfBirth' => $this->date_of_birth,
            'gender' => $this->gender,
            'email' => $this->email,
            'mobileNumber' => $this->mobile_number,
            'positionId' => $this->position_id,
            'userCode' => $this->user_code,
            'createdDate' => $this->created_date,
            'createdBy' => $this->created_by,
            'roleId' => $this->role_id,
            'updatedAt' => $this->updated_at,
            'createdAt' => $this->created_at,
            'lstRoleId' => $this->lstRoleId ? $this->lstRoleId : []
        ];
    }
}
