<?php


namespace App\Modules\Tracker\Services\Responses\Interfaces;


interface ResponseBody
{
    public function setHeaders();

    public function setStatus();

}
