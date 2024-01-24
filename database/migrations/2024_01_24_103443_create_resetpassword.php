<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateResetpassword extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('resetpassword', function (Blueprint $table) {
            $table->char('RESET_ID', 50)->primary();
            $table->string('RESET_EMAIL')->nullable();
            $table->string('RESET_TOKEN')->nullable();
            $table->dateTime('RESET_EXPIRE_AT')->nullable();
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
        Schema::dropIfExists('resetpassword');
    }
}
