@extends('base-template')

@section('title')
    Crear Ejercicio
@stop

@section('head')
    <link href="{!! asset('/resources/css/maker/make.css') !!}" rel="stylesheet">

    <script>
        activityGroups = {!! $problem !!};
    </script>
@stop

@section('content')

    <div id="maker-container" class="maker-container">
        <div id="activities-menu" class="maker-aside-menu">

        </div>
        <div id="activity-panel" class="activity-panel">
            <div class="no-activity-panel active">
                <span>Seleccione una Actividad a Editar</span>
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
                <div style="text-align: right; padding: 1.2rem 2rem 0 0">
                    <button class="btn-save btn-blue">Guardar</button>
                    <button class="btn-delete btn-red" style="font-size: 14px; padding: 0.2rem 0.5rem">Borrar Actividad</button>
                </div>
                {{--SECTION SELECTOR--}}
                <div class="section-selector" id="section-selector">
                    <span class="selector-option no-select active " data-target="#basic-info-section">Información Básica</span>
                    <span class="selector-option no-select" data-target="#objectives-section">Objetivos Pedagógicos</span>
                </div>
                {{--ACTIVITY INFO--}}
                <div class="activity-info">

                    {{--BASIC INFO SECTION--}}
                    <section class="basic-info-section active" id="basic-options-section">
                        <div class="activity-title">
                            <input type="text" placeholder="Nombre de la Actividad" id="frm-activity-name">
                        </div>
                        <div class="activity-resource">
                            {!! view('maker/editor-toolbox2') !!}
                            <div id="wysihtml-div" data-placeholder="Ingrese descripcion de actividad y recursos pedagógicos"></div>
                        </div>
                    </section>

                    {{--OBJECTIVES SECTION--}}
                    <section class="objectives-section" id="objectives-section">
                        <div class="frame-content-left">
                            {{--EXECUTION CONTROLS--}}
                            <div id="execution-controls" class="execution-controls">
                                <button id="btn-run" class="tooltip-bottom" data-tooltip="Generar Reglas">
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
                                        <div>Regla</div>
                                        <div>Puntaje</div>
                                        <div>Opcional</div>
                                    </div>
                                    <div class="objective-row">
                                        <div>
                                            <input id="frm-cb-results" class="cb-rule checkbox" type="checkbox" data-rule="correct_result"><label for="frm-cb-results">Resultado esperado</label>
                                        </div>
                                        <div>
                                            <input type="number" value="5" data-rule="correct_result" disabled="">
                                        </div>
                                        <div>
                                            <input id="frm-condition-result" class="cb-condition checkbox" type="checkbox" data-rule="correct_result"><label for="frm-condition-result"></label>
                                        </div>
                                    </div>
                                    <div id="results-values-container" class="results-values-container">
                                        <div class="results-values">

                                        </div>
                                        <div>
                                            <input id="frm-result-value" type="text" placeholder="Valor">
                                            <button id="btn-add-result-value" class="btn-green"> + </button>
                                        </div>
                                    </div>
                                    <div class="objective-row">
                                        <div>
                                            <input id="frm-cb-variable" class="cb-rule checkbox" type="checkbox" data-rule="use_variable"><label for="frm-cb-variable">Usar Variables</label>
                                        </div>
                                        <div>
                                            <input type="number" value="5" data-rule="use_variable" disabled="">
                                        </div>
                                        <div>
                                            <input id="frm-condition-variable" class="cb-condition checkbox" type="checkbox" data-rule="use_variable"><label for="frm-condition-variable"></label>
                                        </div>
                                    </div>
                                    <div class="objective-row">
                                        <div>
                                            <input id="frm-cb-conditional" class="cb-rule checkbox" type="checkbox" data-rule="use_conditional"><label for="frm-cb-conditional">Usar Condicionales</label>
                                        </div>
                                        <div>
                                            <input type="number" value="5" data-rule="use_conditional" disabled="">
                                        </div>
                                        <div>
                                            <input id="frm-condition-conditional" class="cb-condition checkbox" type="checkbox" data-rule="use_conditional"><label for="frm-condition-conditional"></label>
                                        </div>
                                    </div>
                                    <div class="objective-row">
                                        <div>
                                            <input id="frm-cb-loop" class="cb-rule checkbox" type="checkbox" data-rule="use_loop"><label for="frm-cb-loop">Usar Ciclos</label>
                                        </div>
                                        <div>
                                            <input type="number" value="5" data-rule="use_loop" disabled="">
                                        </div>
                                        <div>
                                            <input id="frm-condition-loop" class="cb-condition checkbox" type="checkbox" data-rule="use_loop"><label for="frm-condition-loop"></label>
                                        </div>
                                    </div>
                                    <div class="objective-row">
                                        <div>
                                            <input id="frm-cb-function" class="cb-rule checkbox" type="checkbox" data-rule="use_function"><label for="frm-cb-function">Usar Funciones</label>
                                        </div>
                                        <div>
                                            <input type="number" value="5" data-rule="use_function" disabled="">
                                        </div>
                                        <div>
                                            <input id="frm-condition-function" class="cb-condition checkbox" type="checkbox" data-rule="use_function"><label for="frm-condition-function"></label>
                                        </div>
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
                </div>
            </div>
        </div>
    </div>

@stop


@section('scripts')

    {{--HTML 5 EDITOR--}}

    <script src="{!! asset('/resources/js/vendor/html-editor/dist/minified/wysihtml.min.js') !!}"></script>
    <script src="{!! asset('/resources/js/vendor/html-editor/dist/minified/wysihtml.all-commands.min.js') !!}"></script>
    <script src="{!! asset('/resources/js/vendor/html-editor/dist/minified/wysihtml.table_editing.min.js') !!}"></script>
    <script src="{!! asset('/resources/js/vendor/html-editor/dist/minified/wysihtml.toolbar.min.js') !!}"></script>

    <!-- wysihtml5 parser rules -->
    <script src="{!! asset('/resources/js/vendor/html-editor/parser_rules/advanced.js') !!}"></script>

    {{--LIBREIRIA BLOCKLY Y DEPENDENCIAS--}}
    <script src="{!! asset('/resources/js/vendor/blockly/blockly_compressed.js') !!}"></script>
    <script src="{!! asset('/resources/js/vendor/blockly/javascript_compressed.js') !!}"></script>
    <script src="{!! asset('/resources/js/vendor/blockly/blocks_compressed.js') !!}"></script>
    <script src="{!! asset('/resources/js/vendor/blockly/msg/es.js') !!}"></script>

    <script src="{!! asset('/resources/js/vendor/acorn_interpreter.js') !!}"></script>

    {{--  MODELS  --}}
    <script src="{!! asset('/resources/js/maker/models/activity.js') !!}"></script>
    <script src="{!! asset('/resources/js/maker/models/activity_group.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/models/code_tester.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/models/js_interpreter.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/models/resource.js') !!}"></script>
    <script src="{!! asset('/resources/js/maker/models/IMSEncoder.js') !!}"></script>

    {{-- COLLECTIONS --}}
    <script src="{!! asset('/resources/js/maker/collections/activities.js') !!}"></script>
    <script src="{!! asset('/resources/js/maker/collections/activity_groups.js') !!}"></script>

    {{-- VIEWS --}}
    <script src="{!! asset('/resources/js/maker/views/activity_row.js') !!}"></script>
    <script src="{!! asset('/resources/js/maker/views/activity_group.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/views/blockly_panel.js') !!}"></script>
    <script src="{!! asset('/resources/js/workboard/views/console.js') !!}"></script>

    <script src="{!! asset('/resources/js/maker/views/activity_panel.js') !!}"></script>
    <script src="{!! asset('/resources/js/maker/views/basic_options.js') !!}"></script>
    <script src="{!! asset('/resources/js/maker/views/objectives_setter.js') !!}"></script>
    <script src="{!! asset('/resources/js/maker/views/maker.js') !!}"></script>

    {{-- MAIN --}}
    <script src="{!! asset('/resources/js/maker/main.js') !!}"></script>

    {{--Inyecta la estructura del toolbox de blockly--}}
    {!! view("workboard/toolbox") !!}

    {!! view("workboard/resources") !!}


    <script type="text/template" id="activity-row-template">
        <i class="material-icons" style="vertical-align:bottom">arrow_right</i>
        <span class="activity-name"><%= name %></span>
    </script>

    <script type="text/template" id="activity-group-template">
        <div>
            <div class="group-title">
                <span class="group-title-value"><%= name %></span><span class="material-icons btn-edit">edit</span>
            </div>
            <div class="group-title-edit">
                <input class="frm-group-title" type="text" value="<%= name %>">
                <button class="btn-gray btn-cancel">Cancelar</button>
                <button class="btn-green btn-save">Guardar</button>
            </div>
        </div>
        <ul class="activities-list">
        </ul>
        <div style="text-align: center; margin-top: 0.5rem">
            <span class="btn-add">+</span>
        </div>

    </script>



@stop