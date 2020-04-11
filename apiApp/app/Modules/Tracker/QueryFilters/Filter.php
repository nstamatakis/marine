<?php


namespace App\Modules\Tracker\QueryFilters;


use Closure;
use Illuminate\Support\Str;

abstract class Filter
{
    protected const ORDER_KEY = 'id';
    protected const PAGINATION = 'page';

    public function handle($request, Closure $next)
    {
        if (request()->has(self::PAGINATION))
            Page::setPaginationOn();
        if (!request()->has($this->filterName())) {
            return $next($request);
        }
        $builder = $next($request);
        return $this->applyFilter($builder);
    }

    protected abstract function applyFilter($builder);

    protected function filterName()
    {
        return Str::snake(class_basename($this));
    }
}
