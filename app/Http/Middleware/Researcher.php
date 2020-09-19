<?php

namespace CSLP\Http\Middleware;

use Auth;
use Closure;

class Researcher
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
        if(Auth::user()->type != 'researcher')
            return redirect('/');
        return $next($request);
    }
}
