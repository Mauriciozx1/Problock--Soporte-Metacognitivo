@extends('base-template')

@section('title')
@stop

@section('head')
    <link href="{!! asset('/resources/css/auth/login.css') !!}" rel="stylesheet">
@stop


@section('content')
    <br>
    <a href="{!! url('signup') !!}">Crear Usuario</a>
    <div class="form-container">
        <br>

        <form method="POST" action="{!! url('login') !!}" data-parsley-validate>
            {!! csrf_field() !!}

            <fieldset>
                <legend>Ingresar a la Plataforma</legend>
                @if (session('error'))
                    <div id="server-error-box" class="error-box" style="text-align: left; border-color: #F12828; color: #F12828;font-size: 1.6rem">
                        {!! session('error') !!}
                    </div>
                @endif
                <br>

                <div class="fields-container">
                    <div class="field">
                        <label for="frm-email">Email</label>

                        <div class="icon-input-container">
                            <input id="frm-email" name="frm-email" type="email" value="{!! old('frm-email') !!}" placeholder="usuario@ejemplo.cl" autofocus="" required="" data-parsley-errors-container="#email-error-container" tabindex="1">
                            <label for="frm-email" class="icon-input icon-mail"></label>
                        </div>
                        <div id="email-error-container" class="error-box"></div>
                    </div>
                    <br>

                    <div class="field">
                        <label for="frm-password">Contraseña</label>

                        <div class="icon-input-container">
                            <input id="frm-password" name="frm-password" type="password" minlength="6" placeholder="Ingrese su contraseña" required="" data-parsley-errors-container="#password-error-container" tabindex="2">
                            <label for="frm-password" class="icon-input icon-key"></label>
                        </div>

                        <div id="password-error-container" class="error-box"></div>

                    </div>
                    <br>

                    <div class="field">
                        <input type="checkbox" id="frm-reminder" name="frm-reminder" checked tabindex="3">
                        <label for="frm-reminder">Mantener sesion abierta?</label>
                    </div>
                </div>
                <div class="submit-container">
                    <br>
                    <button class="btn-blue" type="submit" tabindex="4">
                        Iniciar Sesion
                    </button>
                </div>
            </fieldset>

        </form>
    </div>
@stop


@section('scripts')
@stop