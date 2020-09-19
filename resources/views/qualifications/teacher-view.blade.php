@extends('base-template')

@section('title')
    Calificaciones
@stop

@section('head')
    <link href="{!! asset('/resources/css/scores/teacher.css') !!}" rel="stylesheet">

    {{--<script>--}}
    {{--activityGroups = {!! $problem || [] !!};--}}
    {{--</script>--}}
@stop

@section('content')

    <h1 class="exercise-name">{!! $exercise !!}</h1>

    <div class="section-selectors">
        <ul>
            <li class="section-selector active" data-target="#scores-section">Calificaciones</li>
            <li class="section-selector" data-target="#statistics-section">Estadísticas</li>
        </ul>
    </div>

    <div class="sections-container">

        <section class="scores-section section active" id="scores-section">
            <div class="activities-table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>N°</th>
                            <th>Actividad</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($activities as $index => $activity)
                            <tr>
                                <td class="bold">{!! $index !!}</td>
                                <td>{!! $activity !!}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            <div class="scores-table-container">
                <table class="datatable table">
                    <thead>
                        <tr>
                            <th>Nombre Alumno</th>
                            @foreach($activities as $index => $activity)
                                <th>{!! $index !!}</th>
                            @endforeach
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($students as $student)
                            <tr>
                                <td>{!! $student['fullName']!!}</td>
                                @foreach($student['scores'] as $score)
                                    <td>{!! $score !!}%</td>
                                @endforeach
                                <td class="bold">{!! $student['exerciseScore'] !!}%</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </section>

        <section class="statistics-section section" id="statistics-section">
            <div class="widgets-container">
                <div class="stat-widget" id="exercise-score-avg">
                    <span class="stat-widget-title">Promedio Curso</span>

                    <div class="stat-widget-content">
                        {!! $statistics['exerciseScoreAvg'] !!}%
                    </div>
                </div>

                <div class="stat-widget">
                    <span class="stat-widget-title">Calificaciones Más Altas</span>

                    <div class="stat-widget-content">
                        <table>
                            <thead>
                                <tr>
                                    <th>Alumno</th>
                                    <th>Calificación</th>
                                </tr>
                            </thead>
                            <tbody>
                                @for($i = 1; $i < 4 && $i <= count($sortedStudents); $i++)
                                    <tr>
                                        <td>{!! $sortedStudents[count($sortedStudents) - $i]['fullName'] !!}</td>
                                        <td>{!! $sortedStudents[count($sortedStudents) - $i]['exerciseScore'] !!}</td>
                                    </tr>
                                @endfor
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="stat-widget">
                    <span class="stat-widget-title">Calificaciones Más Bajas</span>

                    <div class="stat-widget-content">
                        <table>
                            <thead>
                                <tr>
                                    <th>Alumno</th>
                                    <th>Calificación</th>
                                </tr>
                            </thead>
                            <tbody>
                                @for($i = 0; $i < 3 && $i < count($sortedStudents); $i++)
                                    <tr>
                                        <td>{!! $sortedStudents[$i]['fullName'] !!}</td>
                                        <td>{!! $sortedStudents[$i]['exerciseScore'] !!}</td>
                                    </tr>
                                @endfor
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="stat-widget">
                    <span class="stat-widget-title">Promedio por Actividad</span>

                    <div class="stat-widget-content">
                        <canvas id="scoresChart" width="900" height="400"></canvas>
                    </div>
                </div>
            </div>
        </section>
    </div>
@stop


@section('scripts')

    <script src="{!! asset('/resources/js/vendor/chart.min.js') !!}"></script>

    <script>

        var ctx = document.getElementById('scoresChart');
        var chartData = {
            type : 'bar',
            data : {
                labels : {!! json_encode($activities) !!},
                datasets : [{
                    label : 'Calificación Promedio',
                    data : {!! json_encode($statistics['activitiesScoreAvg']) !!},
                    backgroundColor : [@foreach($activities as $activity) 'rgba(101,1,100, 0.3)', @endforeach],
                    borderColor : [@foreach($activities as $activity) '#650164', @endforeach],
                    borderWidth : 1
                }]
            },
            options : {
                scales : {
                    yAxes : [{
                        ticks : {
                            beginAtZero : true
                        }
                    }]
                }
            }
        };

        var chart = new Chart(ctx, chartData);

    </script>

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

    {{-- MAIN --}}
    <script src="{!! asset('/resources/js/scores/teacher/main.js') !!}"></script>



@stop