<?php

namespace CSLP;

use Illuminate\Database\Eloquent\Model;

class TeamworkInscription extends Model{
    protected $table = 'teamwork_inscription';
    public function setProblem(){
        return $this->belongsTo(Problem::Class, 'problem_id');
    }
    public function teamwork(){
        return $this->hasMany(Teamwork::Class, 'id');
    }
    public function students(){
        return $this->belongsTo(User::Class, 'id');
    }
}
