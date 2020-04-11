<?php


namespace App\Modules\Tracker\SelectFilters;


use Illuminate\Support\Str;
use Closure;

abstract class Select
{
    private const API_PREFIX_URL = '/api/';

    public function handle($request, Closure $next)
    {

        if (request()->getPathInfo() !== $this->filterName()) {
            return $next($request);
        }

        $builder = $next($request);
        return $this->applyFilter($builder);
    }

    protected abstract function applyFilter($builder);

    protected function filterName()
    {
        return self::API_PREFIX_URL . Str::lower(class_basename($this));

    }
}
