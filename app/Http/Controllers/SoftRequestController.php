<?php namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesCommands;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Request;
use Response;
use App\Classes\Common;

class SoftRequestController extends BaseController {

	use DispatchesCommands, ValidatesRequests;


	/**
	* Get a the current date/cloud date and return it back to the software client for verification and
	* any other purposes
	*
	* @return Response
	*/
	public function getCloudDate()
	{
		$inputDate = Request::input('date');
		$books = array('response'=>Common::getDateToToday($inputDate));
  		return Response::json($books);
	}
}
