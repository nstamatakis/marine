<?php


namespace App\Modules\Tracker\Services\Responses;


class ResponseXML
{
    private $xml;

    public function __construct($data)
    {
        $this->xml = $data;

    }

    public function getResponse()
    {
        return response()->xml($this->xml);
    }
}
