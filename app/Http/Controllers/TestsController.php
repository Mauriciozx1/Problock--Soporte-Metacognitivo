<?php
namespace CSLP\Http\Controllers;

class TestsController extends Controller {

    public function getIndex() {
        return 'Index de pruebas';
    }

    public function getParser() {
        return view('IMS-LD/parser');
    }
}