<?php

namespace App\Modules\Tracker\Http\Api\Controllers;

use App\Http\Controllers\Controller;
use App\Modules\Tracker\Models\Vessel;
use App\Modules\Tracker\Providers\VesselServiceProvider;
use App\Modules\Tracker\Services\Requests\RequestPerHourService;
use App\Modules\Tracker\Services\Responses\Response as ResponseVessel;

use Illuminate\Http\Request;
use Illuminate\Pipeline\Pipeline;
use Illuminate\Support\Facades\Cache;

class VesselsController extends Controller
{
    private const VESSELS = 'vessels';

    public function tracker(Request $request, ResponseVessel $response, RequestPerHourService $requestPerHourService)
    {
        if (Cache::get(auth()->user()->id) === $requestPerHourService::getConstant("RESTRICT"))
            return response()->json('Dear Client, you cannot use the api for ' . Cache::get('cacheTimeRequests-' . auth()->user()->id) . ' minutes.Limit 10 requests');
        return $response->getResponse();
    }
}
