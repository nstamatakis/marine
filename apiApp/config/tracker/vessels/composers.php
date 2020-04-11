<?php

use App\Modules\Tracker\Views\Composers\VesselComposer_v2;
use App\Modules\Tracker\Views\Composers\VesselComposer;

return [
    'pagination' => 50,
    'turn_on' => VesselComposer_v2::class,
    'VesselComposer' => [
    ],
    'VesselComposer_v2' => [
    ]
];
