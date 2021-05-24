<!DOCTYPE html>
<html>
    <html lang="en">
        <meta charset="UTF-8">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>@yield('title')</title>
        {{-- Permite usar los iconos de google --}}
        <link rel="shortcut icon" type="image/png" href="{{ asset('/images/favicon.png') }}">
        <link rel="shortcut icon" sizes="192x192" href="{{ asset('/images/favicon.png') }}">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        @csrf
        <link href="{!! asset('/css/vendor/normalize.min.css') !!}" rel="stylesheet">
        
        <link href="{!! asset('/css/base-template.css') !!}" rel="stylesheet">
        <link href="{!! asset('/css/vendor/introjs.css') !!}" rel="stylesheet">
        
        
        @yield('head')

    </head>
    <body>
    
        <header class="header">
        
            <section class="header-left header-section">
                <div class="institution-logo-container">
                    <img src="{!! asset('/images/logo-unab.png') !!}" alt="" class="institution-logo">
                </div>
            </section>

            <section class="header-center header-section">
                <div class="logo-container">
                    <img src="{!! asset('/images/logo.png') !!}" alt="">
                </div>
            </section>

            <section class="header-right header-section">
                @if(Auth::check())
                    <div id="current-user" class="current-user no-select">
                        <div class="current-user-image">
                            <img src="{!! asset('/images/no-profile.png') !!}" alt="">
                        </div>
                        <div class="current-user-name">
                            <span>{!! Auth::user()->full_name !!}</span>
                        </div>
                    </div>
                    <div id="profile-header-menu" class="profile-header-menu">
                        <ul>
                            <li><a href="#">Ver Perfil</a></li>
                            <li><a href="{!! url('/logout') !!}">Cerrar Sesión</a></li>
                        </ul>
                    </div>
                @endif
            </section>

        </header>
        
        <div class="content-container">
            @yield('content')
            </div>
        <footer>

        </footer>
    </body>

    <script>
        window.basePath = "{!! url('/') !!}";
    </script>
    
    {{--<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>--}}
    <script src="{!! asset('/js/vendor/jquery-2.2.3.min.js') !!}"></script>
    {{--Validador de Formularios PARSLEY--}}
    <script src="{!! asset('/js/vendor/parsley/parsley.js') !!}"></script>
    <script src="{!! asset('/js/vendor/parsley/lang/es.js') !!}"></script>

    <!-- Backbone y Underscore -->
    <script src="{!! asset('/js/vendor/underscore.js') !!}"></script>
    <script src="{!! asset('/js/vendor/backbone.js') !!}"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/intro.js/2.2.0/intro.min.js"></script>
    {{--<script src="{!! asset('/js/vendor/intro.min.js') !!}"></script>--}}

    <!-- Iniciador de Variables Globales de la Aplicacion -->
    <script src="{!! asset('/js/init.js') !!}"></script>
    <script src="{!! asset('/js/utilities/flashMessages.js') !!}"></script>
    

    <script>
        
        $(document).ready(function(){
            $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
            var profileMenu = $('#profile-header-menu');
            $('#current-user').on('click',function(){
                profileMenu.slideToggle('fast');
            });

            $('body').on('click', function(){
                $('.auto-slide-up').slideUp();
                $('.auto-hide.visible').removeClass('visible');
            });

        });
    </script>

    @yield('scripts')
</html>