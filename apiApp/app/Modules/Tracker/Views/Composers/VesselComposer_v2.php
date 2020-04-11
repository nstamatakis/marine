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
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;
use Illuminate\View\View;

class VesselComposer_v2
{

    private const VESSELS = 'vessels';
    private int $pagination = 50;

    public function __construct()
    {

        app()->instance('pagination', false);
        $query = TrackerModel::query();
        $this->setPaginationFromConfig();
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
        $this->getItOrNotFromCache($vessels);
        $this->positionAsObject($vessels);
        if ($vessels)
            app()->instance('T:Q:F', "OK");
        app()->instance(self::VESSELS, $vessels);
    }

    private function setPaginationFromConfig()
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

    private function positionAsObject(&$vessels)
    {
        foreach ($vessels['data'] as $key => &$vessel) {
            $vessel['position'] = ['coordinates' => ['lat' => $vessel['lat'], 'lon' => $vessel['lon']]];
            unset($vessel['lat']);
            unset($vessel['lon']);
        }

    }

    private function setPaginationFromRequest(&$vessels)
    {
        if (!app()->make('pagination'))
            $this->pagination = count($vessels->get()->toArray());
    }

    private function getItOrNotFromCache(&$vessels)
    {
        static $page = '';
        if (request()->has('page')) {
            $page = request()->get('page');
        }
        $query = md5($vessels->with('vesselStatus', 'type', 'vessel')->groupBy('id', 'status', 'type', 'lat', 'lon')->toSql() . $page);
        if (!Cache::get($query)) {
            $this->getResult($vessels);
            Cache::add($query, $vessels);
        } else {
            $vessels = Cache::get($query);
        }
    }

    private function getResult(&$vessels)
    {
        $vessels = $vessels->with('vesselStatus', 'type', 'vessel')->groupBy('id', 'status', 'type', 'lat', 'lon')->paginate($this->pagination)->toArray();
    }

}
