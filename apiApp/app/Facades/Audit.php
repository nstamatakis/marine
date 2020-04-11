<?php


namespace App\Facades;


use App\Providers\AppServiceProvider;

class Audit
{
    /**
     * @param string $name
     * @return mixed
     */
    protected static function resolveFacade(string $name)
    {

        return app()[$name];
    }

    /**
     * @param $method
     * @param $arguments
     * @return mixed
     */
    public static function __callStatic($method, $arguments)
    {
        return self::resolveFacade(AppServiceProvider::AUDIT_SERVICE)->$method(...$arguments);
    }
}
