<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SoftSubscription extends Model {

	protected $table = 'soft_subscription';
	public $timestamps = true;

	use SoftDeletes;

	protected $dates = ['deleted_at'];
	protected $visible = array('subscr_type');

	public function software_relationship()
	{
		return $this->belongsTo('Software', 'soft_status', 'soft_id', 'soft_status', 'soft_expire');
	}

}