<?php


namespace App\Modules\Tracker\Services\Responses;


use App\Modules\Tracker\Services\Responses\Interfaces\ResponseBody;

class ResponseJSON implements ResponseBody
{
    private array $response;
    private $data;
    private $payload;
    private int $status;
    private array $headers;

    public function __construct($data)
    {
        $this->data = $data;
        $this->setPosition();
        $this->setPayload();
        $this->setStatus();
        $this->setHeaders();
    }
    private function setPosition()
    {

    }
    private function setPayload()
    {
        $this->payload['payload'] = $this->data;
    }

    public function getPayload()
    {
        return $this->payload;
    }

    private const HEADER_TYPE = 'type';
    private const HEADER_VALUE = 'value';

    public function setHeaders()
    {
        $this->headers = [self::HEADER_TYPE => 'Content-Type', self::HEADER_VALUE => 'application/json'];
    }

    public function getHeaders()
    {
        return $this->headers;
    }

    public function setStatus()
    {
        /**
         * Just for this case. It should be generic of course.
         */
        if (app()->make('T:Q:F') === "OK")
            $this->status = 200;
        else
            $this->status = 500;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getResponse()
    {
        return response()->json(['vessels' => $this->getPayload()], $this->getStatus())
            ->header($this->getHeaders()[self::HEADER_TYPE], $this->getHeaders()[self::HEADER_VALUE]);
    }
}
