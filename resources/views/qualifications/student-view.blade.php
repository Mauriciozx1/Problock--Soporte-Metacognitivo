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

    <h1 class="exercise-name">{!! $name !!}</h1>

    {{--<div class="section-selectors">--}}
        {{--<ul>--}}
            {{--<li class="section-selector active" data-target="#scores-section">Calificaciones</li>--}}
            {{--<li class="section-selector" data-target="#statistics-section">Estadísticas</li>--}}
        {{--</ul>--}}
    {{--</div>--}}

    <div class="sections-container">

        <section class="scores-section section active" id="scores-section">
            <div class="activities-table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>N°</th>
                            <th>Actividad</th>
                            <th>Puntaje</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($activities as $index => $activity)
                            <tr>
                                <td class="bold">{!! $index !!}</td>
                                <td>{!! $activity['name'] !!}</td>
                                <td>{!! $activity['score'] !!}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div>
                <h1 style="color:purple; text-align: center">Promedio: {!! $avgScore !!}%</h1>
            </div>

        </section>


    </div>
@stop


@section('scripts')

@stop