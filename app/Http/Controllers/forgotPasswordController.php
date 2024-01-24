<?php

namespace App\Http\Controllers;

use App\Mail\ResetPasswordMail;
use App\resetPassword;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class forgotPasswordController extends Controller
{
    public function sendlinkemail(Request $request){

        $user = User::where('email', $request->email)->first();

        if ($user) {
            $token     = Str::random(60); // Generate token
            $expiresAt = Carbon::now()->addMinutes(60); //buat datetime set satu jam kedepan
            $datetim   = $expiresAt->toDateTimeString();

            $store = New resetPassword();
            $store->RESET_EMAIL = $request->email;
            $store->RESET_TOKEN = $token;
            $store->RESET_EXPIRE_AT = $datetim;
            // $store->save();

            // dd($user->email, $token);

            // Mail::to('fujiflantoge@gmail.com')->send(new ResetPasswordMail($token));
            $cek = Mail::to($user->email)->send(new ResetPasswordMail($token));

            // $now = Carbon::now()->toDateTimeString();
            // $cek = resetPassword::where('RESET_TOKEN','=', $store->RESET_TOKEN)
            //  ->where('RESET_EXPIRE_AT', '>', $now)
            //  ->first();
        } else{
            return redirect()->route('reset-password')->with('status', 'Email tidak terdaftar');
        }


    }
}
