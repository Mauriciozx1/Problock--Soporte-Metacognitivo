<?php

namespace CSLP\Http\Middleware;

use Closure;
use \Auth;
class Admin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(Auth::user() -> type != 'admin')
            return redirect('/');

        return $next($request);
    }
}
