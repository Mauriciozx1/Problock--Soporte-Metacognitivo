<?php


namespace CSLP\Http\Controllers;

use CSLP\Modules\Models\Activity;
use CSLP\Modules\Models\GroupActivityLink;
use CSLP\Modules\Models\Problem;
use CSLP\Modules\Models\Score;

class StudentController extends Controller {

    public function getScores($problemId) {
        $studentId = \Auth::user()->student->id;

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

        $activities = Activity::whereIn('id', $activitiesIds)->select('id', 'name')->get();

        $activitiesNames = [];
        foreach($activities as $activity) {
            array_push($activitiesNames, $activity->name);
        }

        $scores = Score::whereIn('activity_id', $activitiesIds)->where('student_id', $studentId)->get();

        $activitiesData = [];
        $avgScore=0;

        if(count($activities) !== 0) {
            foreach($activities as $act) {
                $score = $scores->where('student_id', $studentId)->where('activity_id', $act->id)->first();
                $activityData = ['name' => $act->name, 'score' => 0];
                if($score != null)
                    $activityData['score'] = $score->score;

                $avgScore += $activityData['score'];
                array_push($activitiesData, $activityData);
            }
            $avgScore = round($avgScore / count($activities));
        }

        return view('qualifications/student-view', ['name' => $exerciseName,'activities' => $activitiesData, 'avgScore' => $avgScore]);
    }

}