@extends('base-template')

@section('title')
    Crear Ejercicio
@stop

@section('head')
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <link href="{!! asset('/css/maker/make.css') !!}" rel="stylesheet">
    {{ csrf_field() }}
    <script>
        var viewMode = false;
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
                    <span id="selector-basic-info" class="selector-option no-select active " data-target="#basic-info-section">Información Básica</span>
                    <span id="selector-questions" class="selector-option no-select" data-target="#questions-section">Preguntas restrospectivas</span>
                    <span id="selector-objectives" class="selector-option no-select" data-target="#objectives-section">Objetivos Pedagógicos</span>
                    
                </div>
                {{--ACTIVITY INFO--}}
                <div id="activity-info-section" class="activity-info">

                    {{--QUESTIONS SECTION--}}
                    <section class="questions-section section" id="questions-section">
                        <div class="content-options-questions">
                            <div class="quantitative-question">
                                <div class="content-questions-option">
                                    <span class="title-create-question">¿Activar preguntas cuantitativas?</span>
                                    <input type="checkbox" name="add-quantitative" class="cb-questions" id="questions-quantitative">
                                </div>
                                <div id="add-quantitative" class="questions-create">
                                    <div id="content-add-quantitative" class="questions">
                                        {{--Questions created--}}
                                    </div>
                                    <div id="content-create-question-quantitative" class="content-create-question">
                                        <div class="create-question">
                                            <div class="input-question-option">
                                                <input id="input-question-quantitative" type="text" name="quantitative" placeholder="Ingresa tu pregunta" class="input-question"><span name="quantitative" class="material-icons btn-done-question">done</span><span class="material-icons btn-cancel-question" name="content-create-question-quantitative">close</span>
                                            </div>
                                            <div class="scale-options">
                                                <strong>Defina la Escala </strong>
                                                <select id="select-scale" name="select-scale" required="required">
                                                    <option value="" selected>Escala:</option>
                                                    <option value="2">1 a 2</option>
                                                    <option value="3">1 a 3</option>
                                                    <option value="4">1 a 4</option>
                                                    <option value="5">1 a 5</option>
                                                    <option value="6">1 a 6</option>
                                                    <option value="7">1 a 7</option>
                                                    <option value="8">1 a 8</option>
                                                    <option value="9">1 a 9</option>
                                                    <option value="10">1 a 10</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <span id="btn-add-quantitative"class="btn-add-questions" name="content-create-question-quantitative">+</span>
                                </div>
                            </div>
                            <div class="qualitative-question">
                                <div class="content-questions-option">
                                    <span>¿Activar preguntas cualitativas?</span>
                                    <input type="checkbox" name="add-qualitative" class="cb-questions" id="questions-qualitative">
                                </div>
                                
                                <div id="add-qualitative" class="questions-create">
                                    <div id="content-add-qualitative" class="questions">
                                        {{--Questions created--}}
                                    </div>
                                    <div id="content-create-question-qualitative" class="content-create-question">
                                        <div class="create-question" style="display: flex;">
                                            <input id="input-question-qualitative" type="text" name="qualitative" placeholder="Ingresa tu pregunta" class="input-question"><span name="qualitative" class="material-icons btn-done-question">done</span><span class="material-icons btn-cancel-question" name="content-create-question-qualitative">close</span>
                                        </div>
                                    </div>
                                    <span id="btn-add-qualitative" class="btn-add-questions" name="content-create-question-qualitative">+</span>
                                </div>
                            </div>
                        </div>
                    </section>
                    {{--BASIC INFO SECTION--}}
                    <section class="basic-info-section section active" id="basic-info-section">
 
                        <div class="activity-title">
                            
                            <input type="text" placeholder="Nombre de la Actividad" id="frm-activity-name">
                        </div>
                        <div class="activity-resource">
                            {!! view('maker/editor-toolbox2') !!}
                            <div id="wysihtml-div" data-placeholder="Ingrese descripcion de actividad y recursos pedagógicos"></div>
                        </div>
                    </section>
                   
                    {{--OBJECTIVES SECTION--}}
                    <section class="objectives-section section" id="objectives-section">
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

    <script src="{!! asset('/js/vendor/html-editor/dist/minified/wysihtml.min.js') !!}"></script>
    <script src="{!! asset('/js/vendor/html-editor/dist/minified/wysihtml.all-commands.min.js') !!}"></script>
    <script src="{!! asset('/js/vendor/html-editor/dist/minified/wysihtml.table_editing.min.js') !!}"></script>
    <script src="{!! asset('/js/vendor/html-editor/dist/minified/wysihtml.toolbar.min.js') !!}"></script>

    <!-- wysihtml5 parser rules -->
    <script src="{!! asset('/js/vendor/html-editor/parser_rules/advanced.js') !!}"></script>

    {{--LIBREIRIA BLOCKLY Y DEPENDENCIAS--}}
    <script src="{!! asset('/js/vendor/blockly/blockly_compressed.js') !!}"></script>
    <script src="{!! asset('/js/vendor/blockly/javascript_compressed.js') !!}"></script>
    <script src="{!! asset('/js/vendor/blockly/blocks_compressed.js') !!}"></script>
    <script src="{!! asset('/js/vendor/blockly/msg/es.js') !!}"></script>

    <script src="{!! asset('/js/vendor/acorn_interpreter.js') !!}"></script>

    {{--  MODELS  --}}
    <script src="{!! asset('/js/maker/models/activity.js') !!}"></script>
    <script src="{!! asset('/js/maker/models/activity_group.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/code_tester.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/js_interpreter.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/resource.js') !!}"></script>
    <script src="{!! asset('/js/maker/models/IMSEncoder.js') !!}"></script>
    

    {{-- COLLECTIONS --}}
    <script src="{!! asset('/js/maker/collections/activities.js') !!}"></script>
    <script src="{!! asset('/js/maker/collections/activity_groups.js') !!}"></script>
    

    {{-- VIEWS --}}
    <script src="{!! asset('/js/maker/views/activity_row.js') !!}"></script>
    <script src="{!! asset('/js/maker/views/activity_group.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/blockly_panel.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/console.js') !!}"></script>

    <script src="{!! asset('/js/maker/views/activity_panel.js') !!}"></script>
    <script src="{!! asset('/js/maker/views/questionsView.js') !!}"></script>
    <script src="{!! asset('/js/maker/views/basic_options.js') !!}"></script>
    <script src="{!! asset('/js/maker/views/objectives_setter.js') !!}"></script>
    <script src="{!! asset('/js/maker/views/maker.js') !!}"></script>

    {{-- MAIN --}}
    <script src="{!! asset('/js/maker/main.js') !!}"></script>


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
        @if($type === "Individual")
        <div style="text-align: center; margin-top: 0.5rem;">
            <span class="btn-add-i">+</span>
            </div>
        @endif
        @if($type === "Grupal")
        <div style="text-align: center; margin-top: 0.5rem;">
            <span class="btn-add-g">+</span>
        </div>
        <div class="activities-type" style="color: #000000;" placeholder="Tipo">
        {{ csrf_field() }}
                <select id="select-type-activities">
                    <option value="1">Individual</option> 
                    <option value="2">Grupal</option>  
                </select>
                <button class="btn-gray btn-cancel-type">Cancelar</button>
                <button class="btn-green btn-save-type">Crear</button>
            
        </div>
        @endif
    </script>
    


@stop