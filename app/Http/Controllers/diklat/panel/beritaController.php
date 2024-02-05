<?php

namespace App\Http\Controllers\diklat\panel;

use App\Http\Controllers\Controller;
use App\Model\diklat\berita_model;
use App\Model\diklat\beritakategori_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
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
        // dd($request->all(), $request->konten);

        $rule = [
            'title' => ['required'],
            'slug' => ['required'],
            'status' => ['required'],
            'kategori' => ['required'],
            'konten' => ['required'],
            'gambar' => ['required', 'max:3072', 'mimes:jpeg,jpg,png'],
        ];

        $pesan = [
            'title.required' => 'Kolom title harus diisi.',
            'slug.required' => 'Kolom slug harus diisi.',
            'status.required' => 'Kolom status harus diisi.',
            'kategori.required' => 'Kolom kategori harus diisi.',
            'konten.required' => 'Kolom konten harus diisi.',
            'gambar.required' => 'Kolom gambar harus diisi.',
            'gambar.max' => 'Kolom ini maksimal :max .',
            'gambar.mimes' => 'Kolom ini harus berupa file dengan ekstensi jpeg, jpg, png.',
        ];

        $validator = Validator::make($request->all(), $rule, $pesan);

        if ($validator->fails()) {
            // return redirect()->route('create-berita')->withErrors($validator)->withInput($request->all());
            
            return response()->json([
                'status_code' => 422, //422 | server meresponse tapi validasi tidak lolos
                'errors' => $validator->errors(),
            ]);
        }

        // lolos validasi
        $filename = null;
        if ($request->file('gambar')) {
            $file         = $request->file('gambar'); 
            $path         = $file->store('gambar_berita', 'local'); // proses upload file
            $filename = basename($path);
        }

        $store = new berita_model();
        $store->BERITA_TITLE = $request->title;
        $store->USERS_ID = Auth::user()->id;
        $store->BERITA_SLUG = $request->slug;
        $store->BERITA_STATUS = $request->status;
        $store->BERITA_KATEGORI_ID = $request->kategori;
        $store->BERITA_KONTEN = $request->konten;
        $store->BERITA_GAMBAR = $filename;
        $store->Save();

        $responseData = [
            'status_code' => 200,
            'message' => 'Data berhasil disimpan.',
            'additionalData' => 'Nilai tambahan jika diperlukan.'
        ];
        
        return response()->json($responseData, 200);

        // Logic for successful validation
        // session()->flash('keyword', 'TambahData');
        // session()->flash('pesan', 'Berita Ditambahkan');
        // return redirect('/panel-berita');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // $berita = berita_model::find($id);
        $berita = DB::table('berita')
            ->join('users', 'users.id', '=', 'berita.USERS_ID')
            ->where('berita.BERITA_ID', '=', $id)
            ->first();

        return view('amodule/diklat/panel/OP_berita/berita', [
            'berita' => $berita
        ]);
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
        $kategori = beritakategori_model::all();

        return view('amodule/diklat/panel/OP_berita/edit', [
            'berita' => $berita,
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
        $update = berita_model::where('BERITA_ID', $id)->first();

            $filename = $update->BERITA_GAMBAR;

            if ($request->file('gambar')) {
                $check    = Storage::disk('local')->delete('/gambar_berita/' . $filename);
                $file     = $request->file('gambar'); 
                $path     = $file->store('gambar_berita', 'local'); // proses upload file
                $filename = basename($path);
                
                // masukkan ke query
                $update->BERITA_GAMBAR = $filename;
            }

        $update->BERITA_TITLE = $request->title;
        $update->BERITA_SLUG = $request->slug;
        $update->BERITA_STATUS = $request->status;
        $update->BERITA_KATEGORI_ID = $request->kategori;
        $update->BERITA_KONTEN = $request->konten;
        $update->USERS_ID = Auth::user()->id;

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
        
        // dd($update->getChanges()); //mengetahui kolom apa saja yang diubah
        // dd($update->isDirty());  //mengetahui ada data yang diubah atau tidak. posisi dia harus di atas $update->save()

        // Logic for successful validation
        // session()->flash('keyword', 'TambahData');
        // session()->flash('pesan', 'Berita Diubah');
        // return redirect('/panel-berita');
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
        $check = Storage::disk('local')->delete('/gambar_berita/' . $del->BERITA_GAMBAR);
        $del->delete();

        session()->flash('keyword', 'Alert');
        session()->flash('pesan', 'berita dihapus');
        return redirect('/panel-berita');
    }
}
