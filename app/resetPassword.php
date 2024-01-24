<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;

class resetPassword extends Model
{
    // protected $connection = 'DB_core';
    protected $table = "resetpassword";
    protected $keyType = 'string';
    protected $primaryKey = 'RESET_ID';
    public $incrementing = false;

    protected $fillable = [
        'RESET_ID',
        'RESET_EMAIL',
        'RESET_TOKEN',
        'RESET_EXPIRE_AT',
    ];

    protected static function boot()
    {
        parent::boot();

        // Membuat UUID secara otomatis sebelum menyimpan model
        static::creating(function ($model) {
            $model->RESET_ID = Uuid::uuid4()->toString();
        });
    }
}
