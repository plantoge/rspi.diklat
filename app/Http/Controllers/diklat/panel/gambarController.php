<?php

namespace App\Http\Controllers\diklat\panel;

use App\Http\Controllers\Controller;
use App\Model\diklat\gambar_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class gambarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $gambar = gambar_model::all();

        return view('amodule/diklat/panel/OP_gambar/index', [
            'gambar' => $gambar
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('amodule/diklat/panel/OP_gambar/create');
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
            'kategori' => ['required'],
            'gambar' => ['required', 'max:2048', 'mimes:jpeg,jpg,png'],
        ];

        $pesan = [
            'kategori.required' => 'Kolom kategori harus diisi.',
            'gambar.required' => 'Kolom ini harus diisi.',
            'gambar.max' => 'Kolom ini maksimal :max .',
            'gambar.mimes' => 'Kolom ini harus berupa file dengan ekstensi jpeg, jpg, png.',
            // 'password.min' => 'Panjang password minimal :min karakter.',
        ];

        $validator = Validator::make($request->all(), $rule, $pesan);

        if ($validator->fails()) {
            // return redirect()->route('create-gambar')->withErrors($validator)->withInput($request->all());
            return response()->json([
                'status_code' => 422, //422 | server meresponse tapi validasi tidak lolos
                'errors' => $validator->errors(),
            ]);
        }

        // lolos validasi
        $filename = null;
        if ($request->file('gambar')) {
            $file         = $request->file('gambar'); 
            $path         = $file->store('gambar_website', 'local'); // proses upload file
            $filename = basename($path);
        }

        $store = new gambar_model();
        $store->GAMBAR_KATEGORI = $request->kategori;
        $store->GAMBAR = $filename;
        $store->Save();

        $responseData = [
            'status_code' => 200,
            'message' => 'Data berhasil disimpan.',
            'additionalData' => 'Nilai tambahan jika diperlukan.'
        ];
        
        return response()->json($responseData, 200);

        // Logic for successful validation
        // session()->flash('keyword', 'TambahData');
        // session()->flash('pesan', 'Event Ditambahkan');
        // return redirect('/panel-gambar');
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
        $gambar = gambar_model::Where('GAMBAR_ID', $id)->first();
        return view('amodule/diklat/panel/OP_gambar/edit', [
            'gambar' => $gambar,
            'id' => $id
        ]);
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
        $update = gambar_model::where('GAMBAR_ID', $id)->first();

            $filename = $update->GAMBAR;

            if ($request->file('gambar')) {
                $check    = Storage::disk('local')->delete('/gambar_website/' . $filename);
                $file     = $request->file('gambar'); 
                $path     = $file->store('gambar_website', 'local'); // proses upload file
                $filename = basename($path);
                
                // masukkan ke query
                $update->GAMBAR = $filename;
            }

        $update->GAMBAR_KATEGORI = $request->kategori;
        
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

        // Logic for successful validation
        // session()->flash('keyword', 'TambahData');
        // session()->flash('pesan', 'Event Diubah');
        // return redirect('/panel-gambar');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $gambar = gambar_model::findorfail($id);
        $check = Storage::disk('local')->delete('/gambar_website/' . $gambar->GAMBAR);
        $gambar->delete();

        session()->flash('keyword', 'Alert');
        session()->flash('pesan', 'Event dihapus');
        return redirect('/panel-gambar');
    }
}
