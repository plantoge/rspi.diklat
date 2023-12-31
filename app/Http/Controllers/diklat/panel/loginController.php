<?php

namespace App\Http\Controllers\diklat\panel;

use App\Http\Controllers\Controller;
use App\users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Ramsey\Uuid\Uuid;

class loginController extends Controller
{
    public function indexlogin(){
        return view('layout/website/auth/masterLogin', [
            '' => ''
        ]);
    }

    public function indexregister(){
        return view('layout/website/auth/masterRegister', [
            '' => ''
        ]);
    }

    public function postlogin(Request $request)
    {
        if(Auth::attempt($request->only('email','password'))){
            return redirect('/panel');
        }else{
            session()->flash('keyword', 'Alert');
            session()->flash('pesan', 'Email atau Password salah!');
            return redirect('/auth-sign-in');
        }
    }

    public function signout()
    {
        Auth::logout(); 
        return redirect('/');
    }

    public function postregister(Request $request){

        $rule = [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'phone' => ['required', 'string', 'max:20'],
        ];

        $pesan = [
            'name.required' => 'Kolom nama harus diisi.',
            'name.max' => 'Panjang nama maksimal :max karakter.',
            'email.required' => 'Kolom email harus diisi.',
            'email.email' => 'Format email tidak valid.',
            'password.required' => 'Kolom password harus diisi.',
            'password.min' => 'Panjang password minimal :min karakter.',
            'password.confirmed' => 'Konfirmasi password tidak cocok.',
            'phone.required' => 'Kolom Phone harus diisi.',
        ];

        $validator = Validator::make($request->all(), $rule, $pesan);

        if ($validator->fails()) {
            return redirect()->route('register')->withErrors($validator)->withInput($request->all());
        }

        $store = New users();
        $store->id = Uuid::uuid4()->toString();
        $store->status_pegawai = 'visitor';
        $store->nip = null;
        $store->name = $request->name;
        $store->username = $request->email;
        $store->password = bcrypt($request->password);
        $store->email = $request->email;
        $store->phone = $request->phone;
        $store->save();

        // masukkan ke assign role visitor
        $role = 'visitor';
        $user = \App\User::find($store->id);
        $user->assignRole($role);

        // Logic for successful validation
        session()->flash('keyword', 'TambahData');
        session()->flash('pesan', 'Berhasil Daftar akun');
        return redirect('/auth-sign-in');
    }

    public function checksignin(){
        echo json_encode(auth()->check());
    }
}
