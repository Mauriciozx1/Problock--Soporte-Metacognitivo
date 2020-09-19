<?php

namespace CSLP\Http\Controllers;

use Auth;
use Carbon\Carbon;
use CSLP\Modules\Models\BlocklyActivityAnswer;
use CSLP\Modules\Models\Problem;
use CSLP\Modules\Models\Score;
use Input;

class WorkBoardController extends Controller {

    public function __construct() {
        $this->middleware('auth', array('only' => array('getView')));
        $this->middleware('student', array('only' => array('getView')));

    }

    public function getIndex() {
        return redirect('/problems');
    }

    public function getView($problemId = null) {

        if($problemId === null)
            return redirect('/problems');

        $problem = Problem::find($problemId);

        if($problem == null)
            return redirect('/exercises');

        $actualTimestamp = Carbon::now();
        if($problem->open_at > $actualTimestamp) {
            return 'El ejercicio se puede realziar desde: ' . $problem->open_at;
        }

        if($problem->close_at < $actualTimestamp) {
            return 'El ejercicio se cerró el ' . $problem->close_at;
        }

        $problemStructure = MakerController::getProblem($problemId);

        //Obteniendo los scores obtenidos en las actividades
        $scores = Score::where('student_id', Auth::user()->student->id)->get();
        $scoresArray = [];
        foreach($scores as $score) {
            $scoresArray[strval($score->activity_id)] = $score->score;
        }

        return view('/workboard/view', ['problem' => json_encode($problemStructure), 'scores' => json_encode($scoresArray)]);
    }

    //Retorna los recursos y la respuesta a una actividad específica
    public function getActivityinfo($activityID) {

        //Obtener recursos

        //Obtener respuesta actual

        $answer = BlocklyActivityAnswer::where('student_id', '=', Auth::user()->student->id)->where('activity_id', '=', $activityID)->first();

        sleep(1);

        if($answer != null) {
            return ['resource' => '', 'answer' => $answer->value];
        }

        return ['resource' => '', 'answer' => ''];
    }

    //Guarda una respuesta en la base de datos
    public function postAnswer() {

        $studentID = Auth::user()->student->id;

        //GUARDANDO LA RESPUESTA
        $answer = BlocklyActivityAnswer::where('student_id', '=', $studentID)->where('activity_id', '=', Input::get('activity_id'))->first();

        //Si ya existe una respuesta previa
        if($answer !== null) {
            $answer->value = Input::get('answer');
        } else {
            //Si no existe respuesta previa hay que crear una nueva
            $answer = new BlocklyActivityAnswer;
            $answer->activity_id = Input::get('activity_id');
            $answer->student_id = $studentID;
            $answer->value = Input::get('answer');
        }
        $answer->save();

        //GUARDANDO EL PUNTAJE OBTENIDO
        $obtainedScore = Input::get('score');

        $score = Score::where('answere_id', '=', $answer->id)->where('activity_id', '=', Input::get('activity_id'))->first();
        //Si ya existe un score previo
        if($score !== null) {
            $score->score = $obtainedScore;
        } else {
            //Si no existe respuesta previa hay que crear una nueva
            $score = new Score;
            $score->activity_id = Input::get('activity_id');
            $score->answere_id = $answer->id;
            $score->student_id = $studentID;
            $score->score = $obtainedScore;
        }
        $score->save();

        return 1;

    }

    public function getStudent() {
        return Auth::user()->student;
    }

}