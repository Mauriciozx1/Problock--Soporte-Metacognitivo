<?php

namespace CSLP\Http\Controllers;

use CSLP\TeamworkActivity;
use CSLP\ActivitiesGroup;
use CSLP\Activity;
use CSLP\Student;
use CSLP\Course;
use CSLP\CourseInscription;
use CSLP\GroupActivityLink;
use CSLP\Problem;
use CSLP\Resource;
use CSLP\Teamwork;
use CSLP\TeamworkInscription;
use CSLP\LinkTeamworkInscription;
use CSLP\User;
use CSLP\Questions;
use Input;
use Auth;
class MakerController extends Controller {

    public function getIndex($problemID = 1) {

        return view('/maker/make', ['problem' => json_encode(self::getProblem($problemID))]);
    }

    public function getActivities($problemID = 1){
        $problem = Problem::find($problemID);
        $typeProblem =  $problem->type_problem;
        return view('/maker/make', ['problem' => json_encode(self::getProblem($problemID)), 'type' => $typeProblem]);

    }
    public function getProblemtype($problemID = 1){
        $problem = Problem::find($problemID);
        $typeProblem =  $problem->type_problem;
        $data = [];
        $data['type'] = $typeProblem;
        return $typeProblem;
    }
    public static function getProblem($problemID = 1) {
        $problem = Problem::find($problemID);
//        $exerciseName = $problem->name;
        $activitiesGroups = $problem->activitiesGroups;
        $activitiesGroupsIds = $activitiesGroups->pluck('id');

        $gals = GroupActivityLink::whereIn('group_id', $activitiesGroupsIds)->get();
        $activitiesIds = $gals->pluck('activity_id');

        $activities = Activity::whereIn('id', $activitiesIds)->get();

        $resources = Resource::all();

        $problemArray = [];

        foreach($activitiesGroups as $group) {
            $tempGroup = [];
            $tempGroup['id'] = $group->id;
            $tempGroup['name'] = $group->name;
            $tempGroup['typeProblem'] = $problem->type_problem;
            $tempGroup['activities'] = [];

            $actLinks = $gals->where('group_id', $group->id);

            foreach($actLinks as $alnk) {
                $act = TeamworkActivity::where('activity_id',$alnk->activity_id)->first();
                $tempActivity = $activities->where('id', $alnk->activity_id)->first();
                $res = $resources->where('activity_id', $tempActivity->id)->first();
                $tempActivity->resource = ($res != null)? $res->value : "";
                $tempActivity->rules = json_decode($tempActivity->objectives);
                $tempActivity['liderID'] =($act != null)? $act->user_lider_id : "";
                $tempActivity['questions'] = Questions::where('activiti_id','=',$tempActivity->id)->get();
                array_push($tempGroup['activities'], $tempActivity);
            }

            array_push($problemArray, $tempGroup);
        }
        return $problemArray;
    }
   

    public function postDeleteactivity() {
        Activity::destroy(Input::get('id'));
    }
    public function postNewactivity() {
        //Creamos la actividad.
        $data = Input::all();
        $group = ActivitiesGroup::find($data['id']);
        $problem = Problem::find($group->problem_id);
        $activity = new Activity;
        $activity->name = 'Nueva actividad';
        $activity->type = Input::get('type');
        $activity->problem_type = $problem->type_problem;
        $activity->save();
        $questions = QuestionController::createQuestion($activity->id);
        
        //Crea la relacion entre el grupo y la actividad
        $gal = new GroupActivityLink;
        $gal->group_id = Input::get('id');
        $gal->activity_id = $activity->id;
        $gal->save();

        return ['id' => $activity->id, 'questions' => $questions];
    }

    public function postSaveactivity() {

        $data = Input::all();
        $activity = Activity::find($data['id']);
        //Guarda la nueva informacion de la actividad
        $activity->name = $data['name'];
        $activity->answer = $data['answer'];
        $activity->objectives = $data['rules'];
        $activity->quantitative = $data['quantitative'];
        $activity->qualitative = $data['qualitative'];
        $activity->save();
        $questions = Questions::where('activiti_id', '=', $activity->id)->get();
        if($data['questionsDelete'] != null){
            $arrayQuestionsDelete = $data['questionsDelete'];
            foreach($arrayQuestionsDelete as $questionDelete){
                Questions::destroy($questionDelete);
            }  
        }
        if($data['questions'] != null){
            $arrayQuestions = $data['questions'];
            foreach($arrayQuestions as $question){
                if($questions == null){
                    $questionModel = new Questions;
                    $questionModel->activiti_id = $activity->id;
                    $questionModel->question = $question['question'];
                    $questionModel->type = $question['type'];
                    $questionModel->position = $question['position'];
                    $questionModel->scale = $question['scale'];
                    $questionModel->save();
                }
                if($questions != null){
                    if($question['id'] == null){
                        $questionModel = new Questions;
                        $questionModel->activiti_id = $activity->id;
                        $questionModel->type = $question['type'];
                    }
                    if($question['id'] != null){
                        $questionModel = Questions::find($question['id']);
                    }
                    $questionModel->question = $question['question'];
                    $questionModel->position = $question['position'];
                    $questionModel->scale = $question['scale'];
                    $questionModel->save();
                }
            }
            
        }
        

        //Comprueba que la actividad tiene un recurso asignado
        $resource = Resource::where('activity_id', '=', $activity->id)->first();
        if($resource == null) {
            $resource = new Resource;
            $resource->activity_id = $activity->id;
        }
        //Guarda el recurso de la actividad
        $resource->value = $data['resource'];
        $resource->save();
        return Questions::where('activiti_id', '=', $activity->id)->get();
    }

    public function postSavegroupname() {
        $ag = ActivitiesGroup::find(Input::get('id'));
        $ag->name = Input::get('name');
        $ag->save();
    }

    //EXERCISE PART

    public function postSaveproblem() {
        $data = Input::all();
        $isNew = false;
        if($data['id'] != null) {
            $problem = Problem::find($data['id']);
        } else {
            $isNew = true;
            $problem = new Problem;
            $problem->course_id = $data['course_id'];
        }
        $studentsIds = [];
        $userInscriptions = CourseInscription::where('course_id', $data['course_id'])->pluck('user_id');
        $students = Student::all(); 
        foreach($userInscriptions as $u){
            foreach($students as $s){  
                if($u == $s->user_id && $u != Auth::user()->id){
                    array_push($studentsIds, $s->user_id); 
                }
            }
        }
        $problem->name = $data['name'];
        $problem->description = $data['description'];
        $problem->open_at =$data['open_at'];
        $problem->close_at = $data['close_at'];
        $problem->p_autoadd = $data['p_autoadd'];
        $nMember = 3;
        if(count($studentsIds) > $nMember){
            $countTeamwork = count($studentsIds) / $nMember;
        }else{
            $countTeamwork = 1;
        }
        //Generamos la cantidad optima para no dejar a ningun alumno sin curso.
        if($countTeamwork > round($countTeamwork)){
            $countTeamwork = round($countTeamwork) + 1;
        }else{
            $countTeamwork = round($countTeamwork);
        }

        $problem->teamworks = $countTeamwork;
        $problem->type_problem = $data['type_problem'];
        $problem->n_student = count($studentsIds);
        $problem->save();

        if($isNew) {
            //Crea los 4 grupos de actividades predeterminado
            $agNames = ['Activación', 'Elaboración', 'Consolidación', 'Reflexión'];
            $countActivitiesGroup =[];
            foreach($agNames as $name) {
                 $group = new ActivitiesGroup;
                 $group->problem_id = $problem->id;
                 $group->name = $name;
                 $group->save();
                 array_push($countActivitiesGroup, $group->id);
            }
            $inscriptions = CourseInscription::where('course_id', '=', $problem->course_id)->pluck('user_id');
            foreach($inscriptions as $idUser){
                $user = User::find($idUser);
                if($user->type == "student"){
                    $status = new StatusProblem;
                    $status->user_id = $idUser;
                    $status->problem_id = $problem->id;
                    $status->status = 'offline';
                    $status->save();
                }
            }
            if($problem->teamworks > 0){
                //La cantidad de usuarios identificados la dividimos con la cantidad de integrantes por grupo
                for($n = 0; $n < $countTeamwork; $n++){
                    $teamwork = new Teamwork;
                    $teamwork->name = 'Nuevo equipo: ' . ($n + 1);
                    $teamwork->save();
                    for($i = 0; $i < $nMember; $i++){
                        if(count($studentsIds) != null){
                            $teamworkI = new TeamworkInscription;
                            $teamworkI->problems_id = $problem->id;
                            $teamworkI->teamwork_id = $teamwork->id;
                            $teamworkI->student_id = $studentsIds[0];
                            array_splice($studentsIds, 0, true);
                            
                        }
                        $teamworkI->save();
                    }
                      
                    foreach($countActivitiesGroup as $nCag){
                        $linkTeamwork = new LinkTeamworkInscription;
                        $linkTeamwork->teamwork_id = $teamwork->id;
                        $linkTeamwork->activities_group_id = $nCag;
                        $linkTeamwork->save();
                    }
                }
            }
        }
           
        
        return $problem->id;
    }
    
    public function postDeleteproblem() {
        $problemId = Input::get('id');
        Problem::destroy($problemId);

        return "Problema Eliminado";
    }
}
