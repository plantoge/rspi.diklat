<?php

namespace App\Model\diklat;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;

class itemorder_model extends Model
{
    public $incrementing = false;
    protected $keyType = 'string';
    protected $primaryKey = 'ITEMORDER_ID';

    // protected $connection = 'DB_core';
    protected $table = "event_itemorder";
    protected $fillable = [
        'ITEMORDER_ID',
        'ORDER_ID',
        'EVENT_ID',
        'ITEMORDER_JUDUL_DIPILIH',
        'ITEMORDER_HARGA_DIPILIH',
        'ITEMORDER_DISKON_DIPILIH',
    ];

    protected static function boot()
    {
        parent::boot();

        // Membuat UUID secara otomatis sebelum menyimpan model
        static::creating(function ($model) {
            $model->ITEMORDER_ID = Uuid::uuid4()->toString();
        });
    }
}
