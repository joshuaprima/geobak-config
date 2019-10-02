<?php
	define('HOST','localhost');
 	define('USER','fuckuphpmyadmin');
	define('PASS','fuckpass');
 	define('DB','dbgeobak');
 
 //membuat koneksi dengan database
 $con = mysqli_connect(HOST,USER,PASS,DB) or die('Unable to Connect');
	?>