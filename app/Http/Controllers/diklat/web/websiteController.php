<?php

namespace App\Http\Controllers\diklat\web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class websiteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function beranda()
    {
        return view('amodule/diklat/web/beranda', [
            '' => ''
        ]);
    }

    public function aboutus()
    {
        return view('amodule/diklat/web/aboutus', [
            '' => ''
        ]);
    }

    public function agenda()
    {
        return view('amodule/diklat/web/agenda', [
            '' => ''
        ]);
    }

    public function kelas()
    {
        return view('amodule/diklat/web/kelas', [
            '' => ''
        ]);
    }

    public function infokelas($slug, $id)
    {
        // dd($slug, $id);
        return view('amodule/diklat/web/infokelas', [
            'slug' => $slug,
            'id' => $id,
        ]);
    }

    public function cokelas($slug, $id)
    {
        return view('amodule/diklat/web/cokelas', [
            'slug' => $slug,
            'id' => $id,
        ]);
    }

    public function admin()
    {
        // dd(Auth::check());
        return view('amodule/diklat/admin/admin', [
            '' => ''
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
