<?php


namespace App\Modules\Tracker\Services\Responses;


use App\Facades\Audit;
use Closure;
use Illuminate\Http\Request;

/**
 * Class Response
 * @package App\Modules\Tracker\Services\Responses
 */
class Response
{
    /**
     * @var object
     */
    private object $responder;
    /**
     *
     */
    private const RESPONDER_PREFIX = 'App\Modules\Tracker\Services\Responses\Response';

    /**
     * Response constructor.
     * @throws \Illuminate\Contracts\Container\BindingResolutionException
     */
    private string $method;

    public function __construct()
    {
        list($application, $this->method) = explode('/', app()->make('Accept'));
        $class = self::RESPONDER_PREFIX . strtoupper($this->method);
        $this->responder = new $class(app()->make('vessels'));
    }

    public function getResponderPayload()
    {
        return $this->responder->getPayload();
    }

    public function getStatus()
    {
        return $this->responder->getStatus();
    }

    public function getHeader()
    {
        return $this->responder->getHeaders();
    }

    public function getResponse()
    {
        Audit::setAction("vessels::" . $this->method)->setMeta([])->save();
        return $this->responder->getResponse();
    }
}
