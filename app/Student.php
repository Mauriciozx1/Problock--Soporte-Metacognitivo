<?php

namespace CSLP;

use Illuminate\Database\Eloquent\Model;

class Student extends Model{
    protected $table = 'students';
    public $timestamps = false;

    public function user(){
        return $this->belongsTo(User::class);
    }
    public function answers(){
        return $this->hasMany(BlocklyActivityAnswer::class, 'student_id');
    }
    public function teamwork(){
        return $this->hasMany(TeamworkInscription::class, 'student_id');
    }
}