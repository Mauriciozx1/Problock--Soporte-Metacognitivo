<?php

namespace CSLP\Http\Controllers;

use CSLP\Activity;
use CSLP\GroupActivityLink;
use CSLP\Problem;
use CSLP\Score;
use CSLP\Student;
use CSLP\TeamworkInscription;
use CSLP\TeamworkActivity;
use CSLP\Teamwork;
use CSLP\Course;
use CSLP\CourseInscription;
use CSLP\User;
use CSLP\LinkTeamworkInscription;
use CSLP\Questions;
use CSLP\StatusProblem;
use CSLP\StatusTeam;
use CSLP\Events\TeamworkUpdate;
use Input;
use Auth;
class TeacherController extends Controller {

    public function getIndex() {
        return redirect('/problems');
    }
    public function getScores($excerciseId = null) {
        $query = true;
        return view('qualifications/teacher-view', $this->getExercisescore($excerciseId, $query));
    }

    public function getSteamwork($exerciseId = null){
        $query = false;
        return view('teamwork/scores-view',$this->getExercisescore($exerciseId, $query));
    }

    public function getTeamwork($excerciseId = null){
        return view('teamwork/teacher-view', $this->getExerciseTeamwork($excerciseId));
    }
    public static function getState($user,$problemid){
        $status = StatusProblem::where('problem_id', $problemid)->where('user_id', Auth::user()->id)->first();
        $data = [];
        if($status){
            if($status->status == 'afk'){
                $data['status'] = 'error_outline';
                $data['color'] = 'orange';
            }
            if($status->status == 'online'){
                $data['status'] = 'check_circle';
                $data['color'] = 'green';
            }
        }else{
            $data['status'] = 'check_circle';
            $data['color'] = 'green';
        }
        return $data;
        
    }
    public function postTeamwork(){
        //Almacenamos datos del FrontEnd
        $teamworks = Input::get('teamworks');
        $idProblem = Input::get('problem_id');
        //Recorremos la data a actualizar.
        
        foreach($teamworks as $data) {
            $team = Teamwork::where('id', $data['id'])->first();
            //No existe el team y creara uno nuevo.
            if($team == null){
                $team = new Teamwork;
                $team->name = $data['nameTeam'];
                $team->save();
            }
            
            //Actualizamos el registro de Teamwork con los usuarios
            foreach($data['students'] as $student){

                $inscriptionTeam = TeamworkInscription::where('problems_id', $idProblem)->where('student_id', $student['id'])->first();
                $beforeTeam = $inscriptionTeam->teamwork_id;
                $inscriptionTeam->teamwork_id = $team->id;
                $inscriptionTeam->save();
                //Si el usuario es lider de una actividad este sera destituido.
                $lider = TeamworkActivity::where('user_lider_id', $student['id'])->where('teamwork_id', $beforeTeam)->first();
                if($lider != null){
                   TeamworkActivity::destroy($lider->id);
                }   
            } 
        }
        //retornamos la data ya actualizada al FrontEnd
        $updatedTeam = $this->getExerciseTeamwork($idProblem);
        $arrayTeam = json_decode($updatedTeam['teamworks']);
        foreach($arrayTeam as $team){
            $statusTeam = StatusTeam::where('id_team', $team->id)->where('id_problem', $idProblem)->first();
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
                    $statusTeam->id_problem = $idProblem;
                }
                $statusTeam->status = 'afkTeam';
                $statusTeam->save();
                
                $team->status = 'afk';
            }
            /*foreach($team->students as $student){
                $status = StatusProblem::where('user_id', $student->id)->where('problem_id', $idProblem)->first();
                if($status){
                    if($status->status == 'afk'){
                        $student->status = 'error_outline';
                        $student->color = 'orange';
                    }
                    if($status->status == 'on'){
                        $student->status = 'check_circle';
                        $student->color = 'green';
                    }
                }
            }*/
        }
        broadcast(new TeamworkUpdate($idProblem, $arrayTeam))->toOthers();
        return json_encode($arrayTeam);
    }
    public function getStates($problemid){
        
        $problem = Problem::find($problemid);
        $usersCourse = [];
        $studentsR = Student::all();
        $inscriptions = CourseInscription::where('course_id', '=', $problem->course_id)->pluck('user_id');
        foreach($inscriptions as $idUser){
            $status = StatusProblem::where('problem_id', '=', $problemid)->where('user_id', $idUser)->first();
            $user = User::find($idUser);
            if($user->type == 'student'){
                /*if($status){
                    if($status->status == 'afk'){
                        $user['status'] = 'error_outline';
                        $user['color'] = 'orange';
                    }
                }*/
                $user['status'] = 'highlight_off';
                $user['color'] = 'red';
                array_push($usersCourse, $user);
            }         
        }
    
        $infoTeamwork = $this->getExerciseTeamwork($problemid);
        $arrayTeam = json_decode($infoTeamwork['teamworks']);
        foreach($arrayTeam as $team){
            $statusTeam = StatusTeam::where('id_team', $team->id)->where('id_problem', $problemid)->first();
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
        $info = json_encode($arrayTeam);
        
        $problemData = json_encode(MakerController::getProblem($problemid));
        

        return view('/maker/view-state', ['type' => $problem->type_problem,'idProblem' => $problemid,'status' => $status,'problem' => $problemData, 'infoTeamwork' => $info, 'usersCourse' => $usersCourse]);
    }
    public function getExerciseTeamworkScore($exerciseId = 1) {
        $problem = Problem::find($exerciseId);
        $nameProblem = $problem->name;
        $problemId = $problem->id;
        $activitiesGroups = $problem->activitiesGroups;
        $activitiesGroupsIds = [];

        foreach($activitiesGroups as $ag) {
            array_push($activitiesGroupsIds, $ag->id);
        }

        $gals = GroupActivityLink::whereIn('group_id', $activitiesGroupsIds)->get();
        $activitiesIds = [];

        foreach($gals as $gal) {
            array_push($activitiesIds, $gal->activity_id);
        }
        $activities = Activity::whereIn('id', $activitiesIds)->select('id', 'name', 'type')->get();

        $activitiesNamesTeam = [];
        $activitiesNamesnoTeam = [];
        foreach($activities as $activity) {
            if($activity->type == 'Grupal'){
                array_push($activitiesNamesTeam, $activity->name);
            }
            if($activity->type == 'Individual'){
                array_push($activitiesNamesnoTeam, $activity->name);
            }
            else{
                array_push($activitiesNamesnoTeam, $activity->name);
            }
        }
        
        $data = ['exercise' => $nameProblem, 'activities' => $activitiesNamesTeam, 'activitiesnoTeam' => $activitiesNamesnoTeam];
        return $data;
    }

    public static function getExerciseTeamwork($exerciseId = 1) { 
        $problem = Problem::find($exerciseId);
        $nameProblem = $problem->name;
        $nTeamwork = $problem->teamworks;
        $problemId = $problem->id;
        $type = 'teacher';
        $teamworkInscriptions = TeamworkInscription::where('problems_id', '=', $problemId)->get()->sortBy('teamwork_id')->pluck('teamwork_id');
        $teamworkS = Teamwork::whereIn('id', $teamworkInscriptions)->get()->load('teamworks');
        $teamworkid = [];
    
        foreach($teamworkInscriptions as $twid){
            if($teamworkid == null){
                array_push($teamworkid, $twid);
            }else{
                if($teamworkid[count($teamworkid)-1] != $twid){
                    array_push($teamworkid, $twid);
                }
            }
        }
        $teamworkJSOArray = [];
        foreach($teamworkid as $idTeam){
            $tname = Teamwork::where('id', $idTeam)->get()->first();
            $teamworks = [];
            $teamworks['id'] = $idTeam;
            $teamworks['nameTeam'] = $tname->name;
            $teamworks['status'] = null;
            $teamworks['students'] = [];
            $userTeamwork = TeamworkInscription::where('teamwork_id', '=', $idTeam)->pluck('student_id');
            foreach($userTeamwork as $user) {
                $userTest = User::where('id', '=', $user)->get()->first();
                $userTest['status'] = 'highlight_off';
                $userTest['color'] = 'red';
                
                array_push($teamworks['students'], $userTest);    
            }
            array_push($teamworkJSOArray, $teamworks);
        }

        $data = ['exercise' => $nameProblem, 'type' => $type, 'teamworks' => json_encode($teamworkJSOArray)];

        return $data;

    }
    public function getExercisescore($exerciseId = 1, $query) {

        $problem = Problem::find($exerciseId);
        $exerciseName = $problem->name;
        $activitiesGroups = $problem->activitiesGroups;
        $activitiesGroupsIds = [];
        $questionData = QuestionController::getQuestions($exerciseId);
        foreach($activitiesGroups as $ag) {
            array_push($activitiesGroupsIds, $ag->id);
        }

        $gals = GroupActivityLink::whereIn('group_id', $activitiesGroupsIds)->get();
        $actIds = [];

        foreach($gals as $gal) {
            array_push($actIds, $gal->activity_id);
        }
        $activities = Activity::whereIn('id', $actIds)->get();
        $activitiesTeam = [];
        $activitiesnoTeam = [];
        $activitiesNames = [];
        $activitiesNamesTeam = [];
        $activitiesNamesnoTeam = [];
        $activitiesIDs = [];
        $activitiesIDsTeam = [];
        $activitiesIDsnoTeam = [];
        foreach($activities as $activity){
            if($activity->type == 'Grupal'){
                array_push($activitiesNamesTeam, $activity->name);
                array_push($activitiesTeam, $activity);
                array_push($activitiesIDsTeam, $activity->id);
                
            }
            if($activity->type == 'Individual'){
                array_push($activitiesNamesnoTeam, $activity->name);
                array_push($activitiesIDsnoTeam, $activity->id);
                array_push($activitiesnoTeam, $activity);
            }
            array_push($activitiesNames, $activity->name);
            array_push($activitiesIDs, $activity->id);
        }

        if($query == true){
            foreach($activities as $activity) {}
            $students = [];
            $studentsIds = [];
            $studentsAll = Student::all()->load('user');
            foreach($studentsAll as $users){
                array_push($studentsIds, $users->id);
                array_push($students, $users);
            }
            $scores = Score::whereIn('activity_id', $actIds)->whereIn('student_id', $studentsIds)->get();

            $studentsArray = [];
            foreach($students as $st) {
                $student = [];
                $student['fullName'] = $st->user->full_name;
                $student['scores'] = [];
                $student['exerciseScore'] = 0;

                if(count($activities) !== 0) {
                    foreach($activities as $act) {
                        $score = $scores->where('student_id', $st->id)->where('activity_id', $act->id)->first();
                        $scoreValue = 0;
                        if($score != null){
                            $scoreValue = $score->score;
                        }
                        array_push($student['scores'], $scoreValue);
                        $student['exerciseScore'] += $scoreValue;
                    }
                    $student['exerciseScore'] = round($student['exerciseScore'] / count($activities));
                }

                array_push($studentsArray, $student);
            }
            //Ordenando los estudiantes por calificacion final
            $sortedStudents = array_values(array_sort($studentsArray, function ($value) {
                return $value['exerciseScore'];
            }));

            //Promedio Total del Ejercicio
            $exerciseScoreAvg = 0;
            foreach($studentsArray as $student) {
                $exerciseScoreAvg += $student['exerciseScore'];
            }

            $exerciseScoreAvg = round($exerciseScoreAvg / count($studentsArray));

            //Promedio por Actividad
            $activitiesScoreAvg = [];
            foreach($activities as $index => $activity) {
                $activityAvg = 0;
                foreach($studentsArray as $student) {
                    $activityAvg += $student['scores'][$index];
                }
                $activityAvg = round($activityAvg / count($studentsArray));
                array_push($activitiesScoreAvg, $activityAvg);
            }
            
            $statistics = ['exerciseScoreAvg' => $exerciseScoreAvg, 'activitiesScoreAvg' => $activitiesScoreAvg];
            $data = ['questionData'=> $questionData,'exercise' => $exerciseName,'activities' => $activitiesNames, 'students' => $studentsArray, 'sortedStudents' => $sortedStudents, 'statistics' => $statistics];
            }

        if($query == false){
            $students = [];
            $teamworkInscriptions = TeamworkInscription::where('problems_id', $problem->id)->pluck('teamwork_id');
            $teamworkidIns = [];
            foreach($teamworkInscriptions as $twid){
                if($twid != null){
                    array_push($teamworkidIns, $twid);
                }
            }
            $teamworkid = array_unique($teamworkidIns);
            asort($teamworkid);
            $userIdCourse = [];
            $teamworkArray = [];
            foreach($teamworkid as $idTeam){
                $tname = Teamwork::where('id', $idTeam)->get()->first();
                $arrayScoreExercise = [];
                $teamworks = [];
                $teamworks['id'] = $idTeam;
                $teamworks['nameTeam'] = $tname->name;
                $teamworks['teamScore'] = 0;
                $teamworks['students'] = [];
                $userTeamwork = TeamworkInscription::where('teamwork_id', '=', $idTeam)->pluck('student_id');
                foreach($userTeamwork as $user){
                    $studentsArrays = [];
                    $userTest = Student::where('user_id', $user)->get()->first();
                    array_push($userIdCourse, $userTest->id);
                    array_push($students,$userTest);
                    $scores = Score::whereIn('activity_id', $activitiesIDsTeam)->whereIn('student_id', $userIdCourse)->get();
                    foreach($students as $st) {
                        $studentScores = [];
                        $student = [];
                        $student['fullName'] = $st->user->full_name;
                        $student['scores'] = [];
                        $student['exerciseScore'] = 0;
                        if(count($activitiesTeam) !== 0) {
                            foreach($activitiesIDsTeam as $act) {
                                $score = $scores->where('student_id', $st->id)->where('activity_id', $act)->first();
                                $scoreValue = 0;
                                if($score != null)
                                    $scoreValue = $score->score;
                                
                                array_push($student['scores'], $scoreValue);
                                $student['exerciseScore'] += $scoreValue;
                                array_push($studentScores, $scoreValue);
                                
                            }
                            $student['exerciseScore'] = round($student['exerciseScore'] / count($activitiesTeam));
                            
                        }
                        array_push($studentsArrays, $student);          
                    }      
                    array_push($teamworks['students'], $student);      
                }
                foreach($teamworks['students'] as $su){
                    array_push($arrayScoreExercise,$su['exerciseScore']); 
                }
                $scoresTeam = array_unique($arrayScoreExercise);
                $teamworks['teamScore'] = round(array_sum($scoresTeam) / count($scoresTeam));
                array_push($teamworkArray, $teamworks);
            }
            
            $studentsArray = [];
            foreach($students as $st) {
                $student = [];
                $student['fullName'] = $st->user->full_name;
                $student['score'] = [];
                $student['scoreTeam'] = [];
                $student['exerciseScore'] = 0;
                $student['exerciseScoreTeam'] = 0;
                $student['exerciseScorenoTeam']= 0;
                $student['scoreNoTeam'] = [];
                $student['scoreTotal'] = 0;
                if(count($activitiesnoTeam) !== 0) {
                    $scores = Score::whereIn('activity_id', $activitiesIDsnoTeam)->whereIn('student_id', $userIdCourse)->get();
                    foreach($activitiesIDsnoTeam as $act) {
                        $score = $scores->where('student_id', $st->id)->where('activity_id', $act)->first();
                        $scoreValue = 0;
                        if($score != null){
                            $scoreValue = $score->score;
                        }
                        array_push($student['scoreNoTeam'], $scoreValue);
                        array_push($student['score'], $scoreValue);
                        // saque el +
                        $student['exerciseScorenoTeam'] += $scoreValue;
                        $student['exerciseScore'] += $scoreValue;
                        $student['exerciseScorenoTeam'] = round($student['exerciseScore'] / count($activitiesnoTeam));
                    }
                }if(count($activitiesTeam) != 0){
                    $scores = Score::whereIn('activity_id', $activitiesIDsTeam)->whereIn('student_id', $userIdCourse)->get();
                    $scoreTeam = 0;
                    foreach($activitiesIDsTeam as $act) {
                        $score = $scores->where('student_id', $st->id)->where('activity_id', $act)->first();
                        $scoreValue = 0;
                        if($score != null){
                            $scoreValue = $score->score;
                        }
                        array_push($student['scoreTeam'], $scoreValue);
                        array_push($student['score'], $scoreValue);
                        $student['exerciseScore'] += $scoreValue;
                        $scoreTeam+= $scoreValue;
                        $student['exerciseScoreTeam'] = round($scoreTeam / count($activitiesTeam));
                    }

                }
                $student['scoreTotal'] = round(($student['exerciseScoreTeam'] + $student['exerciseScorenoTeam']) / 2);
                array_push($studentsArray, $student);
            }
            
            $sortedStudents = array_values(array_sort($studentsArray, function ($value) {
                return $value['scoreTotal'];
            }));
            //Promedio Total del Ejercicio
            $exerciseScoreAvg = 0;
            foreach($studentsArray as $student) {
                $exerciseScoreAvg += ($student['exerciseScoreTeam'] + $student['exerciseScorenoTeam']) / 2;
            }

            $exerciseScoreAvg = round($exerciseScoreAvg / count($studentsArray));

            //Promedio por Actividad
            $activitiesScoreAvg = [];
            foreach($activities as $index => $activity) {
                $activityAvg = 0;
                foreach($studentsArray as $student) {
                        $activityAvg += $student['score'][$index];
                }
                $activityAvg = round($activityAvg / count($studentsArray));
                array_push($activitiesScoreAvg, $activityAvg);
            }
        
            $statistics = ['exerciseScoreAvg' => $exerciseScoreAvg, 'activitiesScoreAvg' => $activitiesScoreAvg];
            $data = ['questionData'=> $questionData,'sortedStudents' => $sortedStudents, 'statistics' => $statistics, 'arrayScore' => json_encode($arrayScoreExercise),'teamworkid'=> json_encode($teamworkid),'teamworks' =>json_encode($teamworkArray),'exercise' => $exerciseName,'activities' => $activitiesNames, 'activitiesTeam' => $activitiesNamesTeam, 'activitiesnoTeam' => $activitiesNamesnoTeam, 'students' => $studentsArray, 'teamworkss'=> $teamworkArray];
            //dd($data);
        }
        
        return $data;
    }

    
}