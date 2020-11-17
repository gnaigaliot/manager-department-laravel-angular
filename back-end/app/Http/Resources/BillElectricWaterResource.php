<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BillElectricWaterResource extends JsonResource
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
            'createdBy' => $this->created_by,
            'editedDate' => $this->edited_date,
            'editedBy' => $this->edited_by,
            'idApartment' => $this->id_apartment,
            'totalPrice' => $this->total_price,
            'idBillType' => $this->id_bill_type,
            'codeApartment' => $this->code_apartment
        ];
    }
}
