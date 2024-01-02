<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEvents extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->char('EVENT_ID', 50)->primary();
            $table->text('EVENT_JUDUL')->nullable();
            $table->text('EVENT_SLUG')->nullable();
            $table->text('EVENT_DESKRIPSI_SINGKAT')->nullable();
            $table->text('EVENT_DESKRIPSI_PANJANG')->nullable();
            $table->string('EVENT_KATEGORI')->nullable();
            $table->biginteger('EVENT_HARGA')->nullable();
            $table->text('EVENT_GAMBAR')->nullable();
            $table->string('EVENT_ACTIVE')->nullable();

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
        Schema::dropIfExists('events');
    }
}
