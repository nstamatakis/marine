<?php


namespace App\Modules\Tracker\Services\Requests;


use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;

final class RequestPerHourService
{
    private int $counterLimit = 10;
    private const RESTRICT = "Restrict";
    private int $cacheTime = 60 * 60;
    private string $configPath = 'tracker.services.request_per_hour';

    public function __construct()
    {
        $this->getCacheTime();
        $this->setAndCheckCounter();
    }

    private function getCacheTime()
    {
        if (!is_null(config($this->configPath . '.cache_time'))) {
            $this->cacheTime = config($this->configPath . '.cache_time');
        }
    }

    public function setAndCheckCounter()
    {
        Log::alert("Counter metric for cache: " . Cache::get(auth()->user()->id));
        if (!Cache::has(auth()->user()->id)) {
            $this->initialize();
        } else {
            if (Cache::get(auth()->user()->id) !== self::RESTRICT) {
                $previousCounter = Cache::pull(auth()->user()->id);
                if ($previousCounter < $this->counterLimit) {
                    $count = $previousCounter + 1;
                    Cache::add(auth()->user()->id, $count, $this->cacheTime);
                } else
                    $this->setRestrict();
            }
        }

        return $this;
    }

    public function initialize()
    {
        Log::alert("First enter for the counter");
        Cache::add(auth()->user()->id, 1, $this->cacheTime);
    }

    public function setRestrict()
    {
        Cache::add(auth()->user()->id, self::RESTRICT, $this->cacheTime);
        Cache::add('cacheTimeRequests-' . auth()->user()->id, $this->cacheTime / 60, $this->cacheTime);
    }

    public static function getConstant(string $value)
    {
        return constant("self::$value");
    }
}
