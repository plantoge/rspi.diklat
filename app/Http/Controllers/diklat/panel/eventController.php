<?php

namespace App\Http\Controllers\diklat\panel;

use App\Http\Controllers\Controller;
use App\Model\diklat\event_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class eventController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        return view('amodule/diklat/panel/OP_events/index', [

        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('amodule/diklat/panel/OP_events/create', [

        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rule = [
            'judul' => ['required'],
            'deskripsi_singkat' => ['required'],
            'kategori' => ['required'],
            'harga' => ['required'],
            'deskripsi' => ['required'],
            'status' => ['required'],
            'gambar' => ['required', 'max:2048', 'mimes:jpeg,jpg,png'],
        ];

        $pesan = [
            'judul.required' => 'Kolom Judul harus diisi.',
            'deskripsi_singkat.required' => 'Kolom Deskripsi harus diisi.',
            'kategori.required' => 'Kolom kategori harus diisi.',
            'harga.required' => 'Kolom harga harus diisi.',
            'deskripsi.required' => 'Kolom deskripsi harus diisi.',
            'status.required' => 'Kolom status harus diisi.',
            'gambar.required' => 'Kolom ini harus diisi.',
            'gambar.max' => 'Kolom ini maksimal :max .',
            'gambar.mimes' => 'Kolom ini harus berupa file dengan ekstensi jpeg, jpg, png.',
            // 'password.min' => 'Panjang password minimal :min karakter.',
        ];

        $validator = Validator::make($request->all(), $rule, $pesan);

        if ($validator->fails()) {
            return redirect()->route('create-event')->withErrors($validator)->withInput($request->all());
        }

        // lolos validasi
        $filename = null;
        if ($request->file('gambar')) {
            $file         = $request->file('gambar'); 
            $path         = $file->store('gambar_event', 'local'); // proses upload file
            $filename = basename($path);
        }

        $harga1 = str_replace(".", "", $request->harga);
        $harga = str_replace(",", ".", $harga1);

        $store = new event_model();
        $store->EVENT_JUDUL = $request->judul;
        $store->EVENT_SLUG = $request->slug;
        $store->EVENT_DESKRIPSI_SINGKAT = $request->deskripsi_singkat;
        $store->EVENT_DESKRIPSI_PANJANG = $request->deskripsi;
        $store->EVENT_KATEGORI = $request->kategori;
        $store->EVENT_HARGA = $harga;
        $store->EVENT_GAMBAR = $filename;
        $store->EVENT_ACTIVE = $request->status;
        $store->Save();

        // Logic for successful validation
        session()->flash('keyword', 'TambahData');
        session()->flash('pesan', 'Event Ditambahkan');
        return redirect('/events');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
