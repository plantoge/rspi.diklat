<?php

namespace App\Model\diklat;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;

class infokontak_model extends Model
{
    public $incrementing = false;
    protected $keyType = 'string';
    protected $primaryKey = 'INFO_ID';

    // protected $connection = 'DB_core';
    protected $table = "informasi_kontak";
    protected $fillable = [
        'INFO_ID',
        'SAMBUTAN_BERANDA',
        'TELEPON',
        'FAX',
        'CALLCENTER',
        'HOTLINE',
        'EMAIL',
        'FACEBOOK',
        'INSTAGRAM',
        'TWITTER',
        'WHATSAPP',
    ];

    protected static function boot()
    {
        parent::boot();

        // Membuat UUID secara otomatis sebelum menyimpan model
        static::creating(function ($model) {
            $model->INFO_ID = Uuid::uuid4()->toString();
        });
    }
}
