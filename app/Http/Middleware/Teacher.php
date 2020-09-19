<?php

namespace CSLP\Http\Middleware;

use Auth;
use Closure;

class Teacher
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
        if(Auth::user()->type != 'teacher')
            return redirect('/');

        return $next($request);
    }
}
