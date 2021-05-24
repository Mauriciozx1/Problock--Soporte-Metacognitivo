<?php

namespace CSLP;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    
    protected $fillable = ['user_id','message','teamwork_id', 'reply_user_id', 'reply_message', 'reply_id'];

    public function user()
    {
    	return $this->belongsTo(User::class);
    } 
 
}
