<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateItemorderEvent extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_itemorder', function (Blueprint $table) {
            $table->char('ITEMORDER_ID', 50)->primary();
            $table->char('ORDER_ID', 50)->nullable();
            $table->text('ITEMORDER_JUDUL_DIPILIH')->nullable();
            $table->biginteger('ITEMORDER_HARGA_DIPILIH')->nullable();
            $table->biginteger('ITEMORDER_DISKON_DIPILIH')->nullable();

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
        Schema::dropIfExists('itemorder_event');
    }
}
