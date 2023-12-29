<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class users extends Model
{
    protected $table = "users";
    protected $fillable = [
        'status_pegawai',
        'nip',
        'name',
        'username',
        'password',
        'email',
    ];
}
