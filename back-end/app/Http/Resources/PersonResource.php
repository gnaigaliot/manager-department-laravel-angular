<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PersonResource extends JsonResource
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
            'code' => $this->code,
            'name' => $this->name,
            'gender' => $this->gender,
            'address' => $this->address,
            'identityNumber' => $this->identity_number,
            'dateOfBirth' => $this->date_of_birth,
            'email' => $this->email,
            'idPerson' => $this->id_person,
            'isMain' => $this->is_main,
            'phoneNumber' => $this->phone_number,
            'startDate' => $this->start_date,
            'endDate' => $this->end_date
        ];
    }
}
