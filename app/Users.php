<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Users extends Model {

	protected $table = 'users';
	public $timestamps = true;

	use SoftDeletes;

	protected $dates = ['deleted_at'];
	protected $fillable = array('username', 'first_name', 'last_name', 'address1', 'address2', 'address3', 'state', 'zip', 'phone', 'mobile', 'email');
	protected $visible = array('id', 'username', 'first_name', 'last_name', 'address1', 'address2', 'address3', 'state', 'zip', 'phone', 'mobile', 'email');

	public function user_relationship()
	{
		return $this->belongsTo('Software', 'id', 'soft_id');
	}

}