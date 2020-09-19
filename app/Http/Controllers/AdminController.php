<?php

namespace CSLP\Http\Controllers;

use CSLP\Modules\Models\Course;
use CSLP\Modules\Models\CourseInscription;
use CSLP\Modules\Models\User;
use Input;

class AdminController extends Controller {

    public function __construct() {
        $this->middleware('auth');
        $this->middleware('admin', array('only' => array('getIndex')));
    }

    public function getIndex() {

        $teachers = User::where('type', '=', 'teacher')->get();
        $courses = Course::all();
        //Obtenemos a inscripcion de cursos de cada profesor
        $links = CourseInscription::all();

        foreach($teachers as $teacher) {
            $teacher->courses = $links -> where('user_id', $teacher->id)->lists('course_id');
        }

        return view('admin/admin-panel', ['teachers' => $teachers, 'courses' => $courses]);
    }

    //Crea o modifica un profesor
    public function postSaveteacher() {
        $data = Input::all();

        if(Input::has('id') != null)
            $user = User::find($data['id']); else
            $user = null;

        if($user == null) {
            $user = new User;
        }

        $user->name = $data['name'];
        $user->flastname = $data['flastname'];
        $user->mlastname = $data['mlastname'];
        $user->email = $data['email'];
        $user->password = bcrypt($data['password']);
        $user->type = 'teacher';

        $user->save();

        return $user->id;
    }

    //Elimina un profesor
    public function postDeleteteacher() {
        $teacherId = Input::get('id');
        User::destroy($teacherId);

        return 1;
    }


}