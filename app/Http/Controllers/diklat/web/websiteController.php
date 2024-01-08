<?php

namespace App\Http\Controllers\diklat\web;

use App\Http\Controllers\Controller;
use App\Model\diklat\event_model;
use App\Model\diklat\itemorder_model;
use App\Model\diklat\order_model;
use App\users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Ramsey\Uuid\Uuid;

class websiteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function beranda()
    {
        $event = event_model::where('EVENT_ACTIVE', 'Publish')->latest('created_at')->take(3)->get();

        return view('amodule/diklat/web/beranda', [
            'event' => $event
        ]);
    }

    public function aboutus()
    {
        return view('amodule/diklat/web/aboutus', [
            '' => ''
        ]);
    }

    public function agenda()
    {
        return view('amodule/diklat/web/agenda', [
            '' => ''
        ]);
    }

    public function kelas()
    {
        $event = event_model::where('EVENT_ACTIVE', 'Publish')->get();

        return view('amodule/diklat/web/kelas', [
            'event' => $event
        ]);
    }

    public function infokelas($slug, $id)
    {
        // dd($slug, $id);
        $event = event_model::where('EVENT_SLUG', $slug)->first();

        return view('amodule/diklat/web/infokelas', [
            'slug' => $slug,
            'id' => $id,
            'kelas' => $event,

        ]);
    }

    public function cokelas($slug, $id)
    {
        $event = event_model::where('EVENT_SLUG', $slug)->first();

        return view('amodule/diklat/web/cokelas', [
            'slug' => $slug,
            'id' => $id,
            'kelas' => $event,
        ]);
    }

    public function store_cokelas(Request $request)
    {   
        $event_id = $request->id;
        $event_slug = $request->slug;

        // 1. validasi data upload file bukti--------------------------------------------------------------------------------------------
        $rule = [
            'bukti' => ['required', 'max:2048', 'mimes:jpeg,jpg,png'],
        ];

        $pesan = [
            'bukti.required' => 'Kolom bukti harus diisi.',
            'bukti.max' => 'Kolom ini maksimal :max .',
            'bukti.mimes' => 'Kolom ini harus berupa file dengan ekstensi jpeg, jpg, png.',
        ];

        $validator = Validator::make($request->all(), $rule, $pesan);
        if ($validator->fails()) {
            return redirect( url('checkout-kelas/'.$event_slug.'/' . $event_id) )->withErrors($validator)->withInput($request->all());
        }
        // ===============================================================================================================================

        // 2. tarik data event------------------------------------------------------------------------------------------------------------
        // Jika pesan error gagal pilih event. berarti Data Event tidak ditemukan
        $event = event_model::where('EVENT_ID', $event_id)->first();
        if($event == null){
            session()->flash('keyword', 'Alert');
            session()->flash('pesan', 'Event Not Found');
            return redirect('/checkout-kelas/'.$event_slug.'/' . $event_id);
        }
        // ===============================================================================================================================
        
        // 3. upload file bukti-----------------------------------------------------------------------------------------------------------
        $filename = null;
        if ($request->file('bukti')) {
            $file         = $request->file('bukti'); 
            $path         = $file->store('bukti_order', 'local'); // proses upload file
            $filename = basename($path);
        }
        // ===============================================================================================================================

        // 4. buat order
        $order = New order_model();
        $order->USERS_ID = Auth::user()->id;
        $order->ORDER_CODE = $this->generadeCode();
        $order->ORDER_TOTAL = $event->EVENT_HARGA - $event->EVENT_DISKON;
        $order->ORDER_BUKTI = $filename;
        $order->ORDER_STATUS = 'Menunggu Konfirmasi';
        $order->save();
        // 5. buat item order
        $itemorder = New itemorder_model();
        $itemorder->ORDER_ID = $order->ORDER_ID;
        $itemorder->EVENT_ID = $event_id;
        $itemorder->ITEMORDER_JUDUL_DIPILIH = $event->EVENT_JUDUL;
        $itemorder->ITEMORDER_HARGA_DIPILIH = $event->EVENT_HARGA;
        $itemorder->ITEMORDER_DISKON_DIPILIH = $event->EVENT_DISKON;
        $itemorder->save();

        session()->flash('keyword', 'TambahData');
        session()->flash('pesan', 'Berhasil Checkout Event. Silahkan untuk menunggu verifikasi pembayaran dari Operator');
        return redirect('/order');

    }

    private function generadeCode() {
        $letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'; // Huruf kapital
        $digits = '0123456789'; // Angka
    
        $randomLetters = substr(str_shuffle($letters), 0, 2);
        $randomDigits = substr(str_shuffle($digits), 0, 6);
    
        $randomCode = $randomLetters . $randomDigits;
    
        return $randomCode;
    }
}
