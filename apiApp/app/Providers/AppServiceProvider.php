<?php

namespace App\Providers;

use App\Services\AuditService;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    public const AUDIT_SERVICE = 'audit';

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(self::AUDIT_SERVICE, AuditService::class);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {

    }

    public static function getConstant(string $value)
    {
        return constant("self::$value");
    }
}
