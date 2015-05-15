<?php

use Illuminate\Database\Seeder;
use App\SoftwareProducts;

class SoftwareProductsTableSeeder extends Seeder {

	public function run()
	{
		//DB::table('soft_products')->delete();

		// SeedQuiltersCreativeTouch
		SoftwareProducts::create(array(
				'soft_product_code' => QCT,
				'soft_product_name' => Quilters Creative Touch,
				'soft_product_type' => base
			));

		// SeedQCTBasicUpgrade
		SoftwareProducts::create(array(
				'soft_product_code' => UPG,
				'soft_product_name' => QCT Basic Upgrade,
				'soft_product_type' => addon
			));

		// SeedQCTGold
		SoftwareProducts::create(array(
				'soft_product_code' => SQC,
				'soft_product_name' => QCT Gold,
				'soft_product_type' => subscription
			));

		// SeedQuiltersCreativeTouchF
		SoftwareProducts::create(array(
				'soft_product_code' => FUL,
				'soft_product_name' => Quilters Creative Touch Foundation,
				'soft_product_type' => base
			));

		// SeedQuiltersCreativeTouchB
		SoftwareProducts::create(array(
				'soft_product_code' => LIM,
				'soft_product_name' => Quilters Creative Touch Basic,
				'soft_product_type' => base
			));

		// SeedQCTBeginningsBronze
		SoftwareProducts::create(array(
				'soft_product_code' => QBB,
				'soft_product_name' => QCT Begginings Bronze,
				'soft_product_type' => base
			));

		// SeedQCTBeginningsSilver
		SoftwareProducts::create(array(
				'soft_product_code' => SQB,
				'soft_product_name' => QCT Beginnings Silver,
				'soft_product_type' => subscription,
				'term_semi_yearly' => 1
			));

		// SeedQCTBeginningsGold
		SoftwareProducts::create(array(
				'soft_product_code' => GQB,
				'soft_product_name' => QCT Beginnings Gold,
				'soft_product_type' => subscription,
				'term_monthly' => 1,
				'term_quarterly' => 1
			));

		// SeedQCTBeginningsUpgradeGold
		SoftwareProducts::create(array(
				'soft_product_code' => QBU,
				'soft_product_name' => QCT Beginnings Gold Upgrade,
				'soft_product_type' => addon,
				'term_monthly' => 1,
				'term_quarterly' => 1
			));

		// SeedQCTBeginningsUpgradeBronze
		SoftwareProducts::create(array(
				'soft_product_code' => UBB,
				'soft_product_name' => QCT Beginnings Bronze Upgrade,
				'soft_product_type' => subscription,
				'term_quarterly' => 1
			));

		// SeedQCTBeginningsUpgradeSilver
		SoftwareProducts::create(array(
				'soft_product_code' => UBS,
				'soft_product_name' => QCT Beginnings Silver Upgrade,
				'soft_product_type' => subscription,
				'term_quarterly' => 1,
				'term_semi_yearly' => 1
			));

		// SeedQCTBeginningsUpgradePlatnum
		SoftwareProducts::create(array(
				'soft_product_code' => UBP,
				'soft_product_name' => QCT Beginnings Platinum Upgrade,
				'soft_product_type' => subscription,
				'term_monthly' => 1
			));

		// SeedQCTBeginningsPlatnum
		SoftwareProducts::create(array(
				'soft_product_code' => QBP,
				'soft_product_name' => QCT Beginnings Platnum,
				'soft_product_type' => subscription,
				'term_monthly' => 1
			));

		// SeedQuiltersCreativeDesignBronze
		SoftwareProducts::create(array(
				'soft_product_code' => DSB,
				'soft_product_name' => Quilters Creative Design Bronze,
				'soft_product_type' => base
			));

		// SeedSoftwareDemo
		SoftwareProducts::create(array(
				'soft_product_code' => DEM,
				'soft_product_name' => Software Demo,
				'soft_product_type' => demo
			));
	}
}