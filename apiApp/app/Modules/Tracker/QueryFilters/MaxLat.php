<?php


namespace App\Modules\Tracker\QueryFilters;


class MaxLat extends Filter
{

    private const WHERE_KEY = 'lat';

    protected function applyFilter($builder)
    {
        return $builder->where(self::WHERE_KEY, '<=', request('max_lat'))->orderBy(parent::ORDER_KEY);
    }
}
