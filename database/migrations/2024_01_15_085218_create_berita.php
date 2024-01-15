<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBerita extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('berita', function (Blueprint $table) {
            $table->char('BERITA_ID', 50)->primary();
            $table->char('USERS_ID', 50)->nullable();
            $table->char('BERITA_KATEGORI_ID', 50)->nullable();
            $table->string('BERITA_TITLE')->nullable();
            $table->string('BERITA_SLUG')->unique()->nullable();
            $table->longText('BERITA_KONTEN')->nullable();
            $table->string('BERITA_STATUS')->nullable();
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
        Schema::dropIfExists('berita');
    }
}
