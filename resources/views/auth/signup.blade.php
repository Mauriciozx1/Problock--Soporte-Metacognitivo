@extends('base-template')

@section('title')
@stop

@section('head')
    <style>
        .form-container{
            text-align: center;
            margin-top: 3rem;
        }

        input {
            margin:1rem;
        }
    </style>
@stop


@section('content')
    <div class="form-container">
        @include('auth/signup-form', ['type' => 'student'])
    </div>
@stop


@section('scripts')
@stop