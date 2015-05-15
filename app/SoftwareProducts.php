<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SoftwareProducts extends Model {

	protected $table = 'soft_products';
	public $timestamps = true;

	use SoftDeletes;

	protected $dates = ['deleted_at'];
	protected $fillable = array('soft_product_code', 'soft_product_name', 'soft_product_type');
	protected $visible = array('soft_product_code', 'soft_product_name', 'soft_product_type', 'term_monthly', 'term_quarterly', 'term_semi_yearly');

	public function software_product_relation()
	{
		return $this->belongsTo('Software', 'soft_product');
	}

}