<?php

namespace CSLP\Events;
use CSLP\User;
use CSLP\TeamworkActivity;
use CSLP\TeamworkInscription;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Auth;
class ActivitySent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $teamworkID;
    public $activitiID;
    public $user;
    public $play;
    public $usersWaiting;
    public $grupal;
    public $lider;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    
    public function __construct($teamworkID,$activitiID, $grupal,$lider)
    {
        $this->teamworkID = $teamworkID;
        $this->user = Auth::user()->id;
        $this->activitiID = $activitiID;
        $this->grupal = $grupal;
        $this->lider = User::where('id',$lider)->first();
        $teamwork = TeamworkInscription::where('teamwork_id', '=', $teamworkID)->pluck('student_id');
        $activity = TeamworkActivity::where('activity_id', '=', $activitiID)->pluck('student_id');
        $userLiderid =  TeamworkActivity::where('activity_id', $activitiID)->where('teamwork_id',$teamworkID)->first();
        $listUserWait =[];
        foreach($activity as $ac){
            $user = User::where('id',$ac)->first();
            array_push($listUserWait, $user);
        }
        $this->usersWaiting = $listUserWait;
        if(count($activity) == count($teamwork)){
            $this->play = true;
        }else{
            $this->play = false;
        }
        
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PresenceChannel('workspace.'.$this->activitiID.$this->teamworkID);
    }

    public function broadcastAs()
    {
        return ('lider');
        
    }
}
