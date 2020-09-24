<?php


namespace CSLP\Modules\Models;

use Illuminate\Database\Eloquent\Model;

class Problem extends Model{
    protected $table = 'problems';

    public function activitiesGroups(){
        return $this->hasMany(ActivitiesGroup::class, 'problem_id');
    }

    public function getAvgScore($studentId){
        $activitiesGroups = $this->activitiesGroups;
        $activitiesGroupsIds = [];

        foreach($activitiesGroups as $ag){
            array_push($activitiesGroupsIds, $ag->id);
        }

        $gals = GroupActivityLink::whereIn('group_id', $activitiesGroupsIds)->get();
        $activitiesIds = [];

        foreach($gals as $gal){
            array_push($activitiesIds, $gal->activity_id);
        }

        $activities = Activity::whereIn('id', $activitiesIds)->select('id','name')->get();
        $scores = Score::whereIn('activity_id', $activitiesIds)->where('student_id', $studentId)->get();

        $avgScore = 0;
        if(count($activities) != 0){
            foreach($activities as $act){
                $score = $scores->where('student_id',$studentId)->where('activity_id', $act->id)->first();
                $scoreValue = 0;

                if($score != null)
                    $scoreValue = $score->score;

                $avgScore += $scoreValue;
            }

            $avgScore = round($avgScore / count($activities));
        }

        return $avgScore;
    }
}