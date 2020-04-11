<?php

namespace App\Modules\Tracker\Models;

use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
    protected $table = 'statuses';
    protected $fillable= ['id' , 'system_name'];
    public function track()
    {
        return $this->belongsTo(Tracker::class , 'status' ,'id');
    }
}
