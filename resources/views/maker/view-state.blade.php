@extends('base-template')

@section('title')
    Crear Ejercicio
@stop

@section('head')
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="{!! asset('/js/vendor/html2canvas.min.js') !!}"></script>
<script type="module" src="https://cdn.jsdelivr.net/npm/emoji-picker-element@^1/index.js"></script>    
<meta name="csrf-token" content="{{ csrf_token() }}" />
    <link href="{!! asset('/css/maker/make.css') !!}" rel="stylesheet">
    {{ csrf_field() }}
    <script>
   
    var viewMode = true;
    var teacher = {!!Auth::user()!!}
    //var status = {!! json_encode($status) !!};
    var students = {!! json_encode($usersCourse) !!};
    var infoTeamwork = {!! $infoTeamwork !!};
    var infoTeamworks = {!! $infoTeamwork !!};
    activityGroups = {!! $problem !!};
    var idProblem = {!! $idProblem !!};
    </script>
@stop

@section('content')

    {{--FINISH MODAL--}}
    <div id="modal-regrup" class="finish-modal">
        <div class="modal-fade"></div>
        <div class="modal-regrup">
            <div class="modal-title">
                <div class="activity-result-status">
                    <i class="material-icons abs-center">mood</i>
                </div>
            </div>
            <div><h1>Editar Grupos de Trabajo</h1>
            </div>
            <b>Mover estudiante:</b> Se debe arrastrar al grupo de destino.
            <b>Eliminar Grupo:</b> Se debe arrastrar a <span class="material-icons">delete</span>
            <b>Agregar Grupo:</b> Presionando boton <span class="material-icons">group_add</span>
            <div id="modal-content" class="modal-content">
                <div id ="no-team-content"class="list-student-status" style="text-align: center; margin:2rem; display:none;">
                    <span class="name-team">Estudiantes sin Equipo</span>
                    <div id="no-team" class="content-interger" style="display:grid;">

                    </div>
                    <span id="no-team-warning" style="font-size: 1.4rem; display:none; color: red;">*No se puede aplicar cambios con estudiantes sin equipo </span>
                </div>
                <div class="options" style="text-align: center;">
                    <button id="btn-add-team" class="btn-green btn-success" title="Agregar Grupo"><span class="material-icons">
                        group_add
                        </span></button>
                    <button id="btn-delete" ondrop="dropDelete(event)" ondragover="allowDrop(event)" class="btn-red btn-blue" title="Eliminar"><span class="material-icons">
                        delete
                        </span></button>
                   <!-- <button id="btn-restart" class="btn-blue btn-blue" title="Restaurar valores"><span class="material-icons">
                        restart_alt
                        </span></button>-->
                        
                </div>
                <span id="move-warning" style="font-size: 1.4rem; display:none; color: red;">*Movimiento invalido</span>
                <div class="code-panel-container" style="overflow-y: scroll; height:250px;">
                    <div id="list-activity-regrup" class="content-list" style="display: flex">
                        
                    </div>
                    

                </div>
                
                
            </div>
            
            <div class="modal-footer">
                <span id="team-full-warning" style="display: none; color: red;">*Los grupos deben de contener como max 3 integrantes.</span>
                <span id="team-nofull-warning" style="display: none; color: red;">*Los grupos deben de contener al menos 1 estudiante.</span>
                <button id="btn-regroups" class="btn-green btn-success">Aplicar Cambios</button>
                <button id="btn-close-regrup" class="btn-red btn-blue">Cerrar</button>
            </div>
        </div>
    </div>

    <div id="chat" class="chat">
                
        <button id="btn-chat-popup" class="btn-chat" > 
            <div class="badge" >{{--notificationChat--}}</div>
            <i class="material-icons"> comment </i>
        </button>
        <div class="content-chat">
        <div id="chat-popup" class="chat-popup">
            
            <div class="chat-body">
                <div id="title-chat" class="title-chat" ></div>
                
                <div id="list-unstyled" class="list-unstyled" style="overflow-y:scroll; height:300px;" >
                    <div class="no-message" style="text-align: center; padding:7rem;">
                        <span>Seleccione un Estudiante para Comunicarte</span>
                        <br>
                        <i class="material-icons">live_help</i>
                    </div>
                    <div id="p-2" class="p-2" >
                    <div class="content-messages"></div>
                    </div>
                </div>
                <div class="text-writing">
                    <span class="text-muted" ></span>
                </div>
                    
                
            </div>
            
            <div id="r-message-content-photo" class="r-message-content-photo" style="overflow-x: auto">
                <div class="view-capture" style="display: flex">
                </div>

            </div>
            <div id="r-message-content" class="r-message-content">
            </div>
            
            <div class="text-chat" style="display: none">
            <input  type="text" name="message" placeholder="Ingresa tu mensaje y presiona enter..." id="chat-message" class="chat-message">
            <span class="btn-send-message" title="Enviar mensaje">▶️</span>
            <span id="btn-emoji" class="btn-emoji" title="Emojis">😃</span>
            </div>
            
        </div>
        <div id="emoji-popup" class="emoji-popup">
            <emoji-picker style="height:200px;"></emoji-picker>
        </div>
        </div>
        
    </div>
    <div id="modal-screen-zoom" class="modal-screen-zoom">
        <div id="close" class="closeZoomIMG" onclick="closezoom()">&times;</div>
        <div class="conten-modal-screen-zoom">
            <img class="content-img-screen" id="view-img-screen">
            <div id="caption"></div>
        </div>   
    </div>
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
                    <span id="selector-objectives" class="selector-option no-select" data-target="#objectives-section">Objetivos Pedagógicos</span>
                    <span id="selector-view-students" class="selector-option no-select active" data-target="#view-students-section">Visualizacion de Estudiantes<div id="badge-list" class="badge-view" style="display:none"></div></span>
                </div>

                

                {{--ACTIVITY INFO--}}
                <div id="activity-info-section" class="activity-info">

                    
                    
                   
                    {{--OBJECTIVES SECTION--}}
                    <section class="objectives-section section " id="objectives-section">
                        <div class="frame-content-left">
                            {{--EXECUTION CONTROLS--}}
                            <div id="execution-controls" class="execution-controls">
                                <button id="btn-run" class="tooltip-bottom" data-tooltip="Ejecutar">
                                    <i class="material-icons">play_arrow</i></button>
                            </div>

                            {{--BLOCKLY PANEL--}}
                            <div id="blockly-panel" class="blockly-panel work-panel frame-panel" style="display: block;">
                                <div id="blockly-wrapper" style="position: absolute;"></div>
                            </div>

                        </div>

                        <div class="frame-content-right">
                            <div id="h-resizer-bar" class="h-resizer-bar">
                                <i class="material-icons abs-center no-select no-event">more_vert</i>
                            </div>

                            {{--OBJECTIVES PANEL--}}
                            <div id="resources-panel" class="objectives-panel frame-panel">




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
                    <section class="objectives-section section active" id="view-students-section">
                        <div class="frame-content-left" style="overflow-y: auto">
                            {{--EXECUTION CONTROLS--}}
                            <div class="activities-list" style="margin-bottom: 1rem; overflow">
                                
                                <hr>
                                <div id="title-list-activities" class="title-list-activities" style="text-align: center; ">
                                    <strong>Lista de Estudiantes</strong><p>Presiona el nombre del estudiante para poder abrir una comuncación con el.</p>
                                </div>
                                @if($type === "Grupal")
                                <div id="content-options-grups" style="text-align: center"><button class="options-grups">Editar Grupos<span class="btn-edit material-icons">edit</span></button></div>
                                @endif
                                <div id="list-activity" class="list-activity" style="text-align: center; ">
                                    
                                </div>
                            </div>
                            

                            {{--BLOCKLY PANEL--}}
                            

                        </div>

                        <div class="frame-content-right">
                            <div id="h-resizer-bar" class="h-resizer-bar">
                                <i class="material-icons abs-center no-select no-event">more_vert</i>
                            </div>

                            {{--OBJECTIVES PANEL--}}
                            <div id="resources-panel" class="objectives-panel frame-panel">
                            </div>
                            <div id="v-resizer-bar" class="v-resizer-bar">
                                <div class="info-status" style="text-align:center; padding:1rem; ">
                                    <h3><b>Dentro de Problock existen 3 estados que definirán la situación en que se encuentra cada uno de los estudiantes. Por lo tanto…</b></h3>
                                    <p>El icono <span class="material-icons" style="color:red;">highlight_off</span> definirá al estudiante como desconectado del desarrollo del problema.</p>
                                    <p>El icono <span class="material-icons" style="color:green;">check_circle</span> definirá al estudiante como conectado, en proceso de desarrollar las actividades que se plantearon.</p>
                                    <p>El icono <span class="material-icons" style="color:orange;">error_outline</span> definirá al estudiante como ausente refiriéndose a que se encuentra con problemas de realizar la actividad, ya que este estado solo cambiará cuando el alumno complete la actividad.</p>


                                    <strong style="display: block;">Estados:</strong>
                                    <div class="status-offline icon-status red" style="display:inline-grid;"><span class="material-icons" style="color:red;">highlight_off</span>Desconectado</div>
                                    <div class="status-online icon-status" style="display:inline-grid;"><span class="material-icons" style="color:green;">check_circle</span>Conectado</div>
                                    <div class="status-absent icon-status" style="display:inline-grid;"><span class="material-icons" style="color:orange;">error_outline</span>Ausente</div>
                                </div>
                                <i class="material-icons abs-center no-select no-event">more_horiz</i>
                            </div>

                            {{--OUTPUT PANEL--}}
                            
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
    <script src="{!! asset('/js/workboard/models/chat.js') !!}"></script>
    <script src="{!! asset('/js/state/models/teamworks.js') !!}"></script>
    
    

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
    <script src="{!! asset('/js/state/views/chatView.js') !!}"></script>
    <script src="{!! asset('/js/state/views/regrups.js') !!}"></script>
    <script src="{!! asset('/js/state/views/objectives_setter.js') !!}"></script>
    <script src="{!! asset('/js/state/views/status.js') !!}"></script>

    {{-- MAIN --}}
    <script src="{!! asset('/js/state/main.js') !!}"></script>


    {{--Inyecta la estructura del toolbox de blockly--}}
    {!! view("workboard/toolbox") !!}

    {!! view("workboard/resources") !!}
    
    <script type="text/template" id="activity-row-template">
        <i class="material-icons" style="vertical-align:bottom">arrow_right</i>
        <span class="activity-name"><%= name %></span>
    </script>
    
    
        
    <script>

        function allowDrop(ev) {
            window.regrups.allowDrop(ev);
        }

        function startDragTeam(ev) {
            window.regrups.startDragTeam(ev);

        }
        function startDragStudent(ev) {
            window.regrups.startDragStudent(ev);
        }
        function dropTeam(ev) {
            window.regrups.dropTeam(ev);
        }
        function dropDelete(ev) {
            window.regrups.dropDelete(ev);
        }
        
        function answerTo(element){
            if(this.$(".r-message-content").is(':visible'))
                this.$('.r-message-content').hide(500);

            var name = $('#'+element.id+'').attr('name');
            var arrayName = name.split(':');
            this.$("#r-message-content").html("");
            this.$(".r-message-content").append('<div class="rmessage"><section class="content-info-reply"><div class="title-info-reply"><span class="title-reply"><h5 style="margin:auto;">Responder mensaje:</h5></span><span class="btn-remove-reply" title="Eliminar mensaje seleccionado">X</span></div></section><section id="section-i" class="section-i"><div id="chat-i-name" class="chat-i-name"><strong>'+arrayName[1]+'</strong></div><div id="chat-i-message" class="chat-i-message">'+arrayName[2]+'</div></section></div></div>');
            window.chatView.setrMessage({id : element.id.substr(10), user_id : arrayName[0], username : arrayName[1], message : arrayName[2]});
            this.$('.r-message-content').show(500);
        }
        function closezoom(){
            $('.modal-screen-zoom').fadeOut('slow');
        }
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