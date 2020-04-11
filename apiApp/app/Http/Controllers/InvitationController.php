<?php

namespace App\Http\Controllers;

use App\Models\Invitation;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class InvitationController extends Controller
{
    public function __construct()
    {
//        $this->middleware(['auth:api']);
    }

    public function askToken()
    {
        /**
         * You can skip this step and send an invitation directly to create method
         * This method is just created if we wanted to check a certain pattern
         */
        $invitation = Invitation::create(['token' => Str::random(20)]);
        if ($invitation->exists) {
            return response()->json(['invitation' => $invitation->token], 200);
        }
        return response()->json(['invitation' => 'No invitation created.'], 500);
    }
}
