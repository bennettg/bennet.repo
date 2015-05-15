<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class DatabaseSeeder extends Seeder {

	public function run()
	{
		Model::unguard();

		$this->call('UsersTableSeeder');
		$this->command->info('Users table seeded!');

		$this->call('SoftwareBrandsTableSeeder');
		$this->command->info('SoftwareBrands table seeded!');

		$this->call('SoftwareProductsTableSeeder');
		$this->command->info('SoftwareProducts table seeded!');

		$this->call('SubscriptionTypesTableSeeder');
		$this->command->info('SubscriptionTypes table seeded!');
	}
}