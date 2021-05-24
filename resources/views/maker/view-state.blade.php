@extends('base-template')

@section('title')
    Crear Ejercicio
@stop

@section('head')
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <link href="{!! asset('/css/maker/make.css') !!}" rel="stylesheet">
    {{ csrf_field() }}
    <script>
    var viewMode = true;
    //var status = {!! json_encode($status) !!};
    var students = {!! json_encode($usersCourse) !!};
    var infoTeamwork = {!! json_encode($infoTeamwork) !!};
    activityGroups = {!! $problem !!};
    var idProblem = {!! $idProblem!!};
    </script>
@stop

@section('content')

    <div id="maker-container" class="maker-container">
        <div id="activities-menu" class="maker-aside-menu">

        </div>
        <div id="activity-panel" class="activity-panel">
            <div class="no-activity-panel active">
                <span>Seleccione una Actividad a Visualizar</span>
                <br>
                <i class="material-icons">chrome_reader_mode</i>
            </div>
            <div class="activity-panel-content">
                {{--LOADING--}}
                <div class="loading-container">
                    <div class="loading abs-center">
                        <div class="loading-circle"></div>
                    </div>
                </div>
                {{--GENERAL BUTTONS--}}
            
                {{--SECTION SELECTOR--}}
                
                <div class="section-selector" id="section-selector">
                    <span id="selector-objectives" class="selector-option no-select active" data-target="#objectives-section">Objetivos Pedagógicos</span>
                    <span id="selector-view-students" class="selector-option no-select" data-target="#view-students-section">Visualizacion de Estudiantes</span>
                </div>
                {{--ACTIVITY INFO--}}
                <div id="activity-info-section" class="activity-info">

                    
                    
                   
                    {{--OBJECTIVES SECTION--}}
                    <section class="objectives-section section active" id="objectives-section">
                        <div class="frame-content-left">
                            {{--EXECUTION CONTROLS--}}
                            <div id="execution-controls" class="execution-controls">
                                <button id="btn-run" class="tooltip-bottom" data-tooltip="Ejecutar">
                                    <i class="material-icons">play_arrow</i></button>
                            </div>

                            {{--BLOCKLY PANEL--}}
                            <div id="blockly-panel" class="blockly-panel work-panel frame-panel">
                                <div id="blockly-wrapper" style="position: absolute;"></div>
                            </div>

                        </div>

                        <div class="frame-content-right">
                            <div id="h-resizer-bar" class="h-resizer-bar">
                                <i class="material-icons abs-center no-select no-event">more_vert</i>
                            </div>

                            {{--OBJECTIVES PANEL--}}
                            <div id="objectives-panel" class="objectives-panel frame-panel">


                                <div class="objectives-container">
                                    <div class="objective-row">
                                        
                                    </div>
                                    <div class="objective-row">
                                        
                                    </div>
                                    <div id="results-values-container" class="results-values-container">
                                        
                                    </div>
                                    <div class="objective-row">
                                        
                                    </div>
                                    <div class="objective-row">
                                        
                                    </div>
                                    <div class="objective-row">
                                        
                                    </div>
                                    <div class="objective-row">
                                        
                                    </div>
                                </div>

                            </div>
                            <div id="v-resizer-bar" class="v-resizer-bar">
                                <i class="material-icons abs-center no-select no-event">more_horiz</i>
                            </div>

                            {{--OUTPUT PANEL--}}
                            <div id="output-panel" class="output-panel frame-panel">
                                <span class="no-select no-event">Consola: </span>
                                <br><br>

                                <div id="output-console" class="output-panel-console"></div>
                            </div>
                        </div>
                    </section>

                    {{--VIEW STUDENTS SECTION--}}
                    <section class="objectives-section section" id="view-students-section">
                        <div class="frame-content-left">
                            {{--EXECUTION CONTROLS--}}
                            <div class="activities-list" style="margin-bottom: 1rem;">
                                <div class="title-list-activities" style="text-align: center">
                                    <strong>Lista de Estudiantes</strong>
                                </div>
                                <div class="info-status" style="display:flex;">
                                    <div class="status-offline" style="margin:0.5 rem;"><span class="material-icons red">highlight_off</span>Desconectado</div>
                                    <div class="status-online" style="margin:0.5 rem;"><span class="material-icons green">check_circle</span>Conectado</div>
                                    <div class="status-absent" style="margin:0.5 rem;"><span class="material-icons yellow">error_outline</span>Ausente</div>
                                    </div>
                                <div class="list-activity">
                                    
                                </div>
                            </div>
                            

                            {{--BLOCKLY PANEL--}}
                            

                        </div>

                        <div class="frame-content-right">
                            <div id="h-resizer-bar" class="h-resizer-bar">
                                <i class="material-icons abs-center no-select no-event">more_vert</i>
                            </div>

                            {{--OBJECTIVES PANEL--}}
                            <div id="objectives-panel" class="objectives-panel frame-panel">


                                <div class="objectives-container">
                                    <div class="objective-row">
                                        
                                    </div>
                                    <div class="objective-row">
                                        
                                    </div>
                                    <div id="results-values-container" class="results-values-container">
                                        
                                    </div>
                                    <div class="objective-row">
                                        
                                    </div>
                                    <div class="objective-row">
                                        
                                    </div>
                                    <div class="objective-row">
                                        
                                    </div>
                                    <div class="objective-row">
                                        
                                    </div>
                                </div>

                            </div>
                            <div id="v-resizer-bar" class="v-resizer-bar">
                                <i class="material-icons abs-center no-select no-event">more_horiz</i>
                            </div>

                            {{--OUTPUT PANEL--}}
                            <div id="output-panel" class="output-panel frame-panel">
                                
                            </div>
                        </div>
                    </section>
                    
                </div>
            </div>
        </div>
    </div>

@stop


@section('scripts')

    {{--HTML 5 EDITOR--}}

    <script src="{{ asset('js/app.js') }}" defer></script>
    {{--LIBREIRIA BLOCKLY Y DEPENDENCIAS--}}
    <script src="{!! asset('/js/vendor/blockly/blockly_compressed.js') !!}"></script>
    <script src="{!! asset('/js/vendor/blockly/javascript_compressed.js') !!}"></script>
    <script src="{!! asset('/js/vendor/blockly/blocks_compressed.js') !!}"></script>
    <script src="{!! asset('/js/vendor/blockly/msg/es.js') !!}"></script>

    <script src="{!! asset('/js/vendor/acorn_interpreter.js') !!}"></script>

    {{--  MODELS  --}}
    
    <script src="{!! asset('/js/state/models/activity.js') !!}"></script>
    <script src="{!! asset('/js/state/models/activity_group.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/code_tester.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/js_interpreter.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/resource.js') !!}"></script>
    
    

    {{-- COLLECTIONS --}}
    <script src="{!! asset('/js/state/collections/activities.js') !!}"></script>
    <script src="{!! asset('/js/state/collections/activity_groups.js') !!}"></script>
    

    {{-- VIEWS --}}
    <script src="{!! asset('/js/state/views/activity_row.js') !!}"></script>
    <script src="{!! asset('/js/state/views/activity_group.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/blockly_panel.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/console.js') !!}"></script>
    <script src="{!! asset('/js/state/views/view_students.js') !!}"></script>
    <script src="{!! asset('/js/state/views/activity_panel.js') !!}"></script>
    
    <script src="{!! asset('/js/state/views/objectives_setter.js') !!}"></script>
    <script src="{!! asset('/js/state/views/status.js') !!}"></script>

    {{-- MAIN --}}
    <script src="{!! asset('/js/state/main.js') !!}"></script>


    {{--Inyecta la estructura del toolbox de blockly--}}
    {!! view("workboard/toolbox") !!}

    {!! view("workboard/resources") !!}
    <script type="text/template" id="question-template">
        <div class="question">
            <span><%= question_name%></span>
            <span class="material-icons btn-edit-question" name="<%= type>">edit</span>
        </div>
        </script>
    <script type="text/template" id="activity-row-template">
        <i class="material-icons" style="vertical-align:bottom">arrow_right</i>
        <span class="activity-name"><%= name %></span>
    </script>
    
    
        
    
    <script type="text/template" id="activity-group-template">
    
        <div>
            <div class="group-title">
                <span class="group-title-value"><%= name %></span>
            </div>
            <div class="group-title-edit">
                <input class="frm-group-title" type="text" value="<%= name %>">
                <button class="btn-gray btn-cancel">Cancelar</button>
                <button class="btn-green btn-save">Guardar</button>
            </div>
            
        </div>
        <ul class="activities-list">
        </ul>
        
    </script>
    


@stop