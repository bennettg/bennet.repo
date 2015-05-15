<?php

use Illuminate\Database\Seeder;
use App\SoftwareBrands;

class SoftwareBrandsTableSeeder extends Seeder {

	public function run()
	{
		//DB::table('soft_brands')->delete();

		// SeedBabylock
		SoftwareBrands::create(array(
				'code' => BAB,
				'brand_name' => Babylock
			));

		// SeedBlockRockit
		SoftwareBrands::create(array(
				'code' => BKR,
				'brand_name' => Block Rockit
			));

		// SeedBrandAPQS
		SoftwareBrands::create(array(
				'code' => APQ,
				'brand_name' => APQS
			));

		// SeedBernina
		SoftwareBrands::create(array(
				'code' => BER,
				'brand_name' => Bernina
			));

		// SeedJanome
		SoftwareBrands::create(array(
				'code' => JAN,
				'brand_name' => Janome
			));

		// SeedJuki
		SoftwareBrands::create(array(
				'code' => JUK,
				'brand_name' => Juki
			));

		// SeedNolting
		SoftwareBrands::create(array(
				'code' => NOL,
				'brand_name' => Nolting
			));

		// SeedQuiltMotion
		SoftwareBrands::create(array(
				'code' => QMO,
				'brand_name' => Quilt Motion
			));

		// SeedTailorBird
		SoftwareBrands::create(array(
				'code' => TAI,
				'brand_name' => Tailor Bird
			));

		// Design
		SoftwareBrands::create(array(
				'code' => QCD,
				'brand_name' => Quilt CAD Design
			));
	}
}