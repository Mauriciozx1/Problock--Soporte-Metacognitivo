<?php

namespace CSLP\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class InteractionSent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $user;
    public $type;
    public $data;
    public $allDataDB;
    public $activity;
    public $problemid;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($data, $problemid)
    {
        $this->user = $data['user'];
        $this->type = $data['type'];
        $this->data = $data['data'];
        $this->allDataDB = $data['allDataDB'];
        $this->activity = $data['activity'];
        $this->problemid = $problemid;
        //
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PresenceChannel('status.'.$this->problemid);
    }

    public function broadcastAs()
    {
        return ('new-interaction');
    }
}
