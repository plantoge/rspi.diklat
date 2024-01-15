<?php

namespace App\Model\diklat;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;

class beritakategori_model extends Model
{
    public $incrementing = false;
    protected $keyType = 'string';
    protected $primaryKey = 'BERITA_KATEGORI_ID';

    // protected $connection = 'DB_core';
    protected $table = "berita_kategori";
    protected $fillable = [
        'BERITA_KATEGORI_ID',
        'BERITA_KATEGORI',
        'BERITA_KATEGORI_SLUG',
    ];

    protected static function boot()
    {
        parent::boot();

        // Membuat UUID secara otomatis sebelum menyimpan model
        static::creating(function ($model) {
            $model->BERITA_KATEGORI_ID = Uuid::uuid4()->toString();
        });
    }
}
