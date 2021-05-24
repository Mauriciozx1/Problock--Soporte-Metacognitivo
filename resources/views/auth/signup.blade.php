@extends('base-template')

@section('title')
@stop

@section('head')
<link href="{!! asset('/css/auth/register.css') !!}" rel="stylesheet">
@stop


@section('content')
    <div class="form-container">
        @include('auth/signup-form', ['type' => 'student'])
    </div>
@stop


@section('scripts')
@stop