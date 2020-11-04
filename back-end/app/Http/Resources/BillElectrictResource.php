<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BillElectrictResource extends JsonResource
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
            'oldNumber' => $this->old_number,
            'newNumber' => $this->new_number,
            'amount' => $this->amount,
            'fromDate' => $this->from_date,
            'toDate' => $this->to_date,
            'status' => $this->status,
            'month' => $this->month,
            'year' => $this->year,
            'createdDate' => $this->created_date,
            'editedDate' => $this->edited_date,
            'createdBy' => $this->created_by,
            'editedBy' => $this->edited_by,
            'idDepartment' => $this->id_department
        ];
    }
}