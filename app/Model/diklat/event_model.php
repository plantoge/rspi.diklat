<?php

namespace App\Model\diklat;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;

class event_model extends Model
{
    public $incrementing = false;
    protected $keyType = 'string';
    protected $primaryKey = 'EVENT_ID';

    // protected $connection = 'DB_core';
    protected $table = "events";
    protected $fillable = [
        'EVENT_ID',
        'EVENT_JUDUL',
        'EVENT_SLUG',
        'EVENT_DESKRIPSI_SINGKAT',
        'EVENT_DESKRIPSI_PANJANG',
        'EVENT_KATEGORI',
        'EVENT_HARGA',
        'EVENT_DISKON',
        'EVENT_GAMBAR',
        'EVENT_JADWAL_AWAL',
        'EVENT_JADWAL_AKHIR',
        'EVENT_ACTIVE',
    ];

    protected static function boot()
    {
        parent::boot();

        // Membuat UUID secara otomatis sebelum menyimpan model
        static::creating(function ($model) {
            $model->EVENT_ID = Uuid::uuid4()->toString();
        });
    }
}
