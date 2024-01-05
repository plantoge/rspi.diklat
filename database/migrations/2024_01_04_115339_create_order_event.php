<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderEvent extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_order', function (Blueprint $table) {
            $table->char('ORDER_ID', 50)->primary();
            $table->char('USERS_ID', 50)->nullable();
            $table->text('ORDER_CODE')->nullable();
            $table->biginteger('ORDER_TOTAL')->nullable();
            $table->text('ORDER_BUKTI')->nullable();
            $table->text('ORDER_STATUS')->nullable();

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
        Schema::dropIfExists('order_event');
    }
}
