<?php
// app/Services/LoggerService.php
namespace App\Services\Log;

use App\Models\Log;

class LoggerService
{
    public static function logModelChange($modelClass,$id, $action, $before = null, $after = null, $description = null)
    {
        Log::create([
            'user_id'    => auth()->id(),
            'action'     => $action,
            'model_type' => $modelClass,
            'model_id'   => $id,
            'before'     => $before ? json_encode($before) : null,
            'after'      => $after ? json_encode($after) : null,
            'ip_address' => request()->ip(),
            'user_agent' => request()->userAgent(),
            'description'=> $description,
        ]);
    }
}
