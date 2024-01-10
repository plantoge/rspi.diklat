<?php

namespace App\Model\diklat;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;

class testimony_model extends Model
{
    public $incrementing = false;
    protected $keyType = 'string';
    protected $primaryKey = 'TESTIMONY_ID';

    // protected $connection = 'DB_core';
    protected $table = "testimony";
    protected $fillable = [
        'TESTIMONY_ID',
        'TESTIMONY_GAMBAR',
        'TESTIMONY_NAMA',
        'TESTIMONY_DESKRIPSI',
    ];

    protected static function boot()
    {
        parent::boot();

        // Membuat UUID secara otomatis sebelum menyimpan model
        static::creating(function ($model) {
            $model->TESTIMONY_ID = Uuid::uuid4()->toString();
        });
    }
}
