<?php

namespace App\Http\Controllers\diklat\panel;

use App\Http\Controllers\Controller;
use App\Model\diklat\testimony_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class testimonyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $testimony = testimony_model::all();

        return view('amodule/diklat/panel/OP_testimony/index', [
            'testimony' => $testimony
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('amodule/diklat/panel/OP_testimony/create', [

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
            'testimony_nama' => ['required'],
            'testimony_gambar' => ['required', 'max:2048', 'mimes:jpeg,jpg,png'],
            'testimony_deskripsi' => ['required'],
        ];

        $pesan = [
            'testimony_nama.required' => 'Kolom Nama harus diisi.',
            'testimony_deskripsi.required' => 'Kolom deskripsi harus diisi.',
            'testimony_gambar.required' => 'Kolom ini harus diisi.',
            'testimony_gambar.max' => 'Kolom ini maksimal :max .',
            'testimony_gambar.mimes' => 'Kolom ini harus berupa file dengan ekstensi jpeg, jpg, png.',
            // 'password.min' => 'Panjang password minimal :min karakter.',
        ];

        $validator = Validator::make($request->all(), $rule, $pesan);

        if ($validator->fails()) {
            return redirect()->route('create-testimony')->withErrors($validator)->withInput($request->all());
        }

        // lolos validasi
        $filename = null;
        if ($request->file('testimony_gambar')) {
            $file         = $request->file('testimony_gambar'); 
            $path         = $file->store('gambar_testimony', 'local'); // proses upload file
            $filename = basename($path);
        }

        $store = new testimony_model();
        $store->TESTIMONY_NAMA = $request->testimony_nama;
        $store->TESTIMONY_GAMBAR = $filename;
        $store->TESTIMONY_DESKRIPSI = $request->testimony_deskripsi;
        $store->Save();

        // Logic for successful validation
        session()->flash('keyword', 'TambahData');
        session()->flash('pesan', 'Testimony Ditambahkan');
        return redirect('/testimony');
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
        $testimony = testimony_model::find($id);

        return view('amodule/diklat/panel/OP_testimony/edit', [
            'testimony' => $testimony,
            'id' => $id,
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
        $update = testimony_model::where('TESTIMONY_ID', $id)->first();

        $filename = $update->TESTIMONY_GAMBAR;

        if ($request->file('testimony_gambar')) {
            $check    = Storage::disk('local')->delete('/gambar_testimony/' . $filename);
            $file     = $request->file('testimony_gambar'); 
            $path     = $file->store('gambar_testimony', 'local'); // proses upload file
            $filename = basename($path);
            
            // masukkan ke query
            $update->TESTIMONY_GAMBAR = $filename;
        }

        $update->TESTIMONY_NAMA = $request->testimony_nama;
        $update->TESTIMONY_DESKRIPSI = $request->testimony_deskripsi;
        $update->Save();

        // Logic for successful validation
        session()->flash('keyword', 'TambahData');
        session()->flash('pesan', 'Testimony Diubah');
        return redirect('/testimony');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $testimony = testimony_model::findorfail($id);
        $check = Storage::disk('local')->delete('/gambar_testimony/' . $testimony->TESTIMONY_GAMBAR);
        $testimony->delete();

        session()->flash('keyword', 'Alert');
        session()->flash('pesan', 'Testimony dihapus');
        return redirect('/testimony');
    }
}
