<?php

namespace CSLP\Modules\Models;

use Illuminate\Database\Eloquent\Model;

class Teamwork extends Model{
    protected $table = 'teamwork'; 
    
    public function teamWorkInscription(){
        return $this->hasMany(TeamworkInscription::Class);
    }
}
