<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;

class users extends Model
{
    public $incrementing = false;
    protected $keyType = 'string';
    protected $primaryKey = 'id';
    
    protected $table = "users";
    protected $fillable = [
        'id',
        'status_pegawai',
        'nip',
        'name',
        'username',
        'password',
        'email',
        'phone',
    ];

    // protected static function boot()
    // {
    //     parent::boot();

    //     // Membuat UUID secara otomatis sebelum menyimpan model
    //     static::creating(function ($model) {
    //         $model->id = Uuid::uuid4()->toString();
    //     });
    // }
}
