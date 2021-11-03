<?php
	$N_IN = 50;

	
	for ($i=1; $i <= $N_IN; $i++) { 
		exec("./resgate.o < in/".$i.".txt > out/".$i.".txt");
	}
?>