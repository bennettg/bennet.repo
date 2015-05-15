<?php

use Illuminate\Database\Seeder;
use App\SubscriptionTypes;

class SubscriptionTypesTableSeeder extends Seeder {

	public function run()
	{
		//DB::table('subscr_types')->delete();

		// SeedBronze
		SubscriptionTypes::create(array(
				'subsc_name' => Bronze,
				'subsc_term_months' => 12
			));

		// SeedSilver
		SubscriptionTypes::create(array(
				'subsc_name' => Silver,
				'subsc_term_months' => 6
			));

		// SeedGold
		SubscriptionTypes::create(array(
				'subsc_name' => Gold,
				'subsc_term_months' => 3
			));

		// SeedPlatnum
		SubscriptionTypes::create(array(
				'subsc_name' => Platnum,
				'subsc_term_months' => 1
			));
	}
}