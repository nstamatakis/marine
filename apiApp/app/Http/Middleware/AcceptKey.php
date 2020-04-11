<?php


namespace App\Http\Middleware;


use Closure;
use Illuminate\Http\Request;

/**
 * Class AcceptKey
 * @package App\Http\Middleware
 */
class AcceptKey
{
    /**
     *
     */
    private const ACCEPT = 'Accept';
    /**
     *
     */
    private const ACCEPT_KEY_1 = 'application/json';
    /**
     *
     */
    private const ACCEPT_KEY_2 = 'application/xml';

    /**
     * @param Request $request
     * @param Closure $next
     * @return \Illuminate\Http\JsonResponse|mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $accept = $request->header(self::ACCEPT);
        if ($accept !== self::ACCEPT_KEY_1 && $accept !== self::ACCEPT_KEY_2) {
            return response()->json(
                [
                    'message' => 'Accept Key missing. application/json or application/xml are valid.'
                ], 404);
        }
        app()->instance(self::ACCEPT, $accept);
        return $next($request);
    }
}
