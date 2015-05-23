<?php
namespace App\Classes;
use StringBuilder;

class SKeyMaker {
	private $DATA = array();
	
	public function __construct ($DATA) {
		$this->DATA = $DATA;
	}
	
	public function doString() {
		$keyBits = new StringBuilder();

		
		$keyBits->add($this->s32StringToBin($this->DATA['mDevID']));
		$keyBits->add($this->DATA['mPage']); //8 bits
		$keyBits->add($this->DATA['mConfigs']); //42 bits
		$keyBits->add($this->DATA['mRemove']);
		$keyBits->add($this->decToBin($this->DATA['mTimeStamp'],14));
		$keyBits->add($this->decToBin($this->DATA['mCountDown'],14));
		$keyBits->add($this->DATA['mNature']); 
		
		$keyBase = $keyBits->joinString();

		$crc = $this->getSubCRC($this->makeSha1($keyBase));
		$mask = $this->hexStringToBin($this->makeSha1($crc));
	
		$doString = $this->xOrBin($keyBase, substr($mask,20)) . $this->hexStringToBin($crc); //substr starts at 0. 21=20
		
		$doString = $this->binStringToS32($doString);
		$doString = $this->insertSpaces($doString);
		$this->spitString($doString);
	}
	
	public function spitString($s) {
		echo $s;
	}
	
/*	public static function bin ($input) {
		//$output = decbin(hexdec(pack($input)));
		//return $output;
		$value = unpack('H*', $input);
		return base_convert($value[1], 16, 2);
	}

	public static function binToBin ($b){
		return pack('H*', base_convert($b, 2, 16));
	}
*/
	public function numberToBin ($n) {
		$b = "";
		
			for($i=0;$i<strlen($n);$i++){
				$b.=$this->nToBin(substr($n,$i,1));
			}
		return $b;
	}
	
	public function makeSha1 ($s) {
		return strtoupper(sha1($s));	
	}
	
	public function nToBin ($n) {
		switch($n){
			case("0"):
				$b = "00000";
			break;
			case("1"):
				$b = "00001";
			break;
			case("2"):
				$b = "00010";
			break;
			case("3"):
				$b = "00011";
			break;
			case("4"):
				$b = "00100";
			break;
			case("5"):
				$b = "00101";
			break;
			case("6"):
				$b = "00110";
			break;
			case("7"):
				$b = "00111";
			break;
			case("8"):
				$b = "01000";
			break;
			case("9"):
				$b = "01001";
			break;
		}					
	}
	
	public function s32StringToBin ($s) {
		$s32bin = "";
		
		for ($i=0; $i < strlen($s); $i++){
			$s32bin = $s32bin . $this->s32ToBin(substr($s, $i, 1));
		}
		
		return $s32bin;
	}
	
	public function s32ToBin ($s) {
		$t = "";
		$n = 0;
		
		$t = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
		$n = strpos($t, $s);
		
		$s32ToBin = $this->decToBin($n, 5);
		
		return $s32ToBin;
	}
	
	public function binStringToS32 ($b) {
		$binStringToS32 = "";
					
		for($i = 0; $i < strlen($b); $i=$i+5){
			$s = substr($b, $i, 5);
			
			if(strlen($s) < 5) $s = $s.(5 - strlen($s)); //??
			
			$binStringToS32 = $binStringToS32 . $this->binToS32(substr($b, $i, 5));
		}
		
		return $binStringToS32;
	}
	
	public function binToS32 ($b) {
		
		$t = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
		$n = $this->binToDec($b);
		
		//die($t."<br/>".$n.'<br/>'.$b);
		$binToS32 = substr($t, $n, 1);
		return $binToS32;
	}
	
		
	public function decToBin ($s, $dlength) {
		$t = "";			
		$n = intval($s);
		
		while($n > 0) {
			if(($n % 2)== 1) {
				$t = "1".$t;
			}else{
				$t = "0".$t;
			}
			
			$n = intval($n / 2);
		}
		
		while (strlen($t) < $dlength) {
			$t = "0".$t; //append more zeroes to $t until it has reached the desired padding
		}
		
		return $t;
	}
	
	public function binToHex ($b) {
		$n = 0;
		
		if(strlen($b) < 4) {
			$b = $b . (4 - strlen($b));
		}
		
		$t = "0123456789ABCDEF";
		$n = $this->binToDec($b);
		
		$binToHex = substr(t, $n+1, 1);
		return $binToHex;
	}
	
	
	public function hexStringToBin ($h) {
		$bary = array(strlen($h));
		
		for($i = 0; $i < strlen($h); $i++){
			$bary[$i] = $this->hexToBin(substr($h, $i, 1));
		}
		
		$hexStringToBin = join("",$bary);
		return $hexStringToBin;
	}
	
	public function hexToBin ($h) {
		$n = 0;
			$h = strtoupper($h);
		$t = "0123456789ABCDEF";
		$n = strpos($t, $h); 
			
		$hexToBin = $this->decToBin($n, 4);
		return $hexToBin;
	}
		
	public function insertSpaces ($s) {
		$s1 = "";
		$spaceCount = 0;
		
		for($i = 0; $i < strlen($s); $i++){
			$s1 = $s1.substr($s, $i, 1);
			$spaceCount = $spaceCount + 1;
			if ($spaceCount == 5) {
				$s1 = $s1. " ";
				$spaceCount = 0;
			}	
		}
			
		$insertedSpaces = trim($s1);
		return $insertedSpaces;
	}
	
	public function binToDec ($b) {
		$n = 0;
		
		for ($i = 0; $i < strlen($b); $i++){
			$n = 2 * $n + (intval(substr($b,$i,1)));
		}
		$binToDec = $n;
		return $binToDec;
	}
	
	public function xOrBin ($b, $mask) {
		
		$xOrBin = "";
		
		for($i = 0,$j = 0; $i < strlen($b); $i++,$j++) {
			switch(substr($b, $i, 1).substr($mask, $j, 1)){
				case("00"):
					$xOrBin = $xOrBin."0";
				break;
				case("11"):
					$xOrBin = $xOrBin."0";
				break;
				case("01"):
					$xOrBin = $xOrBin."1";
				break;
				case("10"):
					$xOrBin = $xOrBin."1";
				break;
			}
		
			if($j > strlen($mask)) $j = 0; //if j is bigger then the length of mask, repeat (start over)
		}			
		return $xOrBin;
	}
	
	public function getSubCRC ($crc) {
		//string base starts at 0 so we go one down	
		$s = substr($crc, 6, 1)  .
			 substr($crc, 17, 1) .
			 substr($crc, 8, 1)  .
			 substr($crc, 38, 1) .
			 substr($crc, 30, 1) .
			 substr($crc, 25, 1) ;
			 
		$getSubCRC = $s;
		return $getSubCRC;
	}

}
?>
