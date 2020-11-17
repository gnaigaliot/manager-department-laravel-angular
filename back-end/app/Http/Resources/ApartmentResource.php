<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ApartmentResource extends JsonResource
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
            'price' => $this->price,
            'area' => $this->area,
            'description' => $this->description,
            'status' => $this->status,
            'createdDate' => $this->created_date,
            'editedDate' => $this->edited_date,
            'createdBy' => $this->created_by,
            'editedBy' => $this->edited_by,
            'name' => $this->name
        ];
    }
}
