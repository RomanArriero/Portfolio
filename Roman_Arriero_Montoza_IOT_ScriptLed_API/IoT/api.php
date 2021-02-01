<?php

$gpio = $_POST['gpio'];
$status = $_POST['status'];

if(isset($gpio) and isset($status))
{
	exec("sudo python3 ../python/led.py ".$gpio." ".$status, $out);
	header("HTTP/1.0 200 Ok");
	header('Content-Type: application/json');
	$response = ['gpio' => $gpio, 'status' => $status, 'out' => $out];
	$response = json_encode($response);
}
else
{
	header("HTTP/1.0 400 Bad Request");
	header('Content-Type: application/json');
	$response = ['error' => 'parametros incorrectos'];
	$response = json_encode($response);
	echo $response;
}