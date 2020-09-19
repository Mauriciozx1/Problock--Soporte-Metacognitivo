<?php

namespace CSLP\Http\Controllers;

use CSLP\Modules\Models\Activity;
use CSLP\Modules\Models\GroupActivityLink;
use CSLP\Modules\Models\Problem;
use CSLP\Modules\Models\Score;
use CSLP\Modules\Models\Student;

class TeacherController extends Controller {

    public function getIndex() {
        return redirect('/problems');
    }

    public function getExercisescore($exerciseId = 1) {

        $problem = Problem::find($exerciseId);

        $exerciseName = $problem->name;

        $activitiesGroups = $problem->activitiesGroups;
        $activitiesGroupsIds = [];

        foreach($activitiesGroups as $ag) {
            array_push($activitiesGroupsIds, $ag->id);
        }

        $gals = GroupActivityLink::whereIn('group_id', $activitiesGroupsIds)->get();
        $activitiesIds = [];

        foreach($gals as $gal) {
            array_push($activitiesIds, $gal->activity_id);
        }

        $activities = Activity::whereIn('id', $activitiesIds)->select('id', 'name')->get();

        $activitiesNames = [];
        foreach($activities as $activity) {
            array_push($activitiesNames, $activity->name);
        }

        $students = Student::all()->load('user');
        $studentsIds = [];
        foreach($students as $st) {
            array_push($studentsIds, $st->id);
        }

        $scores = Score::whereIn('activity_id', $activitiesIds)->whereIn('student_id', $studentsIds)->get();

        $studentsArray = [];
        foreach($students as $st) {
            $student = [];
            $student['fullName'] = $st->user->full_name;
            $student['scores'] = [];
            $student['exerciseScore'] = 0;

            if(count($activities) !== 0) {
                foreach($activities as $act) {
                    $score = $scores->where('student_id', $st->id)->where('activity_id', $act->id)->first();
                    $scoreValue = 0;

                    if($score != null)
                        $scoreValue = $score->score;

                    array_push($student['scores'], $scoreValue);
                    $student['exerciseScore'] += $scoreValue;
                }
                $student['exerciseScore'] = round($student['exerciseScore'] / count($activities));
            }

            array_push($studentsArray, $student);
        }

        //Ordenando los estudiantes por calificacion final
        $sortedStudents = array_values(array_sort($studentsArray, function ($value) {
            return $value['exerciseScore'];
        }));

        //Promedio Total del Ejercicio
        $exerciseScoreAvg = 0;
        foreach($studentsArray as $student) {
            $exerciseScoreAvg += $student['exerciseScore'];
        }

        $exerciseScoreAvg = round($exerciseScoreAvg / count($studentsArray));

        //Promedio por Actividad
        $activitiesScoreAvg = [];
        foreach($activities as $index => $activity) {
            $activityAvg = 0;
            foreach($studentsArray as $student) {
                $activityAvg += $student['scores'][$index];
            }
            $activityAvg = round($activityAvg / count($studentsArray));
            array_push($activitiesScoreAvg, $activityAvg);
        }

        $statistics = ['exerciseScoreAvg' => $exerciseScoreAvg, 'activitiesScoreAvg' => $activitiesScoreAvg];

        $data = ['exercise' => $exerciseName, 'activities' => $activitiesNames, 'students' => $studentsArray, 'sortedStudents' => $sortedStudents, 'statistics' => $statistics];

        return $data;
    }

    public function getScores($excerciseId = null) {

        return view('qualifications/teacher-view', $this->getExercisescore($excerciseId));
    }
}