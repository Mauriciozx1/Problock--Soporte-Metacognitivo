<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

use CSLP\Modules\Models\CourseInscription;
use \CSLP\Modules\Models\User;
use \CSLP\Modules\Models\Course;

Route::get('/', function () {

    if(Auth::check()) {
        switch(Auth::user()->type) {
            case 'student':
                return redirect('/problems');
                break;
            case 'teacher':
                return redirect('/problems');
                break;
            case 'researcher':
                return redirect('investigador');
                break;
            case 'admin':
                return redirect('admin');
                break;
        }

    } else {
        return redirect('login');
    }
});

/**
 * PERFILES
 */

Route::get('alumno', function () {
    return redirect('/problems');
})->middleware(['student']);

Route::get('profesor', function () {
    return redirect('/problems');
})->middleware(['teacher']);

Route::get('investigador', function () {
    return view('profile/researcher');
})->middleware(['researcher']);

Route::get('problems', function () {

    $data = [];

    $inscriptions = CourseInscription::all();
    //Obtiene el id de todos los cursos a los cuales está inscrito el usuario
    $userInscriptions = $inscriptions -> where('user_id', Auth::user()->id)->lists('course_id');
    $courses = Course::whereIn('id', $userInscriptions)->get()->load('problems');
    $type = \Auth::user()->type;

    //Si el usuario es profesor, necesitamos el listado de alumnos disponibles pasa asociar a los cursos
    if($type == "teacher"){
        $students = User::where('type', 'student')->get();

        foreach($students as $student) {
            //Obtiene el id de todos los cursos a los cuales está inscrito el estudiante
            $student->courses = $inscriptions -> where('user_id', $student->id)->lists('course_id');
        }

        $data['students'] = $students;
    }


    //Si el usuario es estudiante necesitamos el puntaje promedio de todos los problemas
    if($type == "student") {
        $studentId = \Auth::user()->student->id;

        foreach($courses as $course) {
            foreach($course->problems as $problem) {
                $problem->avgScore = $problem->getAvgScore($studentId);
            }
        }
    }

    $data['courses'] = $courses;
    $data['type'] = $type;
    $data['currentTimestamp'] = Carbon\Carbon::now();


    return view('/maker/problems', $data);

});

Route::controller('auth', 'AuthController');
Route::controller('workboard', 'WorkBoardController');
Route::controller('maker', 'MakerController');
Route::controller('teacher', 'TeacherController');
Route::controller('schools', 'SchoolsController');
Route::controller('courses', 'CoursesController');
Route::controller('admin', 'AdminController');
Route::controller('student', 'StudentController');

// Auth Routes
Route::get('login', 'AuthController@getLogin')->middleware(['guest']);
Route::post('login', 'AuthController@postLogin')->middleware(['guest']);
Route::get('signup', 'AuthController@getSignup')->middleware(['guest']);
Route::post('signup', 'AuthController@postSignup')->middleware(['guest']);

Route::controller('test', 'TestsController');