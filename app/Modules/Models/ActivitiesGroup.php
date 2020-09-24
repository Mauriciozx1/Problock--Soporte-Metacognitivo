<?php


namespace CSLP\Modules\Models;

use Illuminate\Database\Eloquent\Model;

class ActivitiesGroup extends Model{
    protected $table = 'activities_groups';


    public function problem()
    {
        return $this->belongsTo(Problem::class,'problem_id');
    }
}