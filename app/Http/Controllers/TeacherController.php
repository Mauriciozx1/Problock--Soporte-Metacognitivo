<?php

namespace CSLP\Http\Controllers;

use CSLP\Activity;
use CSLP\GroupActivityLink;
use CSLP\Problem;
use CSLP\Score;
use CSLP\Student;
use CSLP\TeamworkInscription;
use CSLP\Teamwork;
use CSLP\Course;
use CSLP\CourseInscription;
use CSLP\User;
use CSLP\LinkTeamworkInscription;
use CSLP\Questions;
use CSLP\StatusProblem;
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
    
    public function getStates($problemid){
        $status = StatusProblem::where('problem_id', '=', $problemid)->get();
        $problem = Problem::find($problemid);
        $usersCourse = [];
        $studentsR = Student::all();
        $inscriptions = CourseInscription::where('course_id', '=', $problem->course_id)->pluck('user_id');
        foreach($inscriptions as $idUser){
            $user = User::find($idUser);
            if($user->type == 'student'){
                array_push($usersCourse, $user);
            }
                
        }
    
        $infoTeamwork = $this->getExerciseTeamwork($problemid);
        $info = json_decode($infoTeamwork['teamworks']);
        
        $problemData = json_encode(MakerController::getProblem($problemid));
        
        return view('/maker/view-state', ['idProblem' => $problemid,'status' => $status,'problem' => $problemData, 'infoTeamwork' => $info, 'usersCourse' => $usersCourse]);
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

    public function getExerciseTeamwork($exerciseId = 1) { 
        $problem = Problem::find($exerciseId);
        $nameProblem = $problem->name;
        $nTeamwork = $problem->teamworks;
        $problemId = $problem->id;
        $type = 'teacher';
        $teamworkInscriptions = TeamworkInscription::where('problems_id', '=', $problemId)->pluck('teamwork_id');
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
            $teamworks['students'] = [];
            $userTeamwork = TeamworkInscription::where('teamwork_id', '=', $idTeam)->pluck('student_id');
            foreach($userTeamwork as $user) {
                $userTest = User::where('id', '=', $user )->get()->first();
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
                    $scores = Score::whereIn('activity_id', $activitiesTeam)->whereIn('student_id', $userIdCourse)->get();
                    foreach($students as $st) {
                        $studentScores = [];
                        $student = [];
                        $student['fullName'] = $st->user->full_name;
                        $student['scores'] = [];
                        $student['exerciseScore'] = 0;
                        if(count($activitiesTeam) !== 0) {
                            foreach($activitiesTeam as $act) {
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
                $student['exerciseScorenoTeam']= 0;
                $student['exerciseScore'] = 0;
                $student['scoreNoTeam'] = [];
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
                }if(count($activitiesTeam) !== 0){
                    $scores = Score::whereIn('activity_id', $activitiesIDsTeam)->whereIn('student_id', $userIdCourse)->get();
                    foreach($activitiesIDsTeam as $act) {
                        $score = $scores->where('student_id', $st->id)->where('activity_id', $act)->first();
                        $scoreValue = 0;
                        if($score != null){
                            $scoreValue = $score->score;
                        }
                        array_push($student['scoreTeam'], $scoreValue);
                        array_push($student['score'], $scoreValue);
                        $student['exerciseScore'] += $scoreValue;
                    }
                }
                
                array_push($studentsArray, $student);
            }
            
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
                        $activityAvg += $student['score'][$index];
                    
                    
                    
                }
                $activityAvg = round($activityAvg / count($studentsArray));
                array_push($activitiesScoreAvg, $activityAvg);
            }
            $statistics = ['exerciseScoreAvg' => $exerciseScoreAvg, 'activitiesScoreAvg' => $activitiesScoreAvg];
            $data = ['questionData'=> $questionData,'sortedStudents' => $sortedStudents, 'statistics' => $statistics, 'arrayScore' => json_encode($arrayScoreExercise),'teamworkid'=> json_encode($teamworkid),'teamworks' =>json_encode($teamworkArray),'exercise' => $exerciseName,'activities' => $activitiesNames, 'activitiesTeam' => $activitiesNamesTeam, 'activitiesnoTeam' => $activitiesNamesnoTeam, 'students' => $studentsArray, 'teamworkss'=> $teamworkArray];
        }
        
        return $data;
    }

   
}