<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInformasiKontak extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('informasi_kontak', function (Blueprint $table) {
            $table->char('INFO_ID', 50)->primary();
            $table->longText('SAMBUTAN_BERANDA')->nullable();
            $table->longText('DESKRIPSI_AGENDA')->nullable();
            $table->longText('DESKRIPSI_TENTANGKAMI')->nullable();
            $table->text('DESKRIPSI_SINGKAT_POINTPLUS')->nullable();
            $table->text('DESKRIPSI_SINGKAT_EVENT_BERANDA')->nullable();
            $table->text('DESKRIPSI_SINGKAT_EVENT')->nullable();
            $table->text('DESKRIPSI_SINGKAT_TESTIMONY')->nullable();
            $table->text('DESKRIPSI_SINGKAT_AGENDA')->nullable();
            $table->text('DESKRIPSI_SINGKAT_BERITA')->nullable();
            $table->string('TELEPON')->nullable();
            $table->string('FAX')->nullable();
            $table->string('CALLCENTER')->nullable();
            $table->string('HOTLINE')->nullable();
            $table->string('EMAIL')->nullable();
            $table->string('FACEBOOK')->nullable();
            $table->string('INSTAGRAM')->nullable();
            $table->string('TWITTER')->nullable();
            $table->string('WHATSAPP')->nullable();
            $table->text('ALAMAT_SATU')->nullable();
            $table->text('ALAMAT_DUA')->nullable();
            
            $table->timestamps();
            $table->softDeletes($column = 'deleted_at', $precision = 0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('informasi_kontak');
    }
}
