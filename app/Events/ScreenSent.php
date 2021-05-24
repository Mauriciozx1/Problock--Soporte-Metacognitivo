<?php

namespace CSLP\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class ScreenSent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $teamworkid;
    public $methode;
    public $data;
    public $activitiID;
    
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($teamworkid, $activitiID, $methode, $data)
    {
        $this->teamworkid = $teamworkid;
        $this->methode = $methode;
        $this->data = $data;
        $this->activitiID = $activitiID;
        //
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {   
        return new PresenceChannel('workspace.'.$this->activitiID.$this->teamworkid);
    
    }

    public function broadcastAs()
    {
        if($this->methode == 'vote'){
            return ('vote');
        }
    }
}
