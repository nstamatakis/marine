<?php


namespace App\Modules\Tracker\QueryFilters;


class Width extends Filter
{
    private const WHERE_KEY = 'width';

    protected function applyFilter($builder)
    {
        return $builder->where(self::WHERE_KEY, request(self::WHERE_KEY))->orderBy(parent::ORDER_KEY);
    }
}
