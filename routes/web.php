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

use CSLP\CourseInscription;
use \CSLP\User;
use \CSLP\Course;
use \CSLP\Problem;
use \CSLP\Student;




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

Route::get('/problems', function () {
    if(Auth::check()) {
        switch(Auth::user()->type) {
            case 'student':
                break;
            case 'teacher':
                break;
            case 'researcher':
                break;
            case 'admin':
                break;
        }

    } else {
        return redirect('login');
    }
    $data = [];
    $count = 0;
    $studentsR = Student::all();
    $inscriptions = CourseInscription::all();
    $inscriptionsProblem = Problem::all();
    //Obtiene el id de todos los cursos a los cuales está inscrito el usuario
    $userInscriptions = $inscriptions->where('user_id', Auth::user()->id)->pluck('course_id');
    
    $courses = Course::whereIn('id', $userInscriptions)->get()->load('problems');
    $type = \Auth::user()->type;
    
    
    $array = [];
    //Si el usuario es profesor, necesitamos el listado de alumnos disponibles pasa asociar a los cursos
    if($type == "teacher"){
        $students = User::where('type', 'student')->get();
        foreach($students as $student) {
            //Obtiene el id de todos los cursos a los cuales está inscrito el estudiante
            $student->courses = $inscriptions -> where('user_id', $student->id)->pluck('course_id');
           
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

//Vote
Route::post('/svote', 'VoteController@sendVote');
// Chat
Route::get('fmessages/{id}', 'ChatsController@fetchMessages');
Route::post('smessages', 'ChatsController@sendMessage');

// Admin
Route::post('admin/deleteteacher','AdminController@postDeleteteacher');
Route::post('admin/saveteacher','AdminController@postSaveteacher');

// Courses
Route::post('courses/savecourse', 'CoursesController@postSavecourse');
Route::post('courses/deletecourse', 'CoursesController@postDeletecourse');
Route::post('courses/link', 'CoursesController@postLink');
Route::post('courses/unlink', 'CoursesController@postUnlink');

// Maker - Problems
Route::post('maker/saveproblem', 'MakerController@postSaveproblem');
Route::post('maker/deleteproblem', 'MakerController@postDeleteproblem');

//  Maker - Activities
Route::get('maker/activities/{id}', 'MakerController@getActivities');
Route::post('maker/deleteactivity', 'MakerController@postDeleteactivity');
Route::post('maker/saveactivity', 'MakerController@postSaveactivity');
Route::post('maker/newactivity', 'MakerController@postNewactivity');
Route::post('maker/savegroupname', 'MakerController@postSavegroupname');


// Workboard
Route::get('workboard/view/{id}','WorkBoardController@getView');
Route::get('workboard/activityinfo/{id}', 'WorkBoardController@getActivityinfo');
Route::post('workboard/lider', 'WorkBoardController@postLider');
Route::get('workboard/wait/{id}', 'WorkboardController@getWait');
Route::post('workboard/answer','WorkBoardController@postAnswer');
Route::post('workboard/state','WorkBoardController@postState');

// Teacher
Route::get('teacher/view/{id}', 'TeacherController@getStates');
Route::get('teacher/scores/{id}', 'TeacherController@getScores');
Route::get('teacher/steamwork/{id}', 'TeacherController@getSTeamwork');
Route::get('teacher/teamwork/{id}', 'TeacherController@getTeamwork');
Route::post('teacher/teamwork', 'TeacherController@postTeamwork');

// Teamwork


// Student
Route::get('student/scores/{id}', 'StudentController@getScores');

// Testing Vue
Route::get('test','TestsController@getTesting');

// Auth Routes
Route::get('logout', 'AuthController@getLogout');
Route::get('login', 'AuthController@getLogin')->middleware(['guest']);
Route::post('login', 'AuthController@postLogin')->middleware(['guest']);
Route::get('signup', 'AuthController@getSignup')->middleware(['guest']);
Route::post('signup', 'AuthController@postSignup')->middleware(['guest']);