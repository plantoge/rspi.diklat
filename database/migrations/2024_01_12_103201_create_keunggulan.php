<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKeunggulan extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('keunggulan', function (Blueprint $table) {
            $table->char('KEUNGGULAN_ID', 50)->primary();
            $table->string('KEUNGGULAN_FONTAWESOME')->nullable();
            $table->string('KEUNGGULAN_JUDUL')->nullable();
            $table->text('KEUNGGULAN_DESKRIPSI')->nullable();
            
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
        Schema::dropIfExists('keunggulan');
    }
}
