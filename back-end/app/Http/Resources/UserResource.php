<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'password' => $this->password,
            'name' => $this->name,
            'dateOfBirth' => $this->date_of_birth,
            'gender' => $this->gender,
            'email' => $this->email,
            'mobileNumber' => $this->mobile_number,
            'positionId' => $this->position_id,
            'userCode' => $this->user_code,
            'createdAt' => $this->created_at,
            'createdBy' => $this->created_by,
            'roleId' => $this->role_id,
            'updatedAt' => $this->updated_at
        ];
    }
}
