<?php

namespace CSLP\Events;

use CSLP\User;
use CSLP\Message;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class MessageSent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $message;
    public $username;
    public $usermessage;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(Message $message, $userMessage)
    {
        $this->message = $message;
        $this->username = $message->user->name;
        $this->usermessage = $userMessage;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PresenceChannel('chat-team.' . $this->message->teamwork_id);
    }
    public function broadcastAs()
    {
        return ('message');
    }
}
