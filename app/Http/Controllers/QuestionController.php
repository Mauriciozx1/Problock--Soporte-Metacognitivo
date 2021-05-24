<?php

namespace CSLP\Http\Controllers;

use CSLP\Questions;
use CSLP\ActivitiesGroup;
use CSLP\GroupActivityLink;
use CSLP\Activity;
use CSLP\AnswerQuestion;
use CSLP\Problem;
class QuestionController extends Controller
{
    public static function createQuestion($idActivity){
        $questionsQuantitative = ['De 1 a 10, ¿Qué tan difícil fue realizar esta actividad?','De 1 a 10, ¿Te ha gustado realizar esta actividad?'];
        $questionsQualitative = ['Explica con tus palabras, ¿Qué fue lo que hiciste para completar la actividad?','¿Qué es lo que harías distinto la próxima vez para mejorar?'];
        
        $questionModel = new Questions;
        $questionModel->activiti_id = $idActivity;    
        $questionModel->question = "De 1 a 10, ¿Qué tan difícil fue realizar esta actividad?";
        $questionModel->type = 'quantitative';
        $questionModel->position = 0;
        $questionModel->scale = 10;
        $questionModel->save();
        
        $questionModel = new Questions;
        $questionModel->activiti_id = $idActivity;
        $questionModel->question = "De 1 a 10, ¿Te ha gustado realizar esta actividad?";
        $questionModel->type = 'quantitative';
        $questionModel->position = 1;
        $questionModel->scale = 10;
        $questionModel->save();

        $questionModel = new Questions;
        $questionModel->activiti_id = $idActivity;
        $questionModel->question = "Explica con tus palabras, ¿Qué fue lo que hiciste para completar la actividad?";
        $questionModel->type = 'qualitative';
        $questionModel->position = 2;
        $questionModel->scale = 0;
        $questionModel->save();
        
        $questionModel = new Questions;
        $questionModel->activiti_id = $idActivity;
        $questionModel->question = "¿Qué es lo que harías distinto la próxima vez para mejorar?";
        $questionModel->type = 'qualitative';
        $questionModel->position = 3;
        $questionModel->scale = 0;
        $questionModel->save();
        
        return Questions::where('activiti_id', '=', $idActivity)->get(); 
        
    }
    public static function getQuestions($idProblem){
        $arrayActivity = [];
        $problem = Problem::find($idProblem);
        $activitiesGroups = $problem->activitiesGroups;
        $activitiesGroupsIds = $activitiesGroups->pluck('id');
        $gals = GroupActivityLink::whereIn('group_id', $activitiesGroupsIds)->get();
        $activitiesIds = $gals->pluck('activity_id');
        $activities = Activity::whereIn('id', $activitiesIds)->get();
        
        //Guardamos las actividades que tengan el permiso activado de 'qualitative' y 'quantitative'
        foreach($activities as $activity){
            $act = Activity::where('id','=',$activity->id)->first();
            if($act != null){
                if($act->quantitative == 'true' || $act->qualitative == 'true'){
                    array_push($arrayActivity, $act);
                }
            }        
        }     
        //
        //dd($arrayActivity);
        $arrayData = [];
        
        foreach($arrayActivity as $activity){
            $questions = null;
            $data = [];
            if($activity->quantitative == 'true' && $activity->qualitative == 'false' ){
                $questions = Questions::where('activiti_id', '=', $activity->id)->where('type','=','quantitative')->get();
            }
            if($activity->qualitative == 'true' && $activity->quantitative == 'false'){
                $questions = Questions::where('activiti_id', '=', $activity->id)->where('type','=','qualitative')->get();
            }
            if($activity->qualitative == 'true' && $activity->quantitative == 'true'){
                $questions = Questions::where('activiti_id', '=', $activity->id)->get();
            }
            if($questions != null){
                $data['activity'] = $activity;
                $data['questions'] = [];
                foreach($questions as $question){
                    $questionData = [];
                    $questionData['question'] = $question;
                    $questionData['students'] = AnswerQuestion::getAnswer($question->id);
                    array_push($data['questions'], $questionData);
                }
            }
            array_push($arrayData, $data);
        }
        return $arrayData;
    }
}
