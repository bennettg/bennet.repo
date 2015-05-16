<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Software extends Model {

	protected $table = 'software';
	public $timestamps = true;

	use SoftDeletes;

	protected $dates = ['deleted_at'];
	protected $fillable = array('soft_family', 'soft_type', 'soft_expire', 'soft_reg_device_id', 'soft_device_nickname', 'soft_activation_code', 'soft_product_key', 'soft_thumb_id', 'soft_purchase_order', 'soft_product');
	protected $visible = array('id', 'soft_family', 'soft_type', 'soft_status', 'soft_expire', 'soft_reg_device_id', 'soft_device_nickname', 'soft_activation_code', 'soft_product_key', 'soft_thumb_id', 'soft_purchase_order', 'soft_product');

	public function user()
	{
		return $this->belongsTo('User');
	}

	public function software()
	{
		return $this->hasMany('App\Software');
	}

}