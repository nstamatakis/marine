<?php


namespace App\Modules\Tracker\Http\Api\Controllers\Auth;


use App\Http\Controllers\Controller;
use App\Models\Invitation;
use App\Models\User;
use App\Modules\Tracker\Http\Requests\ApiLoginRequest;
use App\Modules\Tracker\Http\Requests\ApiRegisterRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;


/**
 * Class LoginController
 * @package App\Modules\Tracker\Http\Api\Controllers\Auth
 */
class LoginController extends Controller
{
    /**
     *
     */
    private const PASSPORT_TOKEN_KEY_PRODUCE = 'authToken';
    /**
     *
     */
    private const PASSPORT_TOKEN_KEY_RESPONSE = 'accessToken';

    /**
     * @param ApiLoginRequest $request
     * @return \Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     */
    public function login(ApiLoginRequest $request)
    {
        $login = $request->all();

        if (!Auth::attempt($login)) {
            return response(['message' => 'Invalid Data Dude.']);
        }
        $accessToken = Auth::user()->createToken(self::PASSPORT_TOKEN_KEY_PRODUCE)->accessToken;
        return response(['user' => Auth::user(), self::PASSPORT_TOKEN_KEY_RESPONSE => $accessToken]);
    }

    /**
     * @param ApiRegisterRequest $request
     * @return \Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\JsonResponse|\Illuminate\Http\Response
     */
    public function register(ApiRegisterRequest $request)
    {
        /**
         * This is just a simple registration method.
         */
        if (Invitation::where('token', $request->invitation)->get()->isEmpty())
            return response()->json(['message' => 'Not a valid invitation'], 403);
        $request->request->add(['password' => Hash::make($request->password)]);
        $user = User::create($request->all());
        if ($user->exists)
            return response(['message' => 'User created.'], 200);
        return response(['message' => 'User not created.'], 500);

    }
}
