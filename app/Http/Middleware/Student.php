<?php

namespace CSLP\Http\Middleware;

use Auth;
use Closure;

class Student {
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next) {
        if(Auth::user()->type != 'student')
            return redirect('/');

        return $next($request);
    }
}
