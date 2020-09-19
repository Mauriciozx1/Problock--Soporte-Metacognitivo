@extends('base-template')

@section('title')
@stop

@section('head')
    <link href="{!! asset('/resources/css/admin/admin-panel.css') !!}" rel="stylesheet">

    <script>
        window.data = {};
        window.data.courses = {!! $courses !!};
        window.data.teachers = {!! $teachers !!};
    </script>
@stop


@section('content')

    <div class="section-selectors">
        <ul>
            <li class="section-selector active" data-target="#teachers-section">Profesores</li>
            <li class="section-selector" data-target="#courses-section">Cursos</li>
        </ul>
    </div>

    <div class="sections-container">

        <section class="teachers-section section active" id="teachers-section">
            <div class="controls-container">
                <button class="btn-blue" id="addTeacher"><i class="material-icons">add_circle_outline</i>Agregar Profesor</button>
            </div>
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
                    <tbody id="teachers-tbody">

                    </tbody>
                </table>
            </div>

            <div class="teacher-modal" id="teacher-modal">
                <div class="modal-fade"></div>
                <div class="modal">
                    <div class="modal-header">
                        <h3>Agregar Profesor</h3>
                    </div>
                    <div class="modal-body">
                        @include('auth/signup-form', ['type' => 'teacher'])
                    </div>

                </div>
            </div>
        </section>

        <section class="courses-section section" id="courses-section">
            <div class="courses-aside-menu">
                <ul id="courses-list">

                </ul>
                <div id="addCourse" class="add-course">
                    <span>+</span>
                </div>
            </div>
            <div>
                <div class="controls-container">
                    <input id="frm-code" type="text" placeholder="Codigo Curso">
                    <input id="frm-course-name" type="text" placeholder="Nombre Curso">
                    <button class="btn-blue" id="saveCourse"><i class="material-icons">add_circle_outline</i>Agregar Curso</button>
                    <button class="btn-red" id="deleteCourse">Eliminar curso</button>
                </div>
                <div class="teacher-selector-container">
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
                            <tbody id="teachers-link-tbody">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </div>
@stop


@section('scripts')

    <script src="{!! asset('/resources/js/admin/models/teacher.js') !!}"></script>
    <script src="{!! asset('/resources/js/admin/models/course.js') !!}"></script>

    <script src="{!! asset('/resources/js/admin/collections/teachers.js') !!}"></script>
    <script src="{!! asset('/resources/js/admin/collections/courses.js') !!}"></script>

    <script src="{!! asset('/resources/js/admin/views/teacher_row.js') !!}"></script>
    <script src="{!! asset('/resources/js/admin/views/teacher_link_row.js') !!}"></script>
    <script src="{!! asset('/resources/js/admin/views/course_row.js') !!}"></script>
    <script src="{!! asset('/resources/js/admin/views/courses_panel.js') !!}"></script>
    <script src="{!! asset('/resources/js/admin/views/teachers_panel.js') !!}"></script>
    <script src="{!! asset('/resources/js/admin/views/teacher_modal.js') !!}"></script>

    <script src="{!! asset('/resources/js/admin/main.js') !!}"></script>

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

    <script type="text/template" id="teacher-row-template">
        <td><img src="{!! url('/resources/images/no-profile.png') !!}" alt=""></td>
        <td><%= name %></td>
        <td><%= flastname %> <%= mlastname %></td>
        <td><%= email %></td>
        <td><span class="btn-delete">X</span></td>
    </script>

    <script type="text/template" id="teacher-link-row-template">
        <td><img src="{!! url('/resources/images/no-profile.png') !!}" alt=""></td>
        <td><%= name %></td>
        <td><%= flastname %> <%= mlastname %></td>
        <td><%= email %></td>
        <td>
            <button class="btn-blue btn-link">Enlazar</button>
            <button class="btn-red btn-unlink">Desenlazar</button>
        </td>
    </script>


    <script type="text/template" id="course-row-template">
        <i class="material-icons" style="vertical-align:bottom">arrow_right</i>
        <span class="course-code"><%= code %></span> - <span class="course-name"><%= name %></span>
    </script>

@stop