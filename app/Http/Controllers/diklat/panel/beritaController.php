<?php

namespace App\Http\Controllers\diklat\panel;

use App\Http\Controllers\Controller;
use App\Model\diklat\berita_model;
use App\Model\diklat\beritakategori_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class beritaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $berita = berita_model::all();

        return view('amodule/diklat/panel/OP_berita/index', [
            'berita' => $berita
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $kategori = beritakategori_model::all();

        return view('amodule/diklat/panel/OP_berita/create', [
            'kategori' => $kategori 
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
            'title' => ['required'],
            'slug' => ['required'],
            'status' => ['required'],
            'kategori' => ['required'],
            'konten' => ['required'],
        ];

        $pesan = [
            'title.required' => 'Kolom title harus diisi.',
            'slug.required' => 'Kolom slug harus diisi.',
            'status.required' => 'Kolom status harus diisi.',
            'kategori.required' => 'Kolom kategori harus diisi.',
            'konten.required' => 'Kolom konten harus diisi.',
        ];

        $validator = Validator::make($request->all(), $rule, $pesan);

        if ($validator->fails()) {
            return redirect()->route('create-berita')->withErrors($validator)->withInput($request->all());
        }

        $store = new berita_model();
        $store->BERITA_TITLE = $request->title;
        $store->BERITA_SLUG = $request->slug;
        $store->BERITA_STATUS = $request->status;
        $store->BERITA_KATEGORI_ID = $request->kategori;
        $store->BERITA_KONTEN = $request->konten;
        $store->Save();

        // Logic for successful validation
        session()->flash('keyword', 'TambahData');
        session()->flash('pesan', 'Berita Ditambahkan');
        return redirect('/panel-berita');
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
        $berita = berita_model::find($id);

        return view('amodule/diklat/panel/OP_berita/edit', [
            'berita' => $berita,
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
        $del = berita_model::find($id);
        $del->delete();

        session()->flash('keyword', 'Alert');
        session()->flash('pesan', 'berita dihapus');
        return redirect('/panel-berita');
    }
}
