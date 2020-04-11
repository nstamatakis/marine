<?php
/**
 * @author Nick Stamatakis
 */

namespace App\Modules\Tracker\Views\Composers;

use App\Models\User;
//use App\Modules\Projects\Managers\StatusManager;
use App\Modules\Tracker\QueryFilters\Lat;
use App\Modules\Tracker\QueryFilters\Length;
use App\Modules\Tracker\QueryFilters\Lon;
use App\Modules\Tracker\QueryFilters\MaxLat;
use App\Modules\Tracker\QueryFilters\MaxLon;
use App\Modules\Tracker\QueryFilters\MinLat;
use App\Modules\Tracker\QueryFilters\MinLon;
use App\Modules\Tracker\QueryFilters\Mmsi;
use App\Modules\Tracker\Models\Vessel;
use App\Modules\Tracker\Models\Tracker as TrackerModel;
use App\Modules\Tracker\QueryFilters\Page;
use App\Modules\Tracker\QueryFilters\Width;
use App\Modules\Tracker\SelectFilters\Tracker;
use Illuminate\Http\Request;
use Illuminate\Pipeline\Pipeline;


use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;
use Illuminate\View\View;

class VesselComposer
{
    private const VESSELS = 'vessels';
    private int $pagination = 50;

    public function __construct()
    {
        app()->instance('pagination', false);
        $query = TrackerModel::query();
        $this->setPagination();
        $this->setSelection($query);
        $vessels = app(Pipeline::class)->send($query)
            ->through(
                [
                    Mmsi::class,
                    Lat::class,
                    Lon::class,
                    MinLat::class,
                    MaxLat::class,
                    MinLon::class,
                    MaxLon::class,
                    Width::class,
                    Length::class,
                ]
            )
            ->thenReturn();
        $this->setPaginationFromRequest($vessels);
        if ($vessels)
            app()->instance('T:Q:F', "OK");
        app()->instance(self::VESSELS, $vessels);
    }

    private function setPagination()
    {
        if (!is_null(config('tracker.vessels.composers'))
            && array_key_exists('pagination', config('tracker.vessels.composers')))
            $this->pagination = config('tracker.vessels.composers.pagination');
    }

    private function setSelection($query)
    {
        $vessels = app(Pipeline::class)->send($query)
            ->through(
                [
                    Tracker::class
                ]
            )
            ->thenReturn();
    }

    private function setPaginationFromRequest(&$vessels)
    {
        if (app()->make('pagination')) {
            $pagination = $this->pagination;
        } else {
            $pagination = count($vessels->get()->toArray());
        }
        $vessels = $vessels->with('vesselStatus', 'type', 'vessel')->groupBy('id', 'status', 'type', 'lat', 'lon')->paginate($pagination);
    }
}
