<?php

use Illuminate\Database\Seeder;
use App\Users;

class UsersTableSeeder extends Seeder {

	public function run()
	{
		//DB::table('users')->delete();

		// SeedUsersTable
		Users::create(array(
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