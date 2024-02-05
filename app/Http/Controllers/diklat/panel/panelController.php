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
        $update = infokontak_model::find('001');
        $update->SAMBUTAN_BERANDA = $request->sambutan_beranda;
        $update->DESKRIPSI_AGENDA = $request->deskripsi_agenda;
        $update->DESKRIPSI_TENTANGKAMI = $request->deskripsi_tentangkami;
        $update->DESKRIPSI_SINGKAT_POINTPLUS = $request->deskripsi_singkat_poinplus;
        $update->DESKRIPSI_SINGKAT_EVENT_BERANDA = $request->deskripsi_singkat_event_beranda;
        $update->DESKRIPSI_SINGKAT_EVENT = $request->deskripsi_singkat_event;
        $update->DESKRIPSI_SINGKAT_TESTIMONY = $request->deskripsi_singkat_testimony;
        $update->DESKRIPSI_SINGKAT_AGENDA = $request->deskripsi_singkat_agenda;
        $update->DESKRIPSI_SINGKAT_BERITA = $request->deskripsi_singkat_berita;
        $update->TELEPON = $request->telepon;
        $update->FAX = $request->fax;
        $update->CALLCENTER = $request->callcenter;
        $update->HOTLINE = $request->hotline;
        $update->EMAIL = $request->email;
        $update->FACEBOOK = $request->facebook;
        $update->INSTAGRAM = $request->instagram;
        $update->TWITTER = $request->twitter;
        $update->WHATSAPP = $request->whatsapp;
        
        // cek apakah ada data yang diubah
        if($update->isDirty() == true){
            
            $update->Save();
            
            $responseData = [
                'status_code' => 200,
                'message' => 'Data berhasil disimpan.',
                'additionalData' => 'Nilai tambahan jika diperlukan.'
            ];
        }else if($update->isDirty() == false){
            $responseData = [
                'status_code' => 200,
                'message' => 'Data tidak ada yang di ubah.',
                'additionalData' => 'Nilai tambahan jika diperlukan.'
            ];
        }

        return response()->json($responseData, 200);
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
