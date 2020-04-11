<?php


namespace App\Modules\Tracker\QueryFilters;


class MaxLon extends Filter
{

    private const WHERE_KEY = 'lon';
    protected function applyFilter($builder)
    {
        return $builder->where(self::WHERE_KEY, '<=' , request('max_lon'))->orderBy(parent::ORDER_KEY);
    }
}
