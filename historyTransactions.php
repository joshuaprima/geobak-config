<?php

	$gmail = $_POST['email'];
	require_once('connection.php');
	
	//Membuat SQL Query
	$sql = "SELECT * FROM master_transaction INNER JOIN detail_transaction INNER JOIN products INNER JOIN seller INNER JOIN customer ON master_transaction.id_transaction = detail_transaction.id_transaction = products.id_product = seller.id_product = customer.id_customer WHERE email_customer LIKE '%$gmail%'";
	
	//Mendapatkan Hasil
	$r = mysqli_query($con,$sql);
	
	//Membuat Array Kosong 
	$result = array();
	
	while($row = mysqli_fetch_array($r)){
		
		//Memasukkan Nama produk, penjual, harga kedalam Array Kosong yang telah dibuat 
		array_push($result,array(
		"name_product"=>$row['name_product'],
		"name_seller"=>$row['name_seller'],
		"price"=>$row['price'],
		"date_transaction"=>$row['date_transaction'],
		"time_transaction"=>$row['time_transaction'],
		"image"=>$row['image']
		));
	}
	
	//Menampilkan Array dalam Format JSON
	echo json_encode(array('hasil'=>$result));
	
	mysqli_close($con);
?>