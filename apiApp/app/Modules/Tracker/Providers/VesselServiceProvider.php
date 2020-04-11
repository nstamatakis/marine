<?php

namespace App\Modules\Tracker\Providers;

use App\Modules\Tracker\Services\Requests\RequestPerHourService;
use App\Modules\Tracker\Services\Responses\Response;
use App\Modules\Tracker\Views\Composers\VesselComposer;
use App\Modules\Tracker\Views\Composers\VesselComposer_v2;
use Illuminate\Support\ServiceProvider;

class VesselServiceProvider extends ServiceProvider
{
    const VESSEL_COMPOSER_KEY = 'vesselComposer';
    const VESSEL_REQUESTS_SERVICE = 'vesselRequest';
    const TRACKER_COMPOSER_TO_USE = 'trackerComposerToUse';

    /**
     * Register services.
     *
     * @return void
     * @throws \Illuminate\Contracts\Container\BindingResolutionException
     */
    public function register()
    {
        /**
         * Turn on the service. Check documentation.
         */

        app()->instance(self::TRACKER_COMPOSER_TO_USE ,  config('tracker.vessels.composers.turn_on'));
        app()->bind(self::VESSEL_COMPOSER_KEY, app()->make(self::TRACKER_COMPOSER_TO_USE));
        app()->singleton(self::VESSEL_REQUESTS_SERVICE, RequestPerHourService::class);
    }

    /**
     * Bootstrap services.
     *
     * @return void
     * @throws \Illuminate\Contracts\Container\BindingResolutionException
     */
    public function boot()
    {
        /**
         * Turn on the service. Check documentation.
         */
        if(request()->getPathInfo() === '/api/tracker') {
            app()->make(self::VESSEL_COMPOSER_KEY);
        }
    }

    public static function getConstant(string $value)
    {
        return constant("self::$value");
    }
}
