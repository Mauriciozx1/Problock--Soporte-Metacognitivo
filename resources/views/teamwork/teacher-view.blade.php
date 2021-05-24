@extends('base-template')
@section('title')
    Teamworks
@stop
@section('head')
<link href="{!! asset('/css/maker/exercises.css') !!}" rel="stylesheet">
    <link href="{!! asset('/css/scores/teacher.css') !!}" rel="stylesheet">
    <link href="{!! asset('/css/maker/make.css') !!}" rel="stylesheet">
    <link href="{!! asset('/css/teamworks/teamwork.css') !!}" rel="stylesheet">
    <script>
        teamworks = {!!$teamworks!!};
        
    </script>

@stop
@section('content')
<div id="teamwork-container" class="teamwork-container">
    <h1 class="exercise-name">{!!$exercise!!}</h1>
    
    <div class="section-selectors">
        <ul>
            <li class="section-selector active" data-target="#teamwork-section">Grupos</li>
        </ul>
    </div>

    <div class="sections-container">

        <section class="scores-section section active" id="teamwork-section">
            <div class="teamwork-menu" id="teamwork-menu"></div>
        
        </section>
        
        <section class="scores-section section" id="config-section">
            <form>
                <div class="form-group">
                    <label for="opcion1">Agregar estudiantes Automaticamente</label>
                    <input type="checkbox" class="form-control" id="opcionAutoAdd">
                </div>
            </form>
        </section>
        <div class="stat-widget">
            <div class="stat-widget-content">
                <canvas id="scoresChart" width="900" height="400"></canvas>
            </div>
        </div>
        
        

    </div>  
@stop
@section('scripts')
    <script src="{!! asset('/js/vendor/chart.min.js') !!}"></script>
    <script>
        $(document).ready(function() {
            //Maneja el cambio de secciones
            $('.section-selector').on('click',function() {
                var section = $(this).attr('data-target');
                $('.section-selector.active').removeClass('active');
                $(this).addClass('active');
                $('.section.active').removeClass('active');
                $(section).addClass('active');
            })
        });
    </script>
    
    
    {{--  MODELS  --}}
    <script src="{!! asset('/js/teamworks/models/teamwork.js') !!}"></script>
    <script src="{!! asset('/js/teamworks/models/student.js') !!}"></script>
    {{-- COLLECTIONS --}}
    <script src="{!! asset('/js/teamworks/collections/teamworks.js') !!}"></script>
    <script src="{!! asset('/js/teamworks/collections/students.js') !!}"></script>
    {{-- VIEWS --}}
    <script src="{!! asset('/js/teamworks/views/student.js') !!}"></script>
    <script src="{!! asset('/js/teamworks/views/teamwork.js') !!}"></script>
    {{-- MAIN --}}
    <script src="{!! asset('/js/teamworks/main.js') !!}"></script>
    <script type="text/template" id="student-row-template">
    <img src="{!! url('/images/no-profile.png') !!}" alt="" style="width:20px">       
        <span class="student-name"><%= name%> <%=flastname %></span>       
    </script>
    <script type="text/template" id="teamwork-template">
        <div class="teamwork-name">
            <strong><%= nameTeam %></strong>
            <div class="teamwork-list">
            </div>
        </div>
        
    </script>
                
                
@stop