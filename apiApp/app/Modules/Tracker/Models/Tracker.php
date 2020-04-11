<?php

namespace App\Modules\Tracker\Models;

use Illuminate\Database\Eloquent\Model;

class Tracker extends Model
{
    protected $table = 'tracks';

    public function vessel()
    {
       return $this->hasOne(Vessel::class , 'id' , 'id');
    }

    public function vesselStatus()
    {
        return $this->hasOne(Status::class , 'id' ,'vessel_status');
    }

    public function type()
    {
        return $this->hasOne(Type::class , 'id' , 'type');
    }
}
