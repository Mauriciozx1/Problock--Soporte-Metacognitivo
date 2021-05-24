<?php

namespace CSLP\Http\Controllers;

use Illuminate\Http\Request;

class ActivityController extends Controller
{
    //
    public function index() {

    }
    public function create() {
        //$linkTeamwork = LinkTeamworkInscription::where()
        $activity = new Activity;
        $activity->name = 'Nueva actividad';
        $activity->type = Input::get('type');
        $activity->save();

        //Crea la relacion entre el grupo y la actividad
        $gal = new GroupActivityLink;
        $gal->group_id = Input::get('id');
        $gal->activity_id = $activity->id;
        $gal->save();

        return ['id' => $activity->id];
    }
}
