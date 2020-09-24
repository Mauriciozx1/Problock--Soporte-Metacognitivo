<?php

namespace CSLP\Modules\Models;

use Illuminate\Database\Eloquent\Model;

class TeamworkInscription extends Model{
    protected $table = 'teamwork_inscription';
    public function setProblem(){
        return $this->belongsTo(Problem::Class, 'problem_id');
    }
    public function setTeamwork(){
        return $this->belongsTo(Teamwork::Class, 'teamwork_id');
    }
}
