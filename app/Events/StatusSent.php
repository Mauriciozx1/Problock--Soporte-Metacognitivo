<?php

namespace CSLP\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Auth;

class StatusSent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $problemid;
    public $data;
    public $user;
    
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($problemid, $data)
    {
        $this->problemid = $problemid;
        $this->data = $data;
        $this->user = Auth::user();
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
        return ('afk');
        
    }
}
