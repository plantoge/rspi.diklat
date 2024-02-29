<?php

namespace App\Http\Controllers\diklat\web;

use App\Http\Controllers\Controller;
use App\Model\diklat\berita_model;
use App\Model\diklat\event_model;
use App\Model\diklat\gambar_model;
use App\Model\diklat\infokontak_model;
use App\Model\diklat\itemorder_model;
use App\Model\diklat\keunggulan_model;
use App\Model\diklat\order_model;
use App\Model\diklat\testimony_model;
use App\users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Ramsey\Uuid\Uuid;
use Telegram\Bot\Laravel\Facades\Telegram;

class websiteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function beranda()
    {
        $testimony = testimony_model::all();
        $event     = event_model::where('EVENT_ACTIVE', 'Publish')->latest('created_at')->take(3)->get();
        $informasi = infokontak_model::where('INFO_ID', '001')->first();
        $gambar    = gambar_model::where('GAMBAR_KATEGORI', 'Beranda')->get();
        $pointplus = keunggulan_model::all();
        $blog = DB::table('berita')
            ->select('berita.*', 'users.*')
            ->selectRaw('berita.created_at AS BERITA_CREATED_AT')
            ->join('users','users.id', '=', 'berita.USERS_ID')
            ->where('berita.BERITA_STATUS', 'Publik')
            ->orderBy('berita.created_at', 'desc')
            ->take(6)
            ->get();
        // $blog      = berita_model::where('BERITA_STATUS', 'Publik')->latest('created_at')->take(6)->get();

        // dd(count($gambar), $gambar);
        return view('amodule/diklat/web/beranda', [
            'event' => $event,
            'testimony' => $testimony,
            'informasi' => $informasi,
            'gambar' => $gambar,
            'pointplus' => $pointplus,
            'blog' => $blog,
        ]);
    }

    public function aboutus()
    {
        $sotk    = gambar_model::where('GAMBAR_KATEGORI', 'SOTK')->get();
        $profile = gambar_model::where('GAMBAR_KATEGORI', 'TentangKami')->first();
        $informasi = infokontak_model::where('INFO_ID', '001')->first();
        $pointplus = keunggulan_model::all();

        return view('amodule/diklat/web/aboutus', [
            'informasi' => $informasi,
            'sotk' => $sotk,
            'profile' => $profile,
            'pointplus' => $pointplus,
        ]);
    }

    public function agenda()
    {
        $agenda    = gambar_model::where('GAMBAR_KATEGORI', 'Agenda')->get();
        $informasi = infokontak_model::where('INFO_ID', '001')->first();

        return view('amodule/diklat/web/agenda', [
            'agenda' => $agenda,
            'informasi' => $informasi
        ]);
    }

    public function kelas()
    {
        $informasi = infokontak_model::where('INFO_ID', '001')->first();
        $event = event_model::where('EVENT_ACTIVE', 'Publish')->get();

        return view('amodule/diklat/web/kelas', [
            'event' => $event,
            'informasi' => $informasi,
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
        $informasi = infokontak_model::where('INFO_ID', '001')->first();
        $event = event_model::where('EVENT_SLUG', $slug)->first();

        return view('amodule/diklat/web/cokelas', [
            'slug' => $slug,
            'id' => $id,
            'informasi' => $informasi,
            'kelas' => $event,
        ]);
    }

    public function store_cokelas(Request $request)
    {   
        $event_id = $request->id;
        $event_slug = $request->slug;

        // 1. validasi data upload file bukti--------------------------------------------------------------------------------------------
        // $rule = [
        //     'bukti' => ['required', 'max:2048', 'mimes:jpeg,jpg,png'],
        // ];

        // $pesan = [
        //     'bukti.required' => 'Kolom bukti harus diisi.',
        //     'bukti.max' => 'Kolom ini maksimal :max .',
        //     'bukti.mimes' => 'Kolom ini harus berupa file dengan ekstensi jpeg, jpg, png.',
        // ];

        // $validator = Validator::make($request->all(), $rule, $pesan);
        // if ($validator->fails()) {
        //     return redirect( url('checkout-kelas/'.$event_slug.'/' . $event_id) )->withErrors($validator)->withInput($request->all());
        // }
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
        // $filename = null;
        // if ($request->file('bukti')) {
        //     $file         = $request->file('bukti'); 
        //     $path         = $file->store('bukti_order', 'local'); // proses upload file
        //     $filename = basename($path);
        // }
        // ===============================================================================================================================

        // 4. buat order
        $order = New order_model();
        $order->USERS_ID = Auth::user()->id;
        $order->ORDER_CODE = $this->generadeCode();
        $order->ORDER_TOTAL = $event->EVENT_HARGA - $event->EVENT_DISKON;
        $order->ORDER_BUKTI = null; //$filename;
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

        
        // 6. Kirim pesan ke Telegram
        // $chatId = '705776065';
        // $message = "
        //     <b>Orderan Masuk #".$order->ORDER_CODE."</b>
        // ";

        // Telegram::sendMessage([
        //     'chat_id' => $chatId,
        //     'text' => $message,
        // ]);

        $text = 'Halo Admin, Saya berminat mengikuti event dengan Kode Order : #'.$order->ORDER_CODE.'. Terima kasih. ['.Auth::user()->name.']';

        $textencode = urlencode($text);

        $responseData = [
            'status_code' => 200,
            'message' => 'Sukses, halaman akan di alihkan ke Panel dan WhatsApp Admin Kami',
            'data' => [
                'code' => $order->ORDER_CODE, 
                'item' => $itemorder->ITEMORDER_JUDUL_DIPILIH, 
                'tagihan' => $order->ORDER_TOTAL, 
                'textwhatsapp' => $textencode
            ]
        ];
        
        return response()->json($responseData, 200);

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
