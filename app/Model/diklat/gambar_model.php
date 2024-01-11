<?php

namespace App\Model\diklat;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;

class gambar_model extends Model
{
    public $incrementing = false;
    protected $keyType = 'string';
    protected $primaryKey = 'GAMBAR_ID';

    // protected $connection = 'DB_core';
    protected $table = "gambar";
    protected $fillable = [
        'GAMBAR_ID',
        'GAMBAR_KATEGORI',
        'GAMBAR',
    ];

    protected static function boot()
    {
        parent::boot();

        // Membuat UUID secara otomatis sebelum menyimpan model
        static::creating(function ($model) {
            $model->GAMBAR_ID = Uuid::uuid4()->toString();
        });
    }
}
