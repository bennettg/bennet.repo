<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSoftSubscriptionTable extends Migration {

	public function up()
	{
		Schema::create('soft_subscription', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->string('subscr_type')->default(' ');
		});
	}

	public function down()
	{
		Schema::drop('soft_subscription');
	}
}