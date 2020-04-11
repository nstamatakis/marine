<?php

namespace App\Modules\Tracker\Models;

use Illuminate\Database\Eloquent\Model;

class Vessel extends Model
{
    protected $table = 'vessels';

    public function statuses()
    {
        $this->hasMany(Status::class);
    }

    public function type()
    {
        $this->hasOne(Type::class);
    }
}
