<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DepartmentResource extends JsonResource
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
            'status' => $this->status,
            'createdDate' => $this->created_date,
            'editedDate' => $this->edited_date,
            'createdBy' => $this->created_by,
            'editedBy' => $this->edited_by
        ];
    }
}
