<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubscriptionTypes extends Model {

	protected $table = 'subscr_types';
	public $timestamps = true;

	use SoftDeletes;

	protected $dates = ['deleted_at'];
	protected $visible = array('subsc_name', 'subsc_term_months');

	public function subsc_type_relations()
	{
		return $this->belongsTo('SoftSubscription', 'subscr_type')->withPivot('subsc_name');
	}

}