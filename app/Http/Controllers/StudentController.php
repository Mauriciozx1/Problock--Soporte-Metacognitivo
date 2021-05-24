<?php


namespace CSLP\Http\Controllers;

use CSLP\Activity;
use CSLP\GroupActivityLink;
use CSLP\Problem;
use CSLP\Score;
use CSLP\TeamworkInscription;
use CSLP\Teamwork;
use CSLP\Student;
class StudentController extends Controller {
    public function getScores($problemId) {
        $studentId = \Auth::user()->student->id;
        $userId =\Auth::user()->id;
        $problem = Problem::find($problemId);
        $exerciseName = $problem->name;
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

        $activitiesNames = [];
        foreach($activities as $activity) {
            array_push($activitiesNames, $activity->name);
        }

        $scores = Score::whereIn('activity_id', $activitiesIds)->where('student_id', $studentId)->get();

        $activitiesData = [];
        $avgScore=0;
        
        if(count($activities) !== 0) {
            $scoreTeam = 0;
            foreach($activities as $act) { 
                $activityData = ['name' => $act->name, 'score' => 0];
                $score = $scores->where('student_id', $studentId)->where('activity_id', $act->id)->first();
                if($score != null){
                    $activityData['score'] = $score->score;   
                }
                
                
                $avgScore += $activityData['score'];
                array_push($activitiesData, $activityData);
            }
            $avgScore = round($avgScore / count($activities));
        }

        return view('qualifications/student-view', ['name' => $exerciseName,'activities' => $activitiesData,'activities2' => json_encode($activitiesData), 'avgScore' => $avgScore, ]);
    }

}