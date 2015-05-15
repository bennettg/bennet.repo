<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSoftProductsTable extends Migration {

	public function up()
	{
		Schema::create('soft_products', function(Blueprint $table) {
			$table->increments('soft_prod_id');
			$table->softDeletes();
			$table->timestamps();
			$table->string('soft_product_code', 3)->unique();
			$table->string('soft_product_name')->index();
			$table->string('soft_product_type')->index();
			$table->boolean('term_monthly')->default(0);
			$table->boolean('term_quarterly')->default(0);
			$table->boolean('term_semi_yearly')->default(0);
		});
	}

	public function down()
	{
		Schema::drop('soft_products');
	}
}