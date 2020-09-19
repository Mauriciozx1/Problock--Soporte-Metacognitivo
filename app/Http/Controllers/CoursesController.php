<?php

namespace CSLP\Http\Controllers;

use CSLP\Modules\Models\Course;
use CSLP\Modules\Models\CourseInscription;
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
            $link = new CourseInscription;
            $link->user_id = $data['user_id'];
            $link->course_id = $data['course_id'];
            $link->save();
        }

        return 1;
    }

    // Desenlaza un usuario de un determinado curso
    public function postUnlink() {
        $data = Input::all();

        $link = CourseInscription::where('user_id', $data['user_id'])->where('course_id', $data['course_id'])->first();

        if($link != null) {
            CourseInscription::destroy($link->id);
        }
        return 1;
    }

}