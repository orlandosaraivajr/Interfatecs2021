<?php
	$N_INI = 39;
	$N_END = 39;

	
	for ($i=$N_INI; $i <= $N_END; $i++) { 
		exec("./pub1.o < in/".$i.".txt > out/".$i.".txt");
	}
?>