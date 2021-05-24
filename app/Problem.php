<?php


namespace CSLP;

use Illuminate\Database\Eloquent\Model;

class Problem extends Model{
    protected $table = 'problems';

    public function activitiesGroups(){
        return $this->hasMany(ActivitiesGroup::class, 'problem_id');
    }
    public function teamworkInscription(){
        return $this->hasMany(TeamworkInscription::class,'problems_id');
    }

    public function getAvgScore($studentId){
        $activitiesGroups = $this->activitiesGroups;
        $userId =\Auth::user()->id;
        $activitiesGroupsIds = [];
        foreach($activitiesGroups as $ag){
            array_push($activitiesGroupsIds, $ag->id);
        }

        $gals = GroupActivityLink::whereIn('group_id', $activitiesGroupsIds)->get();
        $activitiesIds = [];
        $activities = [];
        foreach($gals as $gal){
            $a = Activity::where('id','=', $gal->activity_id)->first();
            array_push($activities,$a->id);
        }
        $avgScore = 0;
        $scoreValue = 0;
        if(count($activities) != 0){
            foreach($activities as $act){  
                $score = Score::where('student_id','=',$studentId)->where('activity_id','=', $act)->first();
                if($score != null){
                    $scoreValue = $score->score;
                    $avgScore = $scoreValue + $avgScore;     
                }      
                
            }
            $avgScore = round($avgScore / count($activities));
            
        }
        
        return $avgScore;
    }
   
}