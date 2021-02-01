<?php

$valores = array();

$max_num = 10;
for ($x=0;$x<$max_num;$x++) {
	$num_aleatorio = rand(1,100);
	array_push($valores,$num_aleatorio);
}
for ($x=0;$x<count($valores);$x++)
    echo $valores[$x]."<br/>";

