<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});
//Route::post('/login', '\App\Modules\Tracker\Http\Api\Controllers\Auth\LoginController@login');

Route::group(['prefix'=>'/user'],function(){
    Route::post('/login', '\App\Modules\Tracker\Http\Api\Controllers\Auth\LoginController@login');
    Route::post('/register', '\App\Modules\Tracker\Http\Api\Controllers\Auth\LoginController@register');
});
Route::middleware('auth:api')->get('/tracker', '\App\Modules\Tracker\Http\Api\Controllers\VesselsController@tracker');
Route::group(['prefix'=>'/invitation'],function(){
    Route::middleware('auth:api')->get('/ask', 'InvitationController@askToken');
});
