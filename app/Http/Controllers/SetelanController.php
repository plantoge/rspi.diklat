<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class SetelanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('setelan/index', [
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
    public function updateemail(Request $request)
    {
        // dd($request->only('password'));
        if (Hash::check($request->konfirmasipassword, Auth::user()->password)) {
            $user = Auth::user();
            $user->email = $request->email;
            $user->save();
        }else{
            session()->flash('keyword', 'Alert');
            session()->flash('pesan', 'Password salah!');
            return redirect('setelan');
        }

        session()->flash('keyword', 'EditData');
        session()->flash('pesan', 'Data diubah');
        return redirect('/setelan');
    }

    public function updatepassword(Request $request)
    {
        if (Hash::check($request->passwordsekarang, Auth::user()->password)) {
            // tag name kolom input password baru dengan konfirmasi password baru harus sama nama tag name nya
            // dimana kolom input konfirmasi password baru harus di tambahkan "_confirmation" di tag name nya
            // tag name : password maka tag name konfirmasi password baru harus password_confirmation
            
            $request->validate([
                'passwordbaru' => 'required|min:8|confirmed'
            ]);

            $update = Auth::user()->update(['password' => Hash::make($request->passwordbaru)]);
        }else{
            session()->flash('keyword', 'Alert');
            session()->flash('pesan', 'Password salah!');
            return redirect('setelan');
        }

        session()->flash('keyword', 'TambahData');
        session()->flash('pesan', 'Berhasil ganti Password');
        return redirect('setelan');
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
