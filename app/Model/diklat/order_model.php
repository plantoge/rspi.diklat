<?php

namespace App\Model\diklat;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;

class order_model extends Model
{
    public $incrementing = false;
    protected $keyType = 'string';
    protected $primaryKey = 'ORDER_ID';

    // protected $connection = 'DB_core';
    protected $table = "event_order";
    protected $fillable = [
        'ORDER_ID',
        'USERS_ID',
        'ORDER_CODE',
        'ORDER_TOTAL',
        'ORDER_BUKTI',
        'ORDER_STATUS',
    ];

    protected static function boot()
    {
        parent::boot();

        // Membuat UUID secara otomatis sebelum menyimpan model
        static::creating(function ($model) {
            $model->ORDER_ID = Uuid::uuid4()->toString();
        });
    }
}
