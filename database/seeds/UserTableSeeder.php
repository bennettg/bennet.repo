<?php

use Illuminate\Database\Seeder;
use App\User;

class UserTableSeeder extends Seeder {

	public function run()
	{
		//DB::table('user')->delete();

		// SeedUsersTable
		User::create(array(
				'username' => phillip,
				'first_name' => phillip,
				'last_name' => madsen,
				'address1' => 65465 ddd,
				'state' => UT,
				'zip' => 84047,
				'phone' => 8012602669,
				'mobile' => 8012602669,
				'email' => phillip@graceframe.com
			));
	}
}