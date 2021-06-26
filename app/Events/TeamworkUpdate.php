<?php

namespace CSLP\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class TeamworkUpdate implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $teamworks;
    public $problemid;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($problemid,$teamworks)
    {
        $this->teamworks = $teamworks;
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
        return ('updateTeam');
    }
}
