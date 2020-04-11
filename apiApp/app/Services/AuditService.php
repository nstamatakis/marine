<?php


namespace App\Services;


use App\Models\Audit;

class AuditService
{
    private object $model;
    private string $action;
    private array $meta;

    public function __construct(Audit $audit)
    {
        $this->model = $audit;
    }

    public function setAction(string $action): AuditService
    {
        $this->action = $action;
        return $this;
    }

    public function setMeta(array $meta): AuditService
    {
        $this->meta = $meta;
        return $this;
    }

    public function save()
    {
        $this->model->action = $this->action;
        $this->model->user_id = auth()->user()->id;
        $this->model->meta = json_encode($this->meta , 200);
        $this->model->save();

        return $this;
    }
}
