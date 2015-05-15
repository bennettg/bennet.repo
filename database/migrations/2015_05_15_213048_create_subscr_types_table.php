<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSubscrTypesTable extends Migration {

	public function up()
	{
		Schema::create('subscr_types', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->string('subsc_name')->index();
			$table->string('subsc_term_months', 2);
		});
	}

	public function down()
	{
		Schema::drop('subscr_types');
	}
}