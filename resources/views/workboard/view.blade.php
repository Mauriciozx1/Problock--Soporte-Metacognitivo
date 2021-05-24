@extends('base-template')

@section('title')
    WorkBoard
@stop

@section('head')
    <link href="{!! asset('/css/workboard/workboard.css') !!}" rel="stylesheet">
    <link href="{!! asset('/css/vendor/prettify.css') !!}" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css">
    <script src="{!! asset('/js/vendor/html2canvas.min.js') !!}"></script>
    <script type="module" src="https://cdn.jsdelivr.net/npm/emoji-picker-element@^1/index.js"></script>

    <script>
        activityGroups = {!! $problem !!};
        scores = {!! $scores !!};
        @if($type === 'Grupal')
            teamworks = {!! $teamwork !!};
            problemid = {!! $problemid !!};
            teamworkid = {!! $teamworkid !!};
            activitiId = {!! $activityId !!};
            usercount = {!! $userscount !!};
            studentUser = {!! $studentUser !!};

        @endif
    </script>
   
@stop

@section('content')
    {{--VOTE--}}
    @if($type == 'Grupal')
    
    @endif
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
    {{--QUESTION--}}
    <div id="modal-question" class="modal-question">
        <div class="modal-content-question">
            
            <div class="modal-question-title">
            </div>
            <div class="modal-reply">
        
            </div>
            <div class="modal-button-question">
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
            <div id="modal-content" class="modal-content">
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
    <div id="app">
    <button id="btn-tour" class="btn-tour btn-blue">Tour</button>
        @if($type == 'Grupal')
        <div id="wait-group" class="wait-group">  
            <div class="content-wait" >
                <strong>Esperando a integrantes del grupo, para comenzar actividad.</strong>
                <div class="grup-wait">
                    <div class="content-grup">
                        <div class="loader"></div>
                    </div>
                    <div class="content-info-wait">
                    {{-- info wait --}}
                    </div>
                    
                </div>
            </div>
            <div class="buttons-wait">
                <div class="button-next-activity">
                    <button id="button-view-menu" class="button-view-menu btn-green">Abrir Menu de actividades </button>
                </div>
            </div>
        </div>
        <div id="wait-finish" class="wait-finish">
                <div class="content-wait-finish" >  
                    <strong>Esta es la seccion de votacion para finalizar la actividad</strong>
                    <h4>Integrantes del grupo</h4>
                    <div class="content-voted">
                        <div id="list-vote" class="list-vote">
                            <div id="list-content-vote" class="list-content-vote"></div>
                        </div>
                    </div>
                    <div class="result-activity">
                        <section class="section-result-activity">
                            <h2>Tienen un total de <span class="obtained-points"></span> puntos con este desarrollo</h2>
                            <img id="view-img-screen-finish" class="view-img-screen-finish">
                        </section>
                    </div>
                    <div class="button-voted">
                        <button id="false-voted" class="false-voted btn-red">Votar No</button>
                        <div class="loader-vote"></div>
                        <button id="true-voted" class="true-voted btn-green">Votar Si</button>
                        <button id="btn-finish-vote-accept" class="btn-finish-vote-accept btn-green" style="{display:none;}" >Finalizar actividad</button>
                        <button id="btn-finish-vote-cancel" class="btn-finish-vote-cancel btn-red" style="{display:none;}">Volver</button>
                    </div>
                </div>   
        </div>
        <div id="screen" class="screen" style="display:none;">
            <div class="popup-paret">
                <button id="btn-live-lider" class="btn-live-lider">
                    <div class="badge-popup-button-parent" style="">{{--Notificación--}}</div>
                        <span class="material-icons">group</span>
                </button>
                <div class="button-popup-share" id="button-popup-share" style="display:none;">
                    <button  id="btn-view-share" class="btn-view-share">
                        <div class="badge-view-share" style="">{{--Notificación--}}</div>
                        <i class="material-icons"> live_tv </i>
                    </button>
                </div>
                <div class="button-popup-screen" id="button-popup-screen" style="display:none;">
                    <button id="btn-impr" class="btn-impr">
                        <span class="material-icons">library_add</span>
                    </button>
                </div>
            </div>
            <div class="screen-popup" id="screen-popup" style="display:none;">
                <div class="section-container" >
                    <section class="lider-title">
                    </section>
                    <section class="description-screen-share">
                        <strong>Comparte tu desarrollo con los integrantes del grupo.</strong>
                        <strong>Aquí podras visualizar el trabajo que desarrolla tu grupo.</strong>
                    </section>
                    <section class="section-screen-team">
                        <section class="content-section-screen-team">   
                            {{--secccion de fotos compartidas--}}
                        </section>
                    </section>
                </div> 
            </div>
        </div>
        <div id="modal-screen-zoom" class="modal-screen-zoom" >
                <div id="close" class="closeZoomIMG" onclick="closezoom()">&times;</div>
                <div class="conten-modal-screen-zoom">
                    <img class="content-img-screen" id="view-img-screen">
                    <div id="caption"></div>
                </div>   
            </div>
        {{--CHAT Student a Student--}}
        <div id="chat" class="chat">
            
            <button id="btn-chat-popup" class="btn-chat" > 
                <div class="badge" >{{--notificationChat--}}</div>
                <i class="material-icons"> comment </i>
            </button>
            <div class="content-chat">
            <div id="chat-popup" class="chat-popup">
                <div id="text-on" class="text-on" style="text-align:center;, max-width:auto;">
                    
                        
                </div>
                
                    <div class="chat-user-active">
                        <div class="intergers-list" >
                        
                        </div>
                    </div>      
              
                <div class="chat-body">
                    <div class="title-chat"><strong>Mensajes</strong></div>
                        <div id="list-unstyled" class="list-unstyled" style="overflow-y:scroll; height:300px;" >
                            <div id="p-2" class="p-2" >
                            <div class="content-messages"></div>
                            </div>
                        </div>
                        <div class="text-writing">
                            <span class="text-muted" ></span>
                        </div>
                        
                    
                </div>
                <div id="r-message-content" class="r-message-content">
                </div>
                
                <div class="text-chat">
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
        
        @endif
        
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
            <div id="buttons-tour" class="buttons-tour">
            <div class="buttons" id="buttons">
            
            </div>

            </div>
            

        </div>
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
                {{--SCREEN PANEL--}}
                
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
    
    {{--<script src="{!! asset('/js/workboard/fixed-configuration.js') !!}"></script>--}}
    <script src="{{ asset('js/app.js') }}" defer></script>
    {{--LIBREIRIA BLOCKLY Y DEPENDENCIAS--}}
    <script src="{!! asset('/js/vendor/blockly/blockly_compressed.js') !!}"></script>
    <script src="{!! asset('/js/vendor/blockly/javascript_compressed.js') !!}"></script>
    <script src="{!! asset('/js/vendor/blockly/blocks_compressed.js') !!}"></script>
    <script src="{!! asset('/js/vendor/blockly/msg/es.js') !!}"></script>

    <script src="{!! asset('/js/vendor/acorn_interpreter.js') !!}"></script>
    <script src="{!! asset('/js/vendor/prettify.js') !!}"></script>


    {{--  MODELS  --}}
    <script src="{!! asset('/js/workboard/models/activity.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/activity_group.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/code_formatter.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/code_tester.js?2') !!}"></script>
    <script src="{!! asset('/js/workboard/models/js_interpreter.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/resource.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/IMS-LD_parser.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/waiting.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/vote.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/screen.js') !!}"></script>
    <script src="{!! asset('/js/workboard/models/chat.js') !!}"></script>
    
    

    {{-- COLLECTIONS --}}
    <script src="{!! asset('/js/workboard/collections/activities.js') !!}"></script>
    <script src="{!! asset('/js/workboard/collections/activity_groups.js') !!}"></script>
    
    
    {{-- VIEWS --}}
    <script src="{!! asset('/js/workboard/views/activity_row.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/activity_group.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/blockly_panel.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/code_panel.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/console.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/finish_modal.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/frame_header.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/resource_modal.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/workboard.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/voteView.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/screenView.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/chatView.js') !!}"></script>
    <script src="{!! asset('/js/workboard/views/questionView.js') !!}"></script>
    
    
    {{-- MAIN --}}
    
   <script>
   //Funcion para crear un zoom a la imagen recibida en "screen-popup"
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
        function zoomimg(img){
            $('#view-img-screen').attr('src',img.src);
            //
            $('.modal-screen-zoom').fadeIn('slow');
        }
        function closezoom(){
            $('.modal-screen-zoom').fadeOut('slow');
        }
   </script>
    <script src="{!! asset('/js/workboard/main.js') !!}"></script>

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


