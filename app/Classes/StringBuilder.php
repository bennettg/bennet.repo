<?php
namespace App\Classes;


class StringBuilder {
	
	private $string;
	
	public function __construct () {
		$this->string = array();
	}
			
	public function add ($push_string) {
		array_push($this->string,$push_string);
		return true;
	}
	
	public function joinString (){
		return implode("",$this->string);
	}
}
	

?>