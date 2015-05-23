<?php
namespace App\Classes;
 
class ProductKey {
	private $DATA = array();
	
	public function __construct ($DATA) {
		$this->DATA = $DATA;
	}
	
	
	public function decipher() {
		
		/*
		 * Are we cutting off the branding or just extracting it? (APQ) / APQ5 B8TM 7EES QNRE  
		 */
		$productKey = str_replace(" ","",$this->DATA['productKey']);

		$productBrandingCode = substr($productKey,0,3); //keep the branding
		$mPage = $this->DATA['mPage'];
		$productKey = substr($productKey,3); //keep the remaining product key

		##return array('productKey'=>$productKey,'brandCode'=>$productBrandingCode);
		
		$crc = substr($productKey,-4);
		
		##return array('crc'=>$crc);
		
		$crcBin = $this->s32StringToBin($crc);
		
		##return array('crcBin'=>$crcBin);
		//$return[] = $crcBin;
		
		$flashMask = $this->makeFlashMask($crcBin);//CONVERT CRC TO BINARY MASK
		
		##return array('flashMask'=>$flashMask);
		
		$coreBits = $this->s32StringToBin($productKey);
					
		##return array($coreBits);
					
		$coreBits = $this->xOrBin($coreBits,$flashMask);
		$coreBits = substr($coreBits, 0,55);
					
		##return array($coreBits);
		
		//create another CRC with the above bits and the brand
		$crcTestBin = $this->makeFlashCRC($productBrandingCode.$coreBits); //OR .$productKeyBin depending on which *above*
		
		##$return[] = $crcTestBin;
		
		##return $return;
		
		if($crcTestBin != $crcBin) {
			throw new Exception("CRC MISMATCH");
		}

			
		$mPage = substr($coreBits, 0, 8);		
		$productID = $this->binStringToS32(substr($coreBits,8,15));
		$productID = $this->s32ToProductID($productID);
		
		$pAuthID = $this->binStringToS32(substr($coreBits,23,27)); //This is what we will use verify how many machines this was installed on
		$pAuthenticated = substr($coreBits,50,1);
		$pDupGuard = substr($coreBits,51);
	
		return array(
			'brand' => $productBrandingCode,
			'mpage' => $mPage,
			'product_id' => $productID,
			'flash_id' => $pAuthID,
			'authenticated' => $pAuthenticated,
			'dup_guard' => $pDupGuard
		);

		//$this->spitString($doString);
	}
	
	public function spitString($s) {
		echo $s;
	}
	
	public function numberToBin ($n) {
		$b = "";
		
			for($i=0;$i<strlen($n);$i++){
				$b.=$this->nToBin(substr($n,$i,1));
			}
		return $b;
	}
	
	
	private function s32ToProductID($pGUID) {
	    //should be UDID I believe
	    /*
		 *  Converts the s32 string characters to GUID characters.
	     *	The GUID is a special case base-32 character string that contains
	     *	all alpha characters and digits 0-5. If the GUID contains an
	     *  invalid character, "---" returned to flag the error.
		 */
	   	$s32ConvList = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
		$guiConvList = "ABCDEFGHIJKLMNOPQRSTUVWXYZ012345";
	    
	    $s32ToGUID = "";
	   	$p = 0;
		
		for($i=0; $i<strlen($pGUID);$i++) {
			$p = strpos($s32ConvList, substr($pGUID, $i, 1));
		        if($p == -1)
		            return "---";
				        
			$s32ToGUID = $s32ToGUID.substr($guiConvList, $p, 1);
		}
		
		return $s32ToGUID;
	}

	
	public function makeSha1 ($s) {
		return strtoupper(sha1($s));	
	}
	
	public function nToBin ($n) {
		//used
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
		//used
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
	
	private function makeFlashCRC($inputs) {
	    //Returns 20 bit CRC binary string
	    return substr($this->hexStringToBin(sha1($inputs)), 42, 20);
	}
	
	private function makeFlashMask($binCRC) {
	   // returns mask binary string
	    return substr($this->hexStringToBin(sha1($binCRC)), 12);
	}

}
?>