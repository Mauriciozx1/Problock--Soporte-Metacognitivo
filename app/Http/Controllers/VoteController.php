<?php

namespace CSLP\Http\Controllers;

use CSLP\Events\VoteSent;
use CSLP\Vote;
use CSLP\User;
use Illuminate\Http\Request;
use Auth;
use Input;
class VoteController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        //return view('/workboard/view');
    }

    public function sendVote(Request $request)
    {
        $vote = new vote;
        $vote->user_id = Auth::user()->id;
        $vote->activiti_id = $request->activitiid;
        $vote->teamwork_id = $request->teamworkid;
        $vote->vote = $request->vote;
        $vote->save();
        broadcast(new VoteSent($vote->load('user'),$request->vote))->toOthers();
        return ['status' => 'success'];
    }
}
