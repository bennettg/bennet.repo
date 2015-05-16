<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSoftwareTable extends Migration {

	public function up()
	{
		Schema::create('software', function(Blueprint $table) {
			$table->increments('id');
			$table->integer('user_id')->unsigned();
			$table->timestamps();
			$table->softDeletes();
			$table->string('soft_family', 4)->index();
			$table->string('soft_type')->index();
			$table->boolean('soft_status')->default(0);
			$table->date('soft_expire')->nullable()->index();
			$table->string('soft_reg_device_id', 4)->index();
			$table->string('soft_device_nickname')->nullable();
			$table->boolean('soft_reg_device_status')->default(0);
			$table->string('soft_activation_code');
			$table->string('soft_product_key')->nullable()->index();
			$table->string('soft_thumb_id')->nullable();
			$table->boolean('soft_authenticated_product');
			$table->string('soft_purchase_order')->nullable()->index();
			$table->string('soft_product')->unique();
			$table->boolean('soft_purchased_on_off');
		});
	}

	public function down()
	{
		Schema::drop('software');
	}
}