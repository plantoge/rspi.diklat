<?php

namespace App\Model\diklat;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;

class keunggulan_model extends Model
{
    public $incrementing = false;
    protected $keyType = 'string';
    protected $primaryKey = 'KEUNGGULAN_ID';

    // protected $connection = 'DB_core';
    protected $table = "keunggulan";
    protected $fillable = [
        'KEUNGGULAN_ID',
        'KEUNGGULAN_FONTAWESOME',
        'KEUNGGULAN_JUDUL',
        'KEUNGGULAN_DESKRIPSI',
    ];

    protected static function boot()
    {
        parent::boot();

        // Membuat UUID secara otomatis sebelum menyimpan model
        static::creating(function ($model) {
            $model->KEUNGGULAN_ID = Uuid::uuid4()->toString();
        });
    }
}
