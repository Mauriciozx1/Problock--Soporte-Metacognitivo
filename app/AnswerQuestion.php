<?php

namespace CSLP;

use Illuminate\Database\Eloquent\Model;

class AnswerQuestion extends Model
{
    protected $table = 'questions_answer'; 
    
    public static function getAnswer($idQuestion){
        $answerQuestion = AnswerQuestion::where('question_id', '=',$idQuestion)->get();
        $dataAnswer = [];
        $dataAnswer['student'] = [];
        foreach($answerQuestion as $answer){ 
            $user = User::find($answer->user_id); 
            $student = [];
            $student['id'] = $user->id;
            $student['name'] = $user->name;
            $student['flastName'] = $user->flastname;
            $student['mlastname'] = $user->mlastname;
            $student['answer'] = [];
            
            if($answer->points > 0 ){
                $student['answer'] = $answer->points;
            }else{
                $student['answer'] = $answer->answer;
            }
            array_push($dataAnswer['student'], $student);     
        }
        return $dataAnswer;
    }
}
