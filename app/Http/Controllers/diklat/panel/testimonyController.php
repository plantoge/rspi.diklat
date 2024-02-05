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
            'nama' => ['required'],
            'gambar' => ['required', 'max:2048', 'mimes:jpeg,jpg,png'],
            'deskripsi' => ['required'],
        ];

        $pesan = [
            'nama.required' => 'Kolom Nama harus diisi.',
            'deskripsi.required' => 'Kolom deskripsi harus diisi.',
            'gambar.required' => 'Kolom ini harus diisi.',
            'gambar.max' => 'Kolom ini maksimal :max .',
            'gambar.mimes' => 'Kolom ini harus berupa file dengan ekstensi jpeg, jpg, png.',
            // 'password.min' => 'Panjang password minimal :min karakter.',
        ];

        $validator = Validator::make($request->all(), $rule, $pesan);

        if ($validator->fails()) {
            // return redirect()->route('create-testimony')->withErrors($validator)->withInput($request->all());

            return response()->json([
                'status_code' => 422, //422 | server meresponse tapi validasi tidak lolos
                'errors' => $validator->errors(),
            ]);
        }

        // lolos validasi
        $filename = null;
        if ($request->file('gambar')) {
            $file         = $request->file('gambar'); 
            $path         = $file->store('gambar_testimony', 'local'); // proses upload file
            $filename = basename($path);
        }

        $store = new testimony_model();
        $store->TESTIMONY_NAMA = $request->nama;
        $store->TESTIMONY_GAMBAR = $filename;
        $store->TESTIMONY_DESKRIPSI = $request->deskripsi;
        $store->Save();

        $responseData = [
            'status_code' => 200,
            'message' => 'Data berhasil disimpan.',
            'additionalData' => 'Nilai tambahan jika diperlukan.'
        ];
        
        return response()->json($responseData, 200);

        // Logic for successful validation
        // session()->flash('keyword', 'TambahData');
        // session()->flash('pesan', 'Testimony Ditambahkan');
        // return redirect('/panel-testimony');
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

        if ($request->file('gambar')) {
            $check    = Storage::disk('local')->delete('/gambar_testimony/' . $filename);
            $file     = $request->file('gambar'); 
            $path     = $file->store('gambar_testimony', 'local'); // proses upload file
            $filename = basename($path);
            
            // masukkan ke query
            $update->TESTIMONY_GAMBAR = $filename;
        }

        $update->TESTIMONY_NAMA = $request->nama;
        $update->TESTIMONY_DESKRIPSI = $request->deskripsi;

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
        return redirect('/panel-testimony');
    }
}
