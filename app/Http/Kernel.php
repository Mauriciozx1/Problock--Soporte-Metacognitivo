<?php

namespace CSLP\Http;

use Illuminate\Foundation\Http\Kernel as HttpKernel;

class Kernel extends HttpKernel
{
    /**
     * The application's global HTTP middleware stack.
     *
     * @var array
     */
    protected $middleware = [
        \Illuminate\Foundation\Http\Middleware\CheckForMaintenanceMode::class,
        \CSLP\Http\Middleware\EncryptCookies::class,
        \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
        \Illuminate\Session\Middleware\StartSession::class,
        \Illuminate\View\Middleware\ShareErrorsFromSession::class,
    ];

    /**
     * The application's route middleware.
     *
     * @var array
     */
    protected $routeMiddleware = [
        'auth' => \CSLP\Http\Middleware\Authenticate::class,
        'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
        'guest' => \CSLP\Http\Middleware\RedirectIfAuthenticated::class,
        'csrf' => \CSLP\Http\Middleware\VerifyCsrfToken::class,

        'admin' => \CSLP\Http\Middleware\Admin::class,
        'student' => \CSLP\Http\Middleware\Student::class,
        'teacher' => \CSLP\Http\Middleware\Teacher::class,
        'researcher' => \CSLP\Http\Middleware\Researcher::class,
    ];
}
