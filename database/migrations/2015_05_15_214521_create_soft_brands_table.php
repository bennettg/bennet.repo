<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSoftBrandsTable extends Migration {

	public function up()
	{
		Schema::create('soft_brands', function(Blueprint $table) {
			$table->increments('soft_brand_id');
			$table->timestamps();
			$table->softDeletes();
			$table->string('code', 3)->unique();
			$table->string('brand_name')->unique();
		});
	}

	public function down()
	{
		Schema::drop('soft_brands');
	}
}