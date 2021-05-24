<?php
namespace CSLP\Http\Controllers;
use CSLP\TeamworkInscription;
use CSLP\User;
use CSLP\Teamwork;

use Auth;
class TeamworkController extends Controller {

    public function getIndex() {
        return redirect('/teamwork');
    }
    public function postLider(){
        $groupActivityLink = GroupActivityLink::where('activity_id', '=', Input::get('activity_id'))->first();
        if($team->user_lider != null){
            $incriptions = TeamworkInscriptions::where('teamwork_id', '=', $idteamwork)->pluck('student_id');
            $userLider = array_rand($incriptions, 1);
        }
    }
    public function getExerciseTeamwork($exerciseId = 1) {
        $problem = Problem::find($exerciseId);
        $nameProblem = $problem->name;
        $nTeamwork = $problem->teamworks;
        $problemId = $problem->id;
        $students = Student::all()->load('user');

        $studentsIds = [];
        foreach($students as $st) {
            array_push($studentsIds, $st->id);
        }

        $studentsArray = [];
        foreach($students as $st) {
            $student = [];
            $student['fullName'] = $st->user->full_name;
            array_push($studentsArray, $student);
        }

        
        $data = ['name' => $nameProblem, 'nTeamwork' => $nTeamwork, 'Students' => $studentsArray];
        return $data;

    }
    public function getTeamwork($excerciseId = null){
        return view('teamwork/teacher-view',$this->getExerciseTeamwork($excerciseId));
    }
}