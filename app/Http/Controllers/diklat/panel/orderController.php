<?php

namespace App\Http\Controllers\diklat\panel;

use App\Http\Controllers\Controller;
use App\Model\diklat\order_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class orderController extends Controller
{
    // visitor
    public function index(){
        
        $order = DB::table('event_order')
            ->join('event_itemorder', 'event_itemorder.ORDER_ID', '=', 'event_order.ORDER_ID')
            ->join('events','events.EVENT_ID','=','event_itemorder.EVENT_ID')
            ->where('event_order.USERS_ID', Auth::user()->id)
            ->get();
        
        return view('amodule/diklat/panel/VI_order/index', [
            'order' => $order
        ]);
    }

    // petugas
    public function antrianorder(){
        $order = DB::table('event_order')
            ->join('event_itemorder', 'event_itemorder.ORDER_ID', '=', 'event_order.ORDER_ID')
            ->join('events','events.EVENT_ID','=','event_itemorder.EVENT_ID')
            ->get();

        return view('amodule/diklat/panel/VI_order/antrian', [
            'order' => $order
        ]);
    }

    // petugas
    public function konfirmasiorder($order_id){
        $update = order_model::find($order_id);
        
        if($update == null){
            session()->flash('keyword', 'Alert');
            session()->flash('pesan', 'Order Not Found');
            return redirect('/antrian-order');
        }

        $update->ORDER_STATUS = 'Selesai';
        $update->save();

        session()->flash('keyword', 'TambahData');
        session()->flash('pesan', '#'. $update->ORDER_CODE . ' Berhasil dikonfirmasi');
        return redirect('/antrian-order');
    }

    // visitor & petugas
    public function invoice($order_id) {
        $order = DB::table('event_order')
            ->join('event_itemorder', 'event_itemorder.ORDER_ID', '=', 'event_order.ORDER_ID')
            ->join('events','events.EVENT_ID','=','event_itemorder.EVENT_ID')
            ->where('event_order.ORDER_ID', $order_id)
            ->where('event_order.USERS_ID', Auth::user()->id)
            ->first();

        if($order == null){
            session()->flash('keyword', 'Alert');
            session()->flash('pesan', 'Order Not Found');
            return redirect('/order');
        }

        return view('amodule/diklat/panel/VI_order/invoice', [
            'order' => $order
        ]);
    }

    private function generateRandomCode() {
        $letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'; // Huruf kapital
        $digits = '0123456789'; // Angka
    
        $randomLetters = substr(str_shuffle($letters), 0, 2);
        $randomDigits = substr(str_shuffle($digits), 0, 6);
    
        $randomCode = $randomLetters . $randomDigits;
    
        return $randomCode;
    }
}
