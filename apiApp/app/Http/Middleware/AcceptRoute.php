<?php


namespace App\Http\Middleware;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

class AcceptRoute
{
    public function handle(Request $request, \Closure $next)
    {
        $routeCollection = Route::getRoutes();
        $routes = [];
        foreach ($routeCollection as $value) {
            $routes[] = '/' . $value->uri();
        }

        if (!in_array(request()->getPathInfo(), $routes)) {
          return response()->json(['message'=>'Route not found', 500]);
        }
        return $next($request);

    }
}
