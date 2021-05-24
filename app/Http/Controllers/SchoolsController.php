<?php

namespace CSLP\Http\Controllers;

class SchoolsController extends Controller{

    public function __construct(){
        $this->middleware('researcher', array('only' => array('getIndex')));
    }

    public function getIndex(){
        return 'Index Schools';
    }
}