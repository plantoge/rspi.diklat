<?php

namespace App\Http\Controllers\diklat\panel;

use App\Http\Controllers\Controller;
use App\Model\diklat\infokontak_model;
use Illuminate\Http\Request;

class panelController extends Controller
{
    public function panel()
    {
        $informasi = infokontak_model::find('001')->first();

        return view('amodule/diklat/panel/panel', [
            'informasi' => $informasi
        ]);
    }

    public function store_informasi(Request $request)
    {
        $store = infokontak_model::find('001');
        $store->SAMBUTAN_BERANDA = $request->sambutan_beranda;
        $store->DESKRIPSI_AGENDA = $request->deskripsi_agenda;
        $store->DESKRIPSI_TENTANGKAMI = $request->deskripsi_tentangkami;
        $store->DESKRIPSI_SINGKAT_POINTPLUS = $request->deskripsi_singkat_poinplus;
        $store->DESKRIPSI_SINGKAT_EVENT_BERANDA = $request->deskripsi_singkat_event_beranda;
        $store->DESKRIPSI_SINGKAT_EVENT = $request->deskripsi_singkat_event;
        $store->DESKRIPSI_SINGKAT_TESTIMONY = $request->deskripsi_singkat_testimony;
        $store->DESKRIPSI_SINGKAT_AGENDA = $request->deskripsi_singkat_agenda;
        $store->TELEPON = $request->telepon;
        $store->FAX = $request->fax;
        $store->CALLCENTER = $request->callcenter;
        $store->HOTLINE = $request->hotline;
        $store->EMAIL = $request->email;
        $store->FACEBOOK = $request->facebook;
        $store->INSTAGRAM = $request->instagram;
        $store->TWITTER = $request->twitter;
        $store->WHATSAPP = $request->whatsapp;
        $store->Save();

        session()->flash('keyword', 'TambahData');
        session()->flash('pesan', 'Berhasil Update');
        return redirect('/panel');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
