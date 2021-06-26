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
use CSLP\Teamwork;
class StatusTeamSent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $teamworkid;
    public $data;
    public $problemid;
    public $teamwork;
    public $teamworks;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($problemid, $teamworkid, $data, $teamworks)
    {
        $this->problemid = $problemid;
        $this->teamwork = Teamwork::where('id', $teamworkid)->first();
        $this->data = $data;
        $this->teamworkid = $teamworkid;
        $this->teamworks = json_decode($teamworks);
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
        
        return ('changeTeamStatus');
        
        
    }
}
