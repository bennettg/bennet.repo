<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class InstalledSoftware extends Model {

	protected $table = 'installed_software';
	public $timestamps = true;

	use SoftDeletes;

	protected $dates = ['deleted_at'];

	public function software()
	{
		return $this->hasMany('Software', 'soft_product');
	}

}