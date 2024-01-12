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
            return redirect()->route('create-keunggulan')->withErrors($validator)->withInput($request->all());
        }

        $classBaru = 'fa-2x text-white me-4';
        $icon = preg_replace('/<i\s+class="([^"]*)"/i', '<i class="$1 ' . $classBaru . '"', $request->icon);

        $store = new keunggulan_model();
        $store->KEUNGGULAN_FONTAWESOME = $icon;
        $store->KEUNGGULAN_JUDUL = $request->judul;
        $store->KEUNGGULAN_DESKRIPSI = $request->deskripsi;
        $store->Save();

        // Logic for successful validation
        session()->flash('keyword', 'TambahData');
        session()->flash('pesan', 'Ditambahkan');
        return redirect('/panel-keunggulan');
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
        $classBaru = 'fa-2x text-white me-4';
        $icon = preg_replace('/<i\s+class="([^"]*)"/i', '<i class="$1 ' . $classBaru . '"', $request->icon);

        $update = keunggulan_model::where('KEUNGGULAN_ID', $id)->first();

        $update->KEUNGGULAN_FONTAWESOME = $icon;
        $update->KEUNGGULAN_JUDUL = $request->judul;
        $update->KEUNGGULAN_DESKRIPSI = $request->deskripsi;
        $update->Save();

        // Logic for successful validation
        session()->flash('keyword', 'TambahData');
        session()->flash('pesan', 'Diubah');
        return redirect('/panel-keunggulan');
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
