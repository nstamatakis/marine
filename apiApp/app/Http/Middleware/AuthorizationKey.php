<?php


namespace App\Http\Middleware;


use Illuminate\Http\Request;

class AuthorizationKey
{
    public function handle(Request $request, \Closure $next)
    {
        $token = $request->hasHeader('Authorization');
        if (!$token) {
            return response()->json(['message' => 'Need Authorization key with your token for value']);
        }

        return $next($request);
    }
}
