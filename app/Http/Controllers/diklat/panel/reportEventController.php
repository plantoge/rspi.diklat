<?php

namespace App\Http\Controllers\diklat\panel;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class reportEventController extends Controller
{
    public function index(){
        $getReport = null;

        return view('amodule/diklat/panel/OP_report/index', [
            'getReport' => $getReport
        ]);
    }

    public function filter(Request $request){
        $split = explode(' / ', $request->daterange);
        $tgl_awal = $split[0];
        $tgl_akhir = $split[1];

        $getReport = DB::table('event_order')
            ->join('users','users.id','=','event_order.USERS_ID')
            ->join('event_itemorder', 'event_itemorder.ORDER_ID', '=', 'event_order.ORDER_ID')
            ->join('events','events.EVENT_ID','=','event_itemorder.EVENT_ID')
            ->whereBetween(DB::raw('DATE(event_order.created_at)'), [$tgl_awal, $tgl_akhir])
            ->get();

        return view('amodule/diklat/panel/OP_report/index', [
            'getReport' => $getReport
        ]);
    }
}
