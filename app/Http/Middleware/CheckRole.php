<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckRole
{
    public function handle($request, Closure $next, ...$roles)
    {
        $user = $request->user();

        if (!$user) {
            abort(401);
        }

        // Allow if user's role key is in allowed roles
        if (!in_array($user->role?->name, $roles)) {
            abort(403, 'Unauthorized');
        }

        return $next($request);
    }
}
