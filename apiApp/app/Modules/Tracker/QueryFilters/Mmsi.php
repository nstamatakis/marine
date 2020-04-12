<?php


namespace App\Modules\Tracker\QueryFilters;


use Closure;

class Mmsi extends Filter
{
    private const WHERE_KEY = 'mmsi';

    private string $separator = ',';
    private const POSITION_START = 0;
    private object $builder;

    protected function applyFilter($builder)
    {
        if (!is_array(request(self::WHERE_KEY)))
            return $builder->where(self::WHERE_KEY, request(self::WHERE_KEY))->orderBy(parent::ORDER_KEY);
        $values = explode($this->separator, request(self::WHERE_KEY)[self::POSITION_START]);


        $builder->orWhere(function ($builder) use ($values) {
            foreach ($values as $key => $value) {
                $builder->orWhere(self::WHERE_KEY, $value);
            }
        });

        return $builder->orderBy(parent::ORDER_KEY);
    }
}
