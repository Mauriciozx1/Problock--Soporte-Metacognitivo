<?php

namespace CSLP\Http\Controllers;

use CSLP\Modules\Models\ActivitiesGroup;
use CSLP\Modules\Models\Activity;
use CSLP\Modules\Models\Course;
use CSLP\Modules\Models\GroupActivityLink;
use CSLP\Modules\Models\Problem;
use CSLP\Modules\Models\Resource;
use Input;

class MakerController extends Controller {

    public function getIndex($problemID = 1) {

        return view('maker/make', ['problem' => json_encode(self::getProblem($problemID))]);
    }

    public function getActivities($problemID = 1){
        return view('maker/make', ['problem' => json_encode(self::getProblem($problemID))]);

    }

    public static function getProblem($problemID = 1) {


        $problem = Problem::find($problemID);

//        $exerciseName = $problem->name;

        $activitiesGroups = $problem->activitiesGroups;
        $activitiesGroupsIds = $activitiesGroups->lists('id');

        $gals = GroupActivityLink::whereIn('group_id', $activitiesGroupsIds)->get();
        $activitiesIds = $gals->lists('activity_id');

        $activities = Activity::whereIn('id', $activitiesIds)->get();

        $resources = Resource::all();

        $problemArray = [];

        foreach($activitiesGroups as $group) {
            $tempGroup = [];
            $tempGroup['id'] = $group->id;
            $tempGroup['name'] = $group->name;
            $tempGroup['activities'] = [];

            $actLinks = $gals->where('group_id', $group->id);

            foreach($actLinks as $alnk) {
                $tempActivity = $activities->where('id', $alnk->activity_id)->first();
                $res = $resources->where('activity_id', $tempActivity->id)->first();
                $tempActivity->resource = ($res != null)? $res->value : "";
                $tempActivity->rules = json_decode($tempActivity->objectives);

                array_push($tempGroup['activities'], $tempActivity);
            }

            array_push($problemArray, $tempGroup);
        }

        return $problemArray;
    }

    public function postDeleteactivity() {
        $activity = Activity::find(Input::get('id'));
        $activity->delete();
    }

    public function postNewactivity() {

        $activity = new Activity;
        $activity->name = 'Nueva Actividad';
        $activity->save();

        //Crea la relacion entre el grupo y la actividad
        $gal = new GroupActivityLink;
        $gal->group_id = Input::get('id');
        $gal->activity_id = $activity->id;
        $gal->save();

        return ['id' => $activity->id];
    }

    public function postSaveactivity() {
        $data = Input::all();

        $activity = Activity::find($data['id']);

        //Guarda la nueva informacion de la actividad
        $activity->name = $data['name'];
        $activity->answer = $data['answer'];
        $activity->objectives = $data['rules'];
        $activity->save();

        //Comprueba que la actividad tiene un recurso asignado
        $resource = Resource::where('activity_id', '=', $activity->id)->first();
        if($resource == null) {
            $resource = new Resource;
            $resource->activity_id = $activity->id;
        }
        //Guarda el recurso de la actividad
        $resource->value = $data['resource'];
        $resource->save();

    }

    public function postSavegroupname() {
        $ag = ActivitiesGroup::find(Input::get('id'));
        $ag->name = Input::get('name');
        $ag->save();
    }

    //EXERCISE PART

    public function postSaveproblem() {
        $data = Input::all();

        $isNew = false;
        if($data['id'] != null) {
            $problem = Problem::find($data['id']);
        } else {
            $isNew = true;
            $problem = new Problem;
            $problem->course_id = $data['course_id'];
        }

        $problem->name = $data['name'];
        $problem->description = $data['description'];
        $problem->open_at = $data['open_at'];
        $problem->close_at = $data['close_at'];

        $problem->save();

        if($isNew) {
            //Crea los 4 grupos de actividades predeterminado
            $agNames = ['Activación', 'Elaboración', 'Consolidación', 'Reflexión'];
            foreach($agNames as $name) {
                $group = new ActivitiesGroup;
                $group->problem_id = $problem->id;
                $group->name = $name;
                $group->save();
            }
        }

        return $problem->id;
    }

    public function postDeleteproblem() {
        $problemId = Input::get('id');
        Problem::destroy($problemId);

        return "Problema Eliminado";
    }
}