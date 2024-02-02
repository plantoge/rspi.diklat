<?php

namespace App\Http\Controllers\diklat\panel;

use App\Http\Controllers\Controller;
use App\Model\diklat\beritakategori_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class beritaKategoriController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $kategori = beritakategori_model:: all();

        return view('amodule/diklat/panel/OP_beritakategori/index', [
            'kategori' => $kategori
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('amodule/diklat/panel/OP_beritakategori/create');
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
            'title' => ['required'],
            'slug' => ['required'],
        ];

        $pesan = [
            'title.required' => 'Kolom title harus diisi.',
            'slug.required' => 'Kolom slug harus diisi.',
        ];

        $validator = Validator::make($request->all(), $rule, $pesan);

        if ($validator->fails()) {
            // PHP | return redirect()->route('create-berita-kategori')->withErrors($validator)->withInput($request->all());
            
            return response()->json([
                'status_code' => 422, //422 | server meresponse tapi validasi tidak lolos
                'errors' => $validator->errors(),
            ]);
        }

        $store = new beritakategori_model();
        $store->BERITA_KATEGORI = $request->title;
        $store->BERITA_KATEGORI_SLUG = $request->slug;
        $store->Save();

        
        $responseData = [
            'status_code' => 200,
            'message' => 'Data berhasil disimpan.',
            'additionalData' => 'Nilai tambahan jika diperlukan.'
        ];
        
        return response()->json($responseData, 200);
        
        // PHP | Logic for successful validation
        // session()->flash('keyword', 'TambahData');
        // session()->flash('pesan', 'Kategori Ditambahkan');
        // return redirect('/panel-berita-kategori');
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
        $kategori = beritakategori_model::find($id);

        return view('amodule/diklat/panel/OP_beritakategori/edit', [
            'kategori' => $kategori,
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
        $update = beritakategori_model::find($id);
        $update->BERITA_KATEGORI = $request->title;
        $update->BERITA_KATEGORI_SLUG = $request->slug;
        $update->Save();

        // Logic for successful validation
        session()->flash('keyword', 'TambahData');
        session()->flash('pesan', 'Kategori diubah');
        return redirect('/panel-berita-kategori');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $kategori = beritakategori_model::findorfail($id);
        $kategori->delete();

        session()->flash('keyword', 'Alert');
        session()->flash('pesan', 'Kategori dihapus');
        return redirect('/panel-berita-kategori');
    }
}
