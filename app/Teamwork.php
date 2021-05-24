<?php

namespace CSLP;

use Illuminate\Database\Eloquent\Model;

class Teamwork extends Model{
    protected $table = 'teamwork'; 
    
    public function teamworks(){
        return $this->hasMany(TeamworkInscription::Class, 'teamwork_id');
    }
}
