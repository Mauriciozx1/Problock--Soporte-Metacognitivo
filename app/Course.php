<?php


namespace CSLP;

use Illuminate\Database\Eloquent\Model;

class Course extends Model{
    protected $table = 'courses';

    public function problems(){
        return $this->hasMany(Problem::Class, 'course_id');
    }
    public function users(){
        return $this->belongsToMany(User::Class);
    }
}