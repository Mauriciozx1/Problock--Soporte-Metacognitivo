<?php

namespace CSLP\Http\Controllers;

use Auth;
use Input;
use CSLP\Interactions;
use CSLP\GroupActivityLink;
use CSLP\ActivitiesGroup;
use CSLP\Problem;
use CSLP\TeamworkInscription;
use CSLP\User;
use CSLP\Teamwork;
use CSLP\Activity;
use CSLP\Events\InteractionSent;
use Carbon;

class InteractionController extends Controller
{
    public function postInteraction(){
        $actID = Input::get('activity_id');
        $action = Input::get('action');
        $data = Input::get('data');
        $link = GroupActivityLink::where('activity_id', $actID)->first();
        $group = ActivitiesGroup::find($link->group_id);
        $model = new Interactions;
        $model->problem_id = $group->problem_id;
        $model->activity_id = $actID;
        $model->data = $data;
        $model->type = $action;
        $model->user_id = Auth::user()->id;
        $problem = Problem::find($group->problem_id);
        if($problem->type_problem == 'Grupal'){
            $teamwork = TeamworkInscription::where('student_id', Auth::user()->id)->where('problems_id', $group->problem_id)->first();
            $model->teamwork_id = $teamwork->teamwork_id;
        }
        
        $model->save();
        $data = [];
        $data['user'] = Auth::user();
        $data['type'] = $action;
        $data['activity'] = Activity::find($actID);
        $data['allDataDB'] = $model;
        $data['data'] = $data;
        broadcast(new InteractionSent($data, $group->problem_id))->toOthers();
    }

    public function getInteraction($problemID){
        $interactions = Interactions::where('problem_id', $problemID)->get();
        $dataReturn = [];
        foreach($interactions as $data){
            $user = User::find($data->user_id);
            $teamwork = Teamwork::find($data->teamwork_id);
            $activity = Activity::find($data->activity_id);
            $problem = Problem::find($problemID);
            $dataNew = [];
            $dataNew['type'] = $data->type;
            $dataNew['data'] = $data->data;
            $dataNew['activity'] = $activity;
            $dataNew['problem'] = $problem;
            $dataNew['user'] = $user;
            $dataNew['teamwork'] = $teamwork;
            $dataNew['allDataDB'] = $data;
            
            array_push($dataReturn, $dataNew);
        }
        return $dataReturn;
    }
}
