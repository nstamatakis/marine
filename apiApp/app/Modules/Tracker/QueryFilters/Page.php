<?php


namespace App\Modules\Tracker\QueryFilters;


class Page
{
    public static function setPaginationOn()
    {
        app()->instance('pagination', true);
    }
}
