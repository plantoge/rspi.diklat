<?php

namespace App\Http\Controllers\diklat\panel;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class loginController extends Controller
{
    public function postlogin(Request $request)
    {
        // dd(Auth::attempt($request->only('email','password')), $request->all(), Auth::check());
        if(Auth::attempt($request->only('email','password'))){
            return redirect('/panel');
        }else{
            session()->flash('keyword', 'Alert');
            session()->flash('pesan', 'Data yang dimasukkan salah!');
            return redirect('/');
        }
    }

    public function signout()
    {
        Auth::logout(); 
        return redirect('/');
    }
}
