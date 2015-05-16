<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SoftwareBrands extends Model {

	protected $table = 'soft_brands';
	public $timestamps = true;

	use SoftDeletes;

	protected $dates = ['deleted_at'];
	protected $fillable = array('code', 'brand_name');
	protected $visible = array('id', 'code', 'brand_name');

	public function brand_relationship()
	{
		return $this->hasOne('Software', 'soft_product_key');
	}

}