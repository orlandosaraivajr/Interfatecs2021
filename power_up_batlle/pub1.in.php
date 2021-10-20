<?php
	$N_INI = 4;
	$N_END = 100;

	for ($i=$N_INI; $i <= $N_END; $i++) { 
		$f = fopen("in/".$i.".txt", "a"); 

		$N = random_int(1,60);
		$C = random_int(1,8);

		echo $N." ".$C."\n\n";

		fwrite($f, $N." ".$C."\n");

		for ($j=0; $j < $C; $j++)
		{
			$card_type = random_int(1,3); if ($j) fwrite($f, " ");

			switch ($card_type) {
				case 1:
					fwrite($f,"T");
					break;

				case 2:
					fwrite($f,"R");
					break;

				case 3:
					fwrite($f,"S");
					break;
				
			}
		}

		fwrite($f, "\n");

		fclose($f);  
	}
?>