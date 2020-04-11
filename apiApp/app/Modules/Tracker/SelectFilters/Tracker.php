<?php


namespace App\Modules\Tracker\SelectFilters;


use App\Modules\Tracker\Views\Composers\VesselComposer_v2;
use Illuminate\Support\Facades\DB;

class Tracker extends Select
{
    protected function applyFilter($builder)
    {
        if (app()->make('trackerComposerToUse') == VesselComposer_v2::class)
            return $builder->select('lat', 'lon', 'id', 'status as vessel_status', 'type');

        return $builder->select(DB::raw("CONCAT('latitude:',lat,'-','longitude:',lon) as position"), 'id', 'status as vessel_status', 'type');
    }
}
