<?php

namespace CSLP\Http\Controllers;

use CSLP\Modules\Models\User;
use CSLP\Modules\Models\Student;
use Illuminate\Http\Request;
use Session;
use Auth;
use Input;


class AuthController  extends Controller{


    public function __construct(){
        $this->middleware('auth', array('only' => array('getLogout')));

    }

    public function getLogin(){
        return view('auth/login');
    }

    public function postLogin(Request $request){
        //Aparte del email y el password confirma que es un usuario activo
        $user = ['email' => Input::get('frm-email'), 'password' => Input::get('frm-password')];

        //Intento de ingresar el usuario
        if(Auth::attempt($user, Input::get('frm-reminder'))) {
            return redirect()->intended('');
        }

        // Fallo la autentificacion, vamos a la pagina principal
        return redirect()->back()->with('error', 'Tu Usuario o Contraseña son incorrectos.')->withInput();

    }

    public function getSignup(){
        return view('auth/signup');
    }

    public function postSignup(Request $request){
        $data = Input::all();

        $rules = ["name" => "required|alpha_num", "flastname" => "required|alpha_num", "mlastname" => "alpha_num", "email" => "required|email|unique:users,email", "emailCheck" => "required|same:email", "password" => "required|min:6", "passwordCheck" => "required|same:password"];

        $validator = \Validator::make($data, $rules);

        if($validator->fails()) {
            $errors = $validator->errors()->all();
            return redirect()->back()->withInput(Input::only(['email', 'name', 'flastname', 'mlastname']))->withErrors($errors);

        } else {
            $newUser = new User;
            $newUser->name = $data['name'];
            $newUser->flastname = $data['flastname'];
            $newUser->mlastname = $data['mlastname'];
            $newUser->email = $data['email'];
            $newUser->type = $data['type'];
            $newUser->password = bcrypt($data['password']);

            $newUser->save();

            //Autentifica al nuevo usuario creado en el sistema
            Auth::login($newUser);


            //Si es un alumno crea el perfil de estudiante
            if($newUser->type == 'student'){
                $student = new Student;
                $student -> user_id = $newUser->id;
                $student -> save();

                //Asocia al estudiante a ese curso


            }

            return redirect('');
        }
    }

    //Logout del Usuario actual
    public function getLogout() {
        //Borra todo lo que se haya almacenado en la sesion
        Session::flush();

        Auth::logout();

        return redirect('login');

    }

}