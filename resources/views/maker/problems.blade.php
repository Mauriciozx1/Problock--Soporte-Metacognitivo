@extends('base-template')

@section('title')
    Problemas
@stop

@section('head')
    <link href="{!! asset('/css/maker/exercises.css') !!}" rel="stylesheet">

    <script>
        
        courses = {!!$courses!!};
        @if($type === 'teacher')
            students = {!! $students !!};
        @endif
    </script>
@stop

@section('content')

    <div id="no-courses" class="no-courses">
        <span>No se encuentra inscrito en ningún curso</span>
        <br>
        <i class="material-icons">chrome_reader_mode</i>
    </div>

    <div id="courses-container" class="courses-container">
        <div id="exercises-maker-container" class="exercises-maker-container">
            <div class="courses-aside-menu">
                <ul id="courses-list">

                </ul>
            </div>


            <div class="sections-container">
                @if($type === 'teacher')
                    <div class="section-selectors">
                        <ul>
                            <li class="section-selector active" data-target="#exercises-panel">Problemas</li>
                            <li class="section-selector" data-target="#students-panel">Estudiantes</li>
                        </ul>
                    </div>
                @endif
                {{-- PROBLEMS PANEL --}}
                <section id="exercises-panel" class="exercises-panel section active">


                    @if($type === 'teacher')
                        <div>
                            <button class="btn-yellow" id="btn-add">
                                <i class="material-icons" style="vertical-align:bottom">add_circle_outline</i> Crear Problema
                            </button>
                        </div>
                    @endif
                    <div></div>

                    <div id="exercises-container" class="exercises-container">

                    </div>

                    @if($type === 'teacher')
                        {{--EDITOR MODAL--}}
                        <div id="edit-modal" class="editor-modal">
                            <div class="modal-fade"></div>
                            <div class="modal">
                                <div class="modal-header">
                                    <button class="btn-delete btn-red">Eliminar Problema</button>
                                </div>
                                <div class="modal-body">
                                <div class="gruop-section">
                                    <span class="bold">Tipo de Problema</span>
                                    <hr>
                                    <input type="text" id='text-type-problem' class="text-type-problem" id="frm-type-problem" readonly="readonly" disabled="disabled" >
                                    <div class="input-teamworks">
                                        <p>Seleccione el tipo de problema que desea crear:</p>
                                        <select id="select-type-problem" class="select-type-problem" onChange="javascript:selectType(this.value);">
                                            <option disabled selected>Selecciona una opción</option>
                                            <option value="Individual">Individual</option> 
                                            <option value="Grupal">Trabajo grupal</option>  
                                        </select>
                                    </div>                
                                    <div class="permiso-problem-t" id="permiso-problem-t" style="display: none;">
                                    <hr>
                                    <span class="bold">Establecer permisos</span>
                                        <p>Esta opcion te permitira establecer de forma automatica la creación de nuevos grupos de trabajo cada vez que añadas a estudiantes al curso.</p>
                                        <select id="select-permise-problem" class="select-permise-problem">
                                            <option disabled selected>¿Deseas enlazar nuevos estudiantes a futuro?</option>
                                            <option value="true">Activar</option> 
                                            <option value="false">Desactivar</option>  
                                        </select>
                                    </div>
                                        <hr>
                                    <div>
                                        <input type="text" class="frm-name" id="frm-name" placeholder="Nombre del Problema">
                                    </div>
                                    <div>
                                        <textarea id="frm-description" cols="30" rows="10" placeholder="Agregue una descripción al problema..."></textarea>
                                    </div>
                                    <hr>
                                    <div class="timestamp-section">
                                        <span class="bold">Inicio</span>
                                        <label for="frm-idate">Fecha: </label><input id="frm-idate" type="date">
                                        <label for="frm-itime">Hora: </label><input id="frm-itime" type="time">
                                    </div>
                                    <hr>
                                    <div class="timestamp-section">
                                        <span class="bold">Cierre</span>
                                        <label for="frm-fdate">Fecha: </label><input id="frm-fdate" type="date">
                                        <label for="frm-ftime">Hora: </label><input id="frm-ftime" type="time">
                                    </div>
                                </div>
                                <hr>
                                <div class="modal-footer">
                                    <button class="btn-cancel btn-gray">Cancelar</button>
                                    <button class="btn-save btn-green">Guardar</button>
                                </div>
                            </div>
                        </div>
                    @endif
                </section>

                {{-- STUDENTS PANEL --}}
                @if($type === 'teacher')
                    <section id="students-panel" class="students-panel section">
                        <div class="table-container">
                            <table>
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Nombre</th>
                                        <th>Apellidos</th>
                                        <th>Email</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="students-link-tbody">

                                </tbody>
                            </table>
                        </div>
                    </section>
                @endif
            </div>

        </div>
    </div>


@stop


@section('scripts')

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
    <script src="{!! asset('/js/exercises/models/exercise.js') !!}"></script>
    <script src="{!! asset('/js/exercises/models/course.js') !!}"></script>

    {{-- COLLECTIONS --}}
    <script src="{!! asset('/js/exercises/collections/exercises.js') !!}"></script>
    <script src="{!! asset('/js/exercises/collections/courses.js') !!}"></script>

    {{-- VIEWS --}}
    <script src="{!! asset('/js/exercises/views/exercise.js') !!}"></script>
    <script src="{!! asset('/js/exercises/views/course.js') !!}"></script>
    <script src="{!! asset('/js/exercises/views/modal.js') !!}"></script>

    @if($type === 'teacher')
        <script src="{!! asset('/js/exercises/models/student.js') !!}"></script>
        <script src="{!! asset('/js/exercises/collections/students.js') !!}"></script>
        <script src="{!! asset('/js/exercises/views/student_link_row.js') !!}"></script>

    @endif


    {{-- MAIN --}}
    <script src="{!! asset('/js/exercises/main.js') !!}"></script>



    <script type="text/template" id="course-template">
        <i class="material-icons" style="vertical-align:bottom">arrow_right</i>
        <span class="course-code"><%= code %></span> - <span class="course-name"><%= name %></span>
    </script>

    <script type="text/template" id="student-link-row-template">
        <td><img src="{!! url('/images/no-profile.png') !!}" alt=""></td>
        <td><%= name %></td>
        <td><%= flastname %> <%= mlastname %></td>
        <td><%= email %></td>
        <td>
            <button class="btn-blue btn-link">Enlazar</button>
            <button class="btn-red btn-unlink">Desenlazar</button>
        </td>
    </script>
    <script type="text/template" id="exercise-template">
        @if($type === 'teacher')
            <span class="btn-edit material-icons">edit</span>
            <a href="{!! url('/teacher/view/<%= id %>') !!}"><span class="btn-viewP material-icons">visibility</span></a>
        @endif
        <div class="exercise-name">
            <%= name %>
        </div>
        <hr>
        <div class="exercise-type-problem">
            <% if (type_problem === 'Grupal'){ %>
                <h3>Problema: <%= type_problem %></h3>
                    <% }else{ %>
                        <h3>Problema: <%= type_problem %></h3>
                    <% }%>
        </div>
        <div class="exercise-description">
            <%= description %>
        </div>
        <hr>
        <div class="exercise-timestamps">
            <span>Inicio: </span><span><%= open_at %></span>
            || <span>Cierre: </span><span><%= close_at %></span>
        </div>
        <hr>
        <div class="exercise-footer">
            @if($type === 'teacher')
                <a class="btn-blue" href="{!! url('/maker/activities/<%= id %>') !!}">Editar Actividades</a>
                <%if(type_problem === 'Individual'){ %>
                <a class="btn-green" href="{!! url('/teacher/scores/<%= id %>') !!}">Ver Calificaciones</a>
                <% }%>

                <% if (type_problem === 'Grupal'){ %>
                    <a class="btn-green" href="{!! url('/teacher/steamwork/<%= id %>') !!}">Ver Calificaciones</a>
                    <a class="btn-red" href="{!! url('/teacher/teamwork/<%= id %>') !!}">Grupos</a>
                <% }%>
            @endif
            @if($type === 'student')
                <% if (open_at < "{!! $currentTimestamp !!}") { %>
                    <a class="btn-green" href="{!! url('/student/scores/<%= id %>') !!}">Ver Calificaciones</a>
                    <span class="problem-score"><%= avgScore %>%</span>
                <% } else{ %>
                <a></a>
                <% }%>

                <% if (open_at < "{!! $currentTimestamp !!}" && close_at > "{!! $currentTimestamp !!}") { %>
                    <a class="btn-blue" href="{!! url('/workboard/view/<%= id %>') !!}">Realizar actividad</a>
                <% } %>

            @endif
        </div>
    </script>
    


@stop