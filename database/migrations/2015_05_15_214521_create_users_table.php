<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateUsersTable extends Migration {

	public function up()
	{
		Schema::create('users', function(Blueprint $table) {
			$table->increments('user_id');
			$table->timestamps();
			$table->softDeletes();
			$table->string('username')->index();
			$table->string('first_name');
			$table->string('last_name');
			$table->string('address1');
			$table->string('address2')->nullable();
			$table->string('address3')->nullable();
			$table->string('state');
			$table->string('zip', 10)->default('*****');
			$table->string('phone', 11);
			$table->string('mobile', 11);
			$table->string('email');
		});
	}

	public function down()
	{
		Schema::drop('users');
	}
}