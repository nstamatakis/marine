<?php


namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class AuthKey
{
    private const APP_KEY = 'AppApiKey';

    public function handle(Request $request, Closure $next)
    {
        $token = $request->header(self::APP_KEY);
        if ($token !== env(self::APP_KEY)){
            return response()->json(['message'=>'App Api Key missing'] , 401);
        }
        return $next($request);
    }
}

