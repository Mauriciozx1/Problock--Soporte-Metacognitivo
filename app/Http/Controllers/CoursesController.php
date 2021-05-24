<?php

namespace CSLP\Http\Controllers;

use CSLP\Course;
use CSLP\CourseInscription;
use CSLP\TeamworkInscription;
use CSLP\Teamwork;
use CSLP\Problem;
use CSLP\LinkTeamworkInscription;
use \Input;

class CoursesController extends Controller{

    public function getIndex(){
        return 'Index Courses';
    }


    //Crea o modifica un curso
    public function postSavecourse() {
        $data = Input::all();

        if(Input::has('id') != null)
            $course = Course::find($data['id']); else
            $course = null;

        if($course == null) {
            $course = new Course;
        }

        $course->code = $data['code'];
        $course->name = $data['name'];
        $course->n_student = 0;
        $course->save();

        return $course->id;
    }

    //Elimina un curso
    public function postDeletecourse() {
        $courseId = Input::get('id');
        Course::destroy($courseId);
        return 1;
    }

    // Enlaza un usuario con un curso determinado
    public function postLink() {
        $data = Input::all();
        $link = CourseInscription::where('user_id', $data['user_id'])->where('course_id', $data['course_id'])->first();
        if($link == null) {
            $course = Course::find($data['course_id']);
            $link = new CourseInscription;
            $link->user_id = $data['user_id'];
            $link->course_id = $data['course_id'];
            $link->save();
            $course->n_student = $course->n_student + 1;
            $course->save();
            $problemId = Problem::where('course_id', '=',$data['course_id'])->pluck('id');
            foreach($problemId as $pId){
                $problem = Problem::find($pId);
                //Problema es grupal y tiene el permiso activado
                if($problem->type_problem == 'Grupal' && $problem->p_autoadd == 'true'){
                    $listIdTeam = [];
                    
                    $inscriptionsTeam = TeamworkInscription::where('problems_id','=',$pId)->pluck('teamwork_id');
                    foreach( $inscriptionsTeam as $i){
                        array_push($listIdTeam, $i);
                    }
                    $insTeam = array_unique($listIdTeam);
                    $countTeam = count($insTeam);
                    $comprobarUser = 0;
                    $userCount = null;
                    foreach($insTeam as $iTeam){
                        $userCount = TeamworkInscription::where('teamwork_id','=',$iTeam)->pluck('student_id');
                        $userList = [];
                        foreach($userCount as $u){
                            array_push($userList, $u);
                        }
                        $comprobarUser = count($userList);
                        if(count($userList) < 3){
                            $newInscription = new TeamworkInscription;
                            $newInscription->problems_id = $pId;
                            $newInscription->teamwork_id = $iTeam;
                            $newInscription->student_id = $data['user_id'];
                            $newInscription->save();
                            return 1;
                        }
                        $countTeam = $countTeam - 1;
                    }
                    if($comprobarUser == 3 && $countTeam == 0 || $userCount == null || $inscriptionsTeam == null){
                        $newTeam = new Teamwork;
                        $newTeam->name = 'Nuevo equipo: '.(count($insTeam)+1);
                        $newTeam->save();
                        $newInscription = new TeamworkInscription;
                        $newInscription->problems_id = $pId;
                        $newInscription->teamwork_id = $newTeam->id;
                        $newInscription->student_id = $data['user_id'];
                        $newInscription->save();
                        if($userCount != null || $inscriptionsTeam != null){
                            $activities = LinkTeamworkInscription::where('teamwork_id', '=', $insTeam[0])->pluck('activities_group_id');
                            foreach($activities as $nCag){
                                $linkTeamwork = new LinkTeamworkInscription;
                                $linkTeamwork->teamwork_id = $newTeam->id;
                                $linkTeamwork->activities_group_id = $nCag;
                                $linkTeamwork->save();
                            }
                        }  
                    }
                }
            }       
        }
        return 1; 
    }

    // Desenlaza un usuario de un determinado curso
    public function postUnlink() {
        $data = Input::all();
        $link = CourseInscription::where('user_id', $data['user_id'])->where('course_id', $data['course_id'])->first();
        if($link != null) {
            $courseClass = Course::find($data['course_id']);
            $countStudent = $courseClass->n_student;
            $courseClass->n_student = $countStudent - 1;
            $courseClass->save();
            CourseInscription::destroy($link->id);
            $problemId = Problem::where('course_id', '=',$data['course_id'])->pluck('id');
            foreach($problemId as $pId){
                $problem = Problem::find($pId);
                if($problem->type_problem == 'Grupal'){
                    $linkTeam = TeamworkInscription::where('student_id', $data['user_id'])->where('problems_id', $pId)->first();
                    if($linkTeam != null){
                        TeamworkInscription::destroy($linkTeam->id);
                    }
                }
            }
        }
        return 1;
    }

}