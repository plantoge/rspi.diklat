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
        'DESKRIPSI_AGENDA',
        'DESKRIPSI_TENTANGKAMI',
        'DESKRIPSI_SINGKAT_POINTPLUS',
        'DESKRIPSI_SINGKAT_EVENT_BERANDA',
        'DESKRIPSI_SINGKAT_EVENT',
        'DESKRIPSI_SINGKAT_TESTIMONY',
        'DESKRIPSI_SINGKAT_AGENDA',
        'DESKRIPSI_SINGKAT_BERITA',
        'TELEPON',
        'FAX',
        'CALLCENTER',
        'HOTLINE',
        'EMAIL',
        'FACEBOOK',
        'INSTAGRAM',
        'TWITTER',
        'WHATSAPP',
        'ALAMAT_SATU',
        'ALAMAT_DUA',
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
