<?php

namespace CSLP;

use Illuminate\Database\Eloquent\Model;

class Vote extends Model
{
    
    protected $fillable = ['user_id','vote','teamwork_id', 'activiti_id'];

    public function user()
    {
    	return $this->belongsTo(User::class);
    } 
}
