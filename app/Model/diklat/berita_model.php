<?php

namespace App\Model\diklat;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;

class berita_model extends Model
{
    public $incrementing = false;
    protected $keyType = 'string';
    protected $primaryKey = 'BERITA_ID';

    // protected $connection = 'DB_core';
    protected $table = "berita";
    protected $fillable = [
        'BERITA_ID',
        'USERS_ID',
        'BERITA_KATEGORI_ID',
        'BERITA_TITLE',
        'BERITA_SLUG',
        'BERITA_KONTEN',
        'BERITA_GAMBAR',
        'BERITA_STATUS',
    ];

    protected static function boot()
    {
        parent::boot();

        // Membuat UUID secara otomatis sebelum menyimpan model
        static::creating(function ($model) {
            $model->BERITA_ID = Uuid::uuid4()->toString();
        });
    }
}
