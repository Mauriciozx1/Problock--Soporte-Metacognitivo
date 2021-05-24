<?php

namespace CSLP\Events;

use CSLP\Teamwork;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class TeamworkSent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $teamworkid;
    public $methode;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($teamworkid, $methode)
    {
        $this->teamworkid = $teamworkid;
        $this->methode = $methode;
        //
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PresenceChannel('chat-team.'.$this->teamworkid);
    }

    public function broadcastAs()
    {
        if($this->methode == 'vote'){
            return ('vote.start');
        }
    }
}
