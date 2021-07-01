<?php

namespace CSLP\Http\Controllers;

use Auth;
use CSLP\Events\ScreenSent;
use CSLP\Events\StatusSent;
use CSLP\Events\StatusTeamSent;
use CSLP\Events\TeamworkSent;
use CSLP\Events\ActivitySent;
use Carbon\Carbon;
use CSLP\BlocklyActivityAnswer;
use CSLP\Problem;
use CSLP\Score;
use CSLP\Teamwork;
use CSLP\TeamworkInscription;
use CSLP\User;
use CSLP\Student;
use CSLP\Message;
use CSLP\Activity;
use CSLP\GroupActivityLink;
use CSLP\ActivitiesGroup;
use CSLP\LinkTeamworkInscription;
use CSLP\TeamworkActivity;
use CSLP\AnswerQuestion;
use CSLP\StatusProblem;
use CSLP\StatusTeam;
use Input;

class WorkBoardController extends Controller {

    public function getIndex() {
        return redirect('/problems');
    }
    public function postState() {
        //obtener id del problema
        $groupLink = GroupActivityLink::where('activity_id', Input::get('activity_id'))->first();
        $groupActivity = ActivitiesGroup::where('id', $groupLink->group_id)->first();

        //si es un estado de usuario
        if(Input::get('status') == 'online' || Input::get('status') == 'afk'){

            //Se busca un estado
            $modelStatus = StatusProblem::where('user_id', Auth::user()->id)->where('problem_id', $groupActivity->problem_id)->first();

            //no existe se crea uno, sino se edita el "status" del modelo.
            if(!$modelStatus){
                $modelStatus = new StatusProblem;
                $modelStatus->user_id = Auth::user()->id;
                $modelStatus->problem_id = $groupActivity->problem_id;
            }
            $modelStatus->status = Input::get('status');
            $modelStatus->save();

            //Envio de evento al profesor
            broadcast(new StatusSent($groupActivity->problem_id, $modelStatus))->toOthers();
        }
        //si es un estado de Grupo
        if(Input::get('status') == 'afkTeam'){

            //Obtenemos detalles de los grupo: IDs de Grupos, Estado, Integrantes.
            
            $statusTeam = StatusTeam::where('id_team', Input::get('teamwork_id'))->where('id_problem', $groupActivity->problem_id)->first();
            
            $studentsTeamwork = TeamworkInscription::where('teamwork_id',Input::get('teamwork_id'))->pluck('student_id');
            $students = Input::get('online');
            $countOnline = count($students);
            foreach($studentsTeamwork as $sID){
                $status = StatusProblem::where('user_id', $sID)->where('problem_id', $groupActivity->problem_id)->first();
                $countP = 0;
                $in = false;
                foreach($students as $student){
                    $countP++;
                    if($status){
                        if($student['id'] == $sID){
                            $in = true;
                        }
                        if($countP == $countOnline && $in == false){
                            StatusProblem::destroy($status->id);
                        }   
                    }
                }
            }

            //Establecemos estado AFK al grupo con ausencia de integrantes.
            if($statusTeam == null){
                if($countOnline == 1){
                    $statusTeam = new StatusTeam;
                    $statusTeam->id_team = Input::get('teamwork_id');
                    $statusTeam->id_problem = $groupActivity->problem_id;
                    $statusTeam->status = 'afkTeam';
                    $statusTeam->save();
                }
            }
            
            if($countOnline != count($studentsTeamwork)){
                //recorremos lista de integrantes por grupo.
                foreach($studentsTeamwork as $sID){
                    //estado de cada estudiante
                    $status = StatusProblem::where('user_id', $sID)->where('problem_id', $groupActivity->problem_id)->first();
                    $idTeams = [];
                    $teams = TeamworkInscription::where('problems_id', $groupActivity->problem_id)->pluck('teamwork_id');
                    foreach($teams as $t){
                        $team = true;
                        $countUser = TeamworkInscription::where('problems_id', $groupActivity->problem_id)->where('teamwork_id',$t)->pluck('student_id');
                        if($countUser == null){
                            $team = false;
                        }
                        
                        if($idTeams == null && $team == true){
                            array_push($idTeams, $t);
                        }else{
                            $in = false;
                            foreach($idTeams as $id){
                                if($id == $t){
                                    $in = true;
                                }
                            }
                            if($in == false){
                                array_push($idTeams, $t);
                            }
                        }
                    }
                    $countTeam = count($idTeams);
                    //no existe un estado, se revisa la inscripcion. 

                    if($status == null){
                        $inscription = TeamworkInscription::where('problems_id', $groupActivity->problem_id)->where('student_id', $sID)->first();
                        $pivote = false;
                        $pivoteN = 0;

                        //se recorre las lista de grupos
                        foreach($idTeams as $teamID){
                            $statusTeamID = StatusTeam::where('id_team', $teamID)->where('id_problem', $groupActivity->problem_id)->first();

                            //Existe grupo recien creado por usuarios AFK, se obtienen sus integrantes
                            if($statusTeamID){
                                if($statusTeamID->status == 'new'){
                                    $studentNewTeam = TeamworkInscription::where('teamwork_id',$teamID)->pluck('student_id');
        
                                    // el grupo tiene menos de 3 integrantes, se integra.
                                    if(count($studentNewTeam) < 3 ){
                                        $pivote = true;
                                        $inscription->teamwork_id = $teamID;
                                        $inscription->save();
                                    }
                                    //el grupo esta lleno,
                                    if(count($studentNewTeam) == 3 ){
                                        $pivote = false;
                                        // se elimina estado 
                                        StatusTeam::destroy($statusTeamID->id);
                                    }
                                }
                            }
                            
                            $pivoteN++;
                            //No existe grupo con estado "new", se crea grupo
                            if($countTeam == $pivoteN && $pivote == false){
                                $teamwork = new Teamwork;
                                $teamwork->name = 'Nuevo equipo: ' . ($countTeam+1);
                                $teamwork->save();
        
                                //Actualizamos la inscripcion
                                $inscription->teamwork_id = $teamwork->id;
                                $inscription->save();
        
                                //Generamos su estado "new"
                                $statusTeam = new StatusTeam;
                                $statusTeam->id_team = $teamwork->id;
                                $statusTeam->id_problem = $groupActivity->problem_id;
                                $statusTeam->status = 'new';
                                $statusTeam->save();

                            }   
                        }                    
                    }  
                }
            }
            
            $infoTeamwork = TeacherController::getExerciseTeamwork($groupActivity->problem_id);
            $arrayTeam = json_decode($infoTeamwork['teamworks']);
            foreach($arrayTeam as $team){
                $status = StatusTeam::where('id_team', $team->id)->where('id_problem', $groupActivity->problem_id)->first();
                if($status){
                    if($status->status == 'afkTeam'){
                        $team->status = 'afk';
                    }
                }
                foreach($team->students as $student){
                    $status = StatusProblem::where('problem_id', $groupActivity->problem_id)->where('user_id', $student->id)->first();
                    if($status){
                        if($status->status == 'afk'){
                            $student->status = 'error_outline';
                            $student->color = 'orange';
                        }
                        if($status->status == 'online'){
                            $student->status = 'check_circle';
                            $student->color = 'green';
                        }
                    }
                }
            }
            $teamworks = $arrayTeam;
            //se envia evento al profesor de estado
            broadcast(new StatusTeamSent($groupActivity->problem_id, Input::get('teamwork_id'), $statusTeam ,json_encode($teamworks)))->toOthers();
        }
        if(Input::get('status') == 'onlineTeam'){

            //si existe estado, se elimina.
            $status = StatusTeam::where('team_id', Input::get('teamwork_id'))->where('problem_id', $groupActivity->problem_id)->first();
            if($status){
                StatusTeam::destroy($status->id);
            }
            //se envia evento al profesor de estado
            $infoTeamwork = TeacherController::getExerciseTeamwork($groupActivity->problem_id);
            $arrayTeam = json_decode($infoTeamwork['teamworks']);
            foreach($arrayTeam as $team){
                $statusTeam = StatusTeam::where('id_team', $team->id)->where('id_problem', $groupActivity->problem_id)->first();
                if($statusTeam){
                    if($statusTeam->status == 'afkTeam' && count($team->students) >= 2){
                        $team->status = null;
                        StatusTeam::destroy($statusTeam->id);
                    }
                }
                if(count($team->students) == 1){
                    if(!$statusTeam){
                        $statusTeam = new StatusTeam;
                        $statusTeam->id_team = $team->id;
                        $statusTeam->id_problem = $problemid;
                    }
                    $statusTeam->status = 'afkTeam';
                    $statusTeam->save();
                    
                    $team->status = 'afk';
                }
            }
            $teamworks = $arrayTeam;
            broadcast(new StatusTeamSent($groupActivity->problem_id, Input::get('teamwork_id'), null , $teamWorks))->toOthers();
        }
                
    }
    public function getView($problemId) {

        if($problemId === null)
            return redirect('/problems');

        $problem = Problem::find($problemId);

        if($problem == null)
            return redirect('/exercises');

        $actualTimestamp = Carbon::now();
        if($problem->open_at > $actualTimestamp) {
            return 'El ejercicio se puede realizar desde: ' . $problem->open_at;
        }

        if($problem->close_at < $actualTimestamp) {
            return 'El ejercicio se cerró el ' . $problem->close_at;
        }
        
        $problemStructure = MakerController::getProblem($problemId);
        $group = ActivitiesGroup::where('problem_id','=',$problemId)->pluck('id');
        $arrayActivitiesID = [];
        $scoresArray = [];
        $activiti = false;
        $activitiId = 0;
        foreach($group as $g){
            $groupActivities = GroupActivityLink::where('group_id','=',$g)->pluck('activity_id'); 
            foreach($groupActivities as $gAc){
                $activity = Activity::where('id', $gAc)->first();
                $scores = Score::where('student_id', Auth::user()->student->id)->where('activity_id', $gAc)->first();
                if($scores == null){
                    $scoresArray[strval($gAc)] = 0;
                }else{
                    $scoresArray[strval($gAc)] = $scores->score;
                }

                if($scoresArray[strval($gAc)] == 0){
                    if($activiti == false){
                        $activitiId = $gAc;
                        $act = Activity::find($gAc);
                        $activiti = true;
                    }
                }
                $scoresArray['typeAct'] = $activity->type;
            }    
        }  
        //Si es primera vez que entra, y el estudiante  fue agregado al curso se verifica su estado.
        $statusUser = StatusProblem::where('user_id', Auth::user()->id)->where('problem_id', '=', $problemId)->first();
        $status = null;
        if($statusUser != null){
            if($statusUser->status == 'afk'){
                $status = 'error_outline';
            }
            if($statusUser->status == 'online'){
                $status = 'check_circle';
            }
        }
        if($statusUser == null){
            $statusUser = new StatusProblem;
            $statusUser->status = 'online';
            $statusUser->user_id = Auth::user()->id;
            $statusUser->problem_id = $problemId;
            $statusUser->save();
            $status = 'check_circle';
        }

        //Obteniendo los scores obtenidos en las actividades
        if($problem->type_problem == 'Grupal'){
            $teamworkInscription = TeamworkInscription::where('problems_id', $problemId)->where('student_id', \Auth::user()->id)->first();
            $statusTeam = StatusTeam::where('id_problem', $problemId)->where('id_team',$teamworkInscription->teamwork_id)->first();
            if($statusTeam){
                if($statusTeam->status == 'afk'){
                    $statusT = 'afk';
                }
            }  
            //foreach($teamworkInscription as $teamI){
            $studentsTeamwork = TeamworkInscription::where('teamwork_id',$teamworkInscription->teamwork_id)->pluck('student_id');
            $countStudents = count($studentsTeamwork);
            $teamActivity = TeamworkActivity::where('teamwork_id', '=', $teamworkInscription->teamwork_id)->first();
            $teamworks = Teamwork::where('id', '=', $teamworkInscription->teamwork_id)->first();
            if($teamActivity == null){
                $userLider = null;
                $userLiderId = null;
            }else{
                $userLider = $teamActivity->user_lider_id;
                $userLider = User::where('id', '=', $teamActivity->user_lider_id)->first();
                $userLiderId = $userLider;
            }
            $teamwork = [];
            $teamwork['id'] = $teamworks->id;
            $teamwork['Tname'] = $teamworks->name;
            $teamwork['userLider'] = $userLiderId;
            $teamwork['countUser'] = $countStudents;
            $teamwork['students'] = [];
            foreach ($studentsTeamwork as $id){
                $student = User::find($id);
                $students = [];
                $students['id'] = $id;
                $students['name'] = $student->name;
                $students['flastname'] = $student->flastname;
                array_push($teamwork['students'], $students);
            }
            //}
         
            return view('/workboard/view', ['statusT' => $statusTeam,'myStatus' => $status, 'activityId' => $activitiId, 'userLider' => $userLider ,'userscount' => $teamwork['countUser'],'teamworkid' => $teamwork['id'],'studentUser' => Auth::user() ,'userId' => Auth::user()->id, 'problem' => json_encode($problemStructure), 'scores' => json_encode($scoresArray), 'type'=>$problem->type_problem, 'problemid' =>$problemId,'teamwork' =>json_encode($teamwork)]);
        }else{
            return view('/workboard/view', ['myStatus' => $status, 'problem' => json_encode($problemStructure), 'scores' => json_encode($scoresArray), 'type'=>$problem->type_problem, 'problemid' =>$problemId]);
        }
        
        
    }

    //Retorna los recursos y la respuesta a una actividad específica
    public function getActivityinfo($activityID) {
        //Obtener recursos
        //Obtener respuesta actual
        $lider = null;
        $activity = Activity::where('id','=',$activityID)->first();
        $activityGroup = GroupActivityLink::where('activity_id', $activityID)->first();
        $group = ActivitiesGroup::where('id', $activityGroup->group_id)->first();
        $inscription = TeamworkInscription::where('problems_id', $group->problem_id)->where('student_id', Auth::user()->id)->first();
        $teamworkid = null;
        $statusUser = StatusProblem::where('problem_id', $group->problem_id)->where('user_id', Auth::user()->id)->first();
        $status = null;
        $statusT = null;
        if($statusUser != null){
            if($statusUser->status == 'afk'){
                $status = 'error_outline';
            }
        }
        if($statusUser == null){
            $statusUser = new StatusProblem;
            $statusUser->status = 'online';
            $statusUser->user_id = Auth::user()->id;
            $statusUser->problem_id = $group->problem_id;
            $statusUser->save();
            $status = 'check_circle';
        }
        if($inscription != null){
            $teamworkid = $inscription->teamwork_id;
            $statusTeam = StatusTeam::where('id_team', $inscription->teamwork_id)->where('id_problem', $group->problem_id)->first();
            if($statusTeam){
                if($statusTeam->status == 'afkTeam'){
                    $statusT = 'afk';
                }
            } 
        }
        
        if($activity->type == 'Grupal'){
            
            $activityLider = TeamworkActivity::where('activity_id', '=', $activityID)->first();
            if($activityLider != null){
                $lider = $activityLider->user_lider_id;
            }
        }
        $answer = BlocklyActivityAnswer::where('student_id', '=', Auth::user()->student->id)->where('activity_id', '=', $activityID)->first();
        $valueAnswer = '';
        $permQualitative = $activity->qualitative;
        $permQuantitative = $activity->quantitative;
        $valueScore = 0;
        //$questions = $activity->$questions;
        sleep(1);
        if($answer != null) {
            $score = Score::where('answere_id', '=', $answer->id)->where('activity_id', '=', $activityID)->first();
            $valueAnswer = $answer->value;
            if($score != null){
                $valueScore = $score->score;
                //return ['score' => $score->score,'resource' => '', 'answer' => $answer->value, 'lider' => $lider];
            }
            /*if($score == null){
                return ['score' => 0,'resource' => '', 'answer' => $answer->value, 'lider' => $lider];
            }*/
        }
        return ['statusT' => $statusT,'status'=> $status,'idTeamwork' => $teamworkid, 'score' => $valueScore,'resource' => '', 'answer' => $valueAnswer, 'lider' => $lider, 'qualitative' => $permQualitative, 'quantitative' => $permQuantitative];
    }
    public function postLider(){
        $activitiID = Input::get('activityid');
        $teamworkID = Input::get('teamworkid');
    
        $ActivityLider = TeamworkActivity::where('activity_id', $activitiID)->where('teamwork_id', $teamworkID)->first();
        $TeamworkInscription = TeamworkInscription::where('teamwork_id', $teamworkID)->pluck('student_id');
        $in = false;
        if($ActivityLider != null){
            foreach($TeamworkInscription as $uID){
                if($uID == $ActivityLider->user_lider_id){
                    $in = true;
                }
            }
        }
        if($ActivityLider == null || $in == false){
            $TeamworkInscription = TeamworkInscription::where('teamwork_id', $teamworkID)->pluck('student_id');
            $arrayInterger = [];
            foreach($TeamworkInscription as $idUser){
                array_push($arrayInterger,$idUser);
            }

            $lider = array_rand($arrayInterger,1);
            $lider = $arrayInterger[$lider];
            if($ActivityLider == null){
                $ActivityLider = new TeamworkActivity;
                $ActivityLider->teamwork_id = $teamworkID;
                $ActivityLider->activity_id = $activitiID;
            }
            $ActivityLider->user_lider_id = $lider;
            $ActivityLider->save();
        }
        return ['lider' => User::where('id',$ActivityLider->user_lider_id)->first()];
        
    }
    //Guarda una respuesta en la base de datos
    public function postAnswer() {
        $methode = Input::get('methode');
        //Buscamos la Activity, GroupAcivityLink y las TeamworkInscriptions
        $activity = Activity::where('id','=',Input::get('activity_id'))->first();
        $groupActivity = GroupActivityLink::where('activity_id', '=', Input::get('activity_id'))->first();
        //extraer respuestas de preguntas
        $questionAnswer = Input::get('questions_answer');

        if($questionAnswer != null){
            //recorremos las respuestas
            foreach($questionAnswer as $questionA){
                $answerQuestion = AnswerQuestion::where('question_id', '=', $questionA['question_id'])->where('user_id', '=', Auth::user()->id)->first();
                //si no existe, generamos nueva en DB.
                if($answerQuestion == null){
                    $answerQuestion = new AnswerQuestion;
                    $answerQuestion->question_id = $questionA['question_id'];
                    $answerQuestion->user_id = Auth::user()->id;
                }
                $answerQuestion->answer = $questionA['answer'];
                $answerQuestion->points = $questionA['points'];
                $answerQuestion->save();
            }
        }
        //¿La Activity es de tipo grupal?
        if($activity->type == 'Grupal'){
            $teamInscription = LinkTeamworkInscription::where('activities_group_id', '=', $groupActivity->group_id)->first();
            if($methode == 'save'){
                $teamwork = TeamworkInscription::where('teamwork_id','=',Input::get('teamworkid'))->get();
                $teamworkActivity = TeamworkActivity::where('activity_id', '=',Input::get('activity_id'))->first();

                foreach($teamwork as $TI){

                    //Encontrado al user de tipo Student
                    $student = Student::where('user_id','=',$TI->student_id)->first();

                    //GUARDANDO LA RESPUESTA
                    $answer = BlocklyActivityAnswer::where('student_id', '=', $student->id)->where('activity_id', '=', Input::get('activity_id'))->first();
                    $answerPrevio = $answer;

                    //Si ya existe una respuesta previa, se actualiza.
                    if($answer !== null) {
                        $answer->value = Input::get('answer');
                    }else{//se crea uno nuevo
                        $answer = new BlocklyActivityAnswer;
                        $answer->activity_id = Input::get('activity_id');
                        $answer->student_id = $student->id;
                        $answer->value = Input::get('answer');
                    }
                    $answer->save();
                    $score = Score::where('answere_id', '=', $answer->id)->where('activity_id', '=', Input::get('activity_id'))->first();
                        //Si ya existe un score previo, se actualiza
                        if($score !== null) {
                            $score->score = Input::get('score');;
                        }else{//se crea uno nuevo
                            $score = new Score;
                            $score->activity_id = Input::get('activity_id');
                            $score->answere_id = $answer->id;
                            $score->student_id = $student->id;
                            $score->score = Input::get('score');
                        }
                        $score->save();
                    }
                return 0;
            }
            if($methode == 'vote'){
                $data = [];
                $data['score'] = Input::get('score');
                $data['answer'] = Input::get('answer');
                $data['imgLider'] = Input::get('imgLider');
                $data['activiti'] = Input::get('activiti');
                broadcast(new ScreenSent($teamInscription->teamwork_id, Input::get('activity_id'), $methode, $data ))->toOthers();
                return 2;
            }
            
        }
        //La Activity es de tipo Individual o no pertenece a Problema grupal.
        else{
            
            $studentID = Auth::user()->student->id;

            //GUARDANDO LA RESPUESTA
            $answer = BlocklyActivityAnswer::where('student_id', '=', $studentID)->where('activity_id', '=', Input::get('activity_id'))->first();

            //Si ya existe una respuesta previa
            if($answer !== null) {
                $answer->value = Input::get('answer');
            } else {
                //Si no existe respuesta previa hay que crear una nueva
                $answer = new BlocklyActivityAnswer;
                $answer->activity_id = Input::get('activity_id');
                $answer->student_id = $studentID;
                $answer->value = Input::get('answer');
            }
            $answer->save();

            //GUARDANDO EL PUNTAJE OBTENIDO
            $obtainedScore = Input::get('score');

            $score = Score::where('answere_id', '=', $answer->id)->where('activity_id', '=', Input::get('activity_id'))->first();
            
            if($score !== null) {
                $score->score = $obtainedScore;
            } else {
                //Si no existe respuesta previa hay que crear una nueva
                $score = new Score;
                $score->activity_id = Input::get('activity_id');
                $score->answere_id = $answer->id;
                $score->student_id = $studentID;
                $score->score = $obtainedScore;
            }
            $score->save();
        return 1;
        }
    }

    public function getStudent() {
        return Auth::user()->student;
    }
    public function postScreenLive(Request $request){
        $lider = Auth::user()->id;
        $findLive = LiveData::where('user_lider_id')->where('teamwork_id', $request->teamworkid)->first();
        $dataLive = LiveData::find($findLive->id);
        if($dataLive){
            $dataLive->data = $request->img;
            $dataLive->save();
        }else{
            $dataLive = new LiveData;
            $dataLive->user_lider_id = Auth::user()->id;
            $dataLive->teamwork_id = $request->teamworkid;
            $dataLive->data = $reques->img;
        }
    }
}