<?php
	$N_IN = 50;

	for ($i=1; $i <= $N_IN; $i++) { 
		$f = fopen("in/".$i.".txt", "a"); 

		$N = random_int(3,50);
		$INI = random_int(1,$N);

		$FIM = $INI;

		while ($FIM == $INI)
			$FIM = random_int(1,$N);

		fwrite($f, $N." ".$INI." ".$FIM."\n");

		$NT = random_int(1,$N);

		fwrite($f, $NT."\n");

		$NT_array = [];		 

		for ($j=0; $j < $NT; $j++)
		{
			$Q = random_int(1,$N);

			while (in_array($Q, $NT_array))
				$Q = random_int(1,$N);

			array_push($NT_array, $Q);
		} 

		fwrite($f, $NT_array[0]);

		for ($j=1; $j < $NT; $j++)
		{

			fwrite($f, " ".$NT_array[$j]);	
		}

		fwrite($f, "\n");

		$NP = random_int(1,$N*($N-1)/2);

		fwrite($f, $NP."\n");	

		for ($j=0; $j < $NP; $j++)
		{
			$A = random_int(1,$N);

			$B = $A;

			while ($A == $B)
				$B = random_int(1,$N);

			fwrite($f, $A." ".$B."\n");	
		}

		fclose($f);  
	}
?>