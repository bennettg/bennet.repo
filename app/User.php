<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class User extends Model {

	protected $table = 'user';
	public $timestamps = true;

	use SoftDeletes;

	protected $dates = ['deleted_at'];
	protected $guarded = array('password');
	protected $fillable = array('username', 'first_name', 'last_name', 'address1', 'address2', 'address3', 'state', 'zip', 'phone', 'mobile', 'email');
	protected $visible = array('id', 'username', 'first_name', 'last_name', 'address1', 'address2', 'address3', 'state', 'zip', 'phone', 'mobile', 'email');
	protected $hidden = array('password');

}