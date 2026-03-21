<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\Session\Session;
use Illuminate\Support\Facades\Log;

class RootController extends Controller
{
    public function __construct(){

        $session = new Session();

        if(!$session->has('current_user'))
            return redirect('/login');

    }
    public function DoDatatable($query,$request,$callback = null){

    $callback = $callback ?: function () {};

    $length = $request->get('length') ?: 10;
    $offset = $request->get('start') ?: 0;

    $orderColumnIndex = intval($request->get('order')[0]['column']);
    $orderColumn = $request->get('columns')[$orderColumnIndex]['name'] ?? 'id';
    $dir = $request->get('order')[0]['dir'] ?? 'desc';

    $search = addslashes($request->get('search')['value'] ?? '');

    // بناء فلتر البحث
    $sfilter = '';
    foreach ($request->get('columns') as $col) {
        $col = (object)$col;
        if ($col->searchable === "false") continue;
        $sfilter .= ($sfilter ? ' OR ' : ' ') . "{$col->name} LIKE '%$search%'";
    }

    $query_str = "SELECT * FROM ($query) t WHERE 1=1" . ($sfilter ? " AND ($sfilter)" : "");

    // جلب البيانات مع pagination
    $queryResult = DB::select($query_str . " ORDER BY $orderColumn $dir LIMIT $length OFFSET $offset");

    // جلب العدد الكلي
    $totalResult = DB::select("SELECT COUNT(*) as total FROM ($query) t");
    $recordsTotal = $totalResult[0]->total;

    // تطبيق callback
    foreach ($queryResult as $i => $row) {
        $callback($i, $row, $queryResult);
    }

    // تحويل objects إلى arrays
    $data = array_map(function($row){ return (array)$row; }, $queryResult);

    return (object)[
        'draw' => $request->get('draw') ?: 0,
        'recordsTotal' => $recordsTotal,
        'recordsFiltered' => $recordsTotal,
        'data' => $data,
    ];
}

    public function generateNumber()
    {
        $lastNumber = Order::where('custom_number', 'like', 'crm_%')
            ->selectRaw("MAX(CAST(SUBSTRING(custom_number, 5) AS UNSIGNED)) as max_number")
            ->value('max_number');

        $next = $lastNumber ? $lastNumber + 1 : 1;

        return 'crm_' . str_pad($next, 6, '0', STR_PAD_LEFT);
    }

}
