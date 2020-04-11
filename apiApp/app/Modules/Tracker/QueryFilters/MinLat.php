<?php


namespace App\Modules\Tracker\QueryFilters;


class MinLat extends Filter
{
    private const WHERE_KEY = 'lat';
    protected function applyFilter($builder)
    {
        return $builder->where(self::WHERE_KEY, '>=' , request(self::WHERE_KEY))->orderBy(parent::ORDER_KEY);
    }
}
