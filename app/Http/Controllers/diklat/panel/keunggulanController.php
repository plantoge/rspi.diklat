<?php

namespace App\Http\Controllers\diklat\panel;

use App\Http\Controllers\Controller;
use App\Model\diklat\keunggulan_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class keunggulanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $keunggulan = keunggulan_model::all();

        return view('amodule/diklat/panel/OP_keunggulan/index', [
            'keunggulan' => $keunggulan
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('amodule/diklat/panel/OP_keunggulan/create');
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
            'deskripsi' => ['required'],
            'icon' => ['required'],
        ];

        $pesan = [
            'icon.required' => 'Kolom icon harus diisi.',
            'judul.required' => 'Kolom Judul harus diisi.',
            'deskripsi.required' => 'Kolom deskripsi harus diisi.',
            // 'password.min' => 'Panjang password minimal :min karakter.',
        ];

        $validator = Validator::make($request->all(), $rule, $pesan);

        if ($validator->fails()) {
            // return redirect()->route('create-keunggulan')->withErrors($validator)->withInput($request->all());

            return response()->json([
                'status_code' => 422, //422 | server meresponse tapi validasi tidak lolos
                'errors' => $validator->errors(),
            ]);
        }

        // $classBaru = 'fa-2x text-white me-4';
        // $icon = preg_replace('/<i\s+class="([^"]*)"/i', '<i class="$1 ' . $classBaru . '"', $request->icon);

        $store = new keunggulan_model();
        // $store->KEUNGGULAN_FONTAWESOME = $icon;
        $store->KEUNGGULAN_FONTAWESOME = $request->icon;
        $store->KEUNGGULAN_JUDUL = $request->judul;
        $store->KEUNGGULAN_DESKRIPSI = $request->deskripsi;
        $store->Save();

        $responseData = [
            'status_code' => 200,
            'message' => 'Data berhasil disimpan.',
            'additionalData' => 'Nilai tambahan jika diperlukan.'
        ];
        
        return response()->json($responseData, 200);

        // Logic for successful validation
        // session()->flash('keyword', 'TambahData');
        // session()->flash('pesan', 'Ditambahkan');
        // return redirect('/panel-keunggulan');
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
        $keunggulan = keunggulan_model::where('KEUNGGULAN_ID', $id)->first();

        return view('amodule/diklat/panel/OP_keunggulan/edit', [
            'keunggulan' => $keunggulan,
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
        // $classBaru = 'fa-2x text-white me-4';
        // $icon = preg_replace('/<i\s+class="([^"]*)"/i', '<i class="$1 ' . $classBaru . '"', $request->icon);

        $update = keunggulan_model::where('KEUNGGULAN_ID', $id)->first();

        // $update->KEUNGGULAN_FONTAWESOME = $icon;
        $update->KEUNGGULAN_FONTAWESOME = $request->icon;
        $update->KEUNGGULAN_JUDUL = $request->judul;
        $update->KEUNGGULAN_DESKRIPSI = $request->deskripsi;
        
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
        $del = keunggulan_model::findorfail($id);
        $del->delete();

        session()->flash('keyword', 'Alert');
        session()->flash('pesan', 'dihapus');
        return redirect('/panel-keunggulan');
    }
}
