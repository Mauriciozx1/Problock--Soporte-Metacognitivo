@extends('base-template')

@section('title')
    WorkBoard
@stop

@section('head')
    <link href="{!! asset('/resources/css/workboard/workboard.css') !!}" rel="stylesheet">
    <link href="{!! asset('/resources/css/vendor/prettify.css') !!}" rel="stylesheet">

    <script>
        activityGroups = {!! $problem !!};
        scores = {!! $scores !!};
    </script>
@stop

@section('content')

    {{--RESOURCES MODAL--}}
    <div id="resources-modal" class="resources-modal">
        <div class="modal-fade"></div>
        <div class="modal">
            <i class="btn-close material-icons">highlight_off</i>

            <div class="modal-title">

            </div>
            <div class="modal-content">

            </div>
            <div class="modal-footer">
                <button class="btn-gotit btn-blue">Entiendo!</button>
            </div>
        </div>
    </div>

    {{--FINISH MODAL--}}
    <div id="finish-modal" class="finish-modal">
        <div class="modal-fade"></div>
        <div class="modal">
            <div class="modal-title">
                <div class="activity-result-status">
                    <i class="material-icons abs-center">mood</i>
                </div>
            </div>
            <div class="modal-content">
                <div><b>Muy Bien!</b> has completado la actividad usando
                    <span class="code-lines-count">26</span> lineas de código.
                </div>
                <div class="code-panel-container">
                    {{--CODIGO JS DEL EJERCICIO--}}
                </div>
                <div class="result-container">
                    <div>
                        <div class="objetives-list">
                            <ul>
                                <li data-objetive="correct_result">Correcto Resultado</li>
                                <li data-objetive="use_variable">Uso de Variables</li>
                                <li data-objetive="use_conditional">Uso de Condicionales</li>
                                <li data-objetive="use_loop">Uso de Ciclos</li>
                                <li data-objetive="use_function">Uso de Funciones</li>
                            </ul>
                        </div>
                        <div class="calification-info">

                            <i>Puntaje Obtenido: </i><span class="obtained-points">8</span><i> / </i><span class="total-points">15</span><i> = </i><span class="total-percent">63</span>
                        </div>
                    </div>
                </div>
                <div id="group-success" style="display:none;">
                    <span>**No puedes pasar a la siguiente seccion teniendo menos de un</span> <span id="group-success-required">0%</span> <span>de aprobación promedio entre las actividades</span>
                    <span>Tu promedio actual es de un: </span><span id="group-success-percent">0%</span>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn-stay btn-blue">Volver a la Actividad</button>
                <button class="btn-next btn-blue">Siguiente Actividad</button>
            </div>
        </div>
    </div>

    {{--WORKBOARD--}}
    <div id="workboard" class="frame">

        <button id="btn-tour" class="btn-tour btn-blue">Tour</button>

        <div id="frame-header" class="frame-header">
            {{--ACTIVITY INFO--}}
            <div id="activity-info" class="activity-info">
                <div class="activity-progress">
                    <span id="exercise-title"></span>

                    <div class="progress-bar-container">
                        <div id="progress-bar" class="progress-bar"></div>
                    </div>
                </div>
            </div>
            <div class="activity-title">
                <h2 id="activity-title"></h2>
            </div>
            <button id="btn-save" class="btn-green">Guardar</button>
            <button id="btn-finish" class="btn-blue">Finalizar</button>
        </div>

        <div id="frame-content" class="frame-content">

            {{--ACTIVITIES MENU--}}
            <div id="activities-menu" class="activities-menu auto-hide no-select">
                <div id="activity-groups">

                </div>
            </div>

            {{-- LOADING --}}
            <div class="loading-container active">
                <div class="loading abs-center">
                    <div class="loading-circle"></div>
                </div>
            </div>

            <section id="frame-content-left" class="frame-content-left">
                {{--PANEL SELECTOR--}}
                <div id="panel-selector" class="panel-selector">
                    <span id="blockly-panel-selector" class="active" data-target="#blockly-panel">Blockly</span>
                    <span id="javascript-panel-selector" data-target="#javascript-panel">Javascript</span>
                </div>

                {{--EXECUTION CONTROLS--}}
                <div id="execution-controls" class="execution-controls">
                    <label for="by-steps">Ejecutar por pasos</label> <input id="by-steps" type="checkbox">
                    <button id="btn-run" class="tooltip-bottom" data-tooltip="Ejecutar código">
                        <i class="material-icons">play_arrow</i></button>
                    <button id="btn-stop" class="tooltip-bottom" data-tooltip="Detener ejecución">
                        <i class="material-icons">stop</i></button>
                    <button id="btn-step" class="tooltip-bottom" data-tooltip="Ejecutar siguiente sentencia" disabled="disabled">
                        <i class="material-icons">redo</i></button>
                </div>

                {{--BLOCKLY PANEL--}}
                <div id="blockly-panel" class="blockly-panel work-panel frame-panel active">
                    <div id="blockly-wrapper" style="position: absolute;"></div>
                </div>

                {{--CODE PANEL--}}
                <div id="javascript-panel" class="javascript-panel work-panel frame-panel">
                    <pre class="prettyprint linenums lang-js">
                        <code id="generated-code">

                        </code>
                    </pre>
                </div>
            </section>
            <section class="frame-content-right">
                <div id="h-resizer-bar" class="h-resizer-bar">
                    <i class="material-icons abs-center no-select no-event">more_vert</i>
                </div>

                {{--RESOURCE PANEL--}}
                <div id="resources-panel" class="resources-panel frame-panel">

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
            </section>
        </div>
    </div>

    <div id="block-message" class="block-message" data-icon="">
        <div class="block-message-title">
        </div>
        <div class="block-message-content">
        </div>
    </div>

    <xml id="imsld-exercise" style="display: none">
        @include('IMS-LD/exercise')
    </xml>

@stop

@section('scripts')

    {{--<script src="{!! asset('/resources/js/workboard/fixed-configuration.js') !!}"></script>--}}

    {{--LIBREIRIA BLOCKLY Y DEPENDENCIAS--}}
    <script src="{!! asset('/resources/js/vendor/blockly/blockly_compressed.js') !!}"></script>
    <script src="{!! asset('/resources/js/vendor/blockly/javascript_compressed.js') !!}"></script>
    <script src="{!! asset('/resources/js/vendor/blockly/blocks_compressed.js') !!}"></script>
    <script src="{!! asset('/resources/js/vendor/blockly/msg/es.js') !!}"></script>

    <script src="{!! asset('/resources/js/vendor/acorn_interpreter.js') !!}"></script>
    <script src="{!! asset('/resources/js/vendor/prettify.js') !!}"></script>


    {{--  MODELS  --}}
    <script src="{!! asset('/resources/js/workboard/models/activity.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/models/activity_group.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/models/code_formatter.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/models/code_tester.js?2') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/models/js_interpreter.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/models/resource.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/models/IMS-LD_parser.js') !!}"></script>


    {{-- COLLECTIONS --}}
    <script src="{!! asset('/resources/js/workboard/collections/activities.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/collections/activity_groups.js') !!}"></script>

    {{-- VIEWS --}}
    <script src="{!! asset('/resources/js/workboard/views/activity_row.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/views/activity_group.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/views/blockly_panel.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/views/code_panel.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/views/console.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/views/finish_modal.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/views/frame_header.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/views/resource_modal.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/views/workboard.js') !!}"></script>

    {{-- MAIN --}}
    <script src="{!! asset('/resources/js/workboard/main.js') !!}"></script>

    {{--Inyecta la estructura del toolbox de blockly--}}
    {!! view("workboard/toolbox") !!}

    {!! view("workboard/resources") !!}

    <script type="text/template" id="activity-group-template">
        <div class="list-header">
            <span class="group-state"><i class="material-icons status-icon"></i></span>
            <span class="group-name"><%= name %></span>
        </div>
        <ul class="activities-list"></ul>
    </script>

    <script type="text/template" id="activity-row-template">
        <span class="activity-state"><i class="material-icons"><%= icon %></i></span>
        <span class="activity-name"><%= name %></span>
    </script>

@stop


