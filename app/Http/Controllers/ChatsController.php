<?php

namespace CSLP\Http\Controllers;

use CSLP\Events\MessageSent;
use CSLP\Message;
use CSLP\User;
use Illuminate\Http\Request;
use Auth;
use Input;
class ChatsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        //return view('/workboard/view');
    }

    public function fetchMessages($teamworkid)
    {
        $m = Message::where('teamwork_id',$teamworkid)->get();
        $message = $m->load('user');
    
        return $message;
    }

    public function sendMessage(Request $request)
    {
        $message = new Message;
        $message->user_id = Auth::user()->id;
        $message->teamwork_id = $request->teamworkid;
        $message->message = $request->message;
        if($request->rmessage != null){
            $message->reply_user_id = $request->ruserid;
            $message->reply_message = $request->rmessage;
            $message->reply_id = $request->rid;
            $message->reply_name = $request->rusername;

        } 
        $message->save();
        broadcast(new MessageSent($message->load('user'),$request->message))->toOthers();
        return ['status' => 'success'];
    }
}
