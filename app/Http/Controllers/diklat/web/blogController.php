<?php

namespace App\Http\Controllers\diklat\web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class blogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $berita = DB::table('berita')
            ->join('users', 'users.id', '=', 'berita.USERS_ID')
            ->orderBy('berita.created_at', 'desc')
            ->paginate(10);

        return view('amodule/diklat/web/blog/index', [
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
    public function show($slug)
    {
        $berita = DB::table('berita')
            ->select('berita.*', 'users.*')
            ->selectRaw('
                berita.created_at AS dibuat,
                berita.updated_at AS diperbaharui
            ')
            ->join('users', 'users.id', '=', 'berita.USERS_ID')
            ->where('berita.BERITA_SLUG', '=', $slug)
            ->first();

        return view('amodule/diklat/web/blog/view', [
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
