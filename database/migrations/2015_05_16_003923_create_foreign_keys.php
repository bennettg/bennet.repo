<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Eloquent\Model;

class CreateForeignKeys extends Migration {

	public function up()
	{
		Schema::table('software', function(Blueprint $table) {
			$table->foreign('user_id')->references('id')->on('user')
						->onDelete('restrict')
						->onUpdate('no action');
		});
	}

	public function down()
	{
		Schema::table('software', function(Blueprint $table) {
			$table->dropForeign('software_user_id_foreign');
		});
	}
}