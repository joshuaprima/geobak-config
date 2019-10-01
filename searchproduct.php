<?php

	$search = $_GET['search'];
	require_once('connection.php');
	
	//Membuat SQL Query
	$sql = "SELECT * FROM products INNER JOIN seller ON products.id_product = seller.id_product WHERE name_product LIKE '%$search%'";
	
	//Mendapatkan Hasil
	$r = mysqli_query($con,$sql);
	
	//Membuat Array Kosong 
	$result = array();
	
	while($row = mysqli_fetch_array($r)){
		
		//Memasukkan Nama produk, penjual, harga kedalam Array Kosong yang telah dibuat 
		array_push($result,array(
		"productname"=>$row['name_product'],
		"sellername"=>$row['name_seller'],
		"unitprice"=>$row['price_unit']
		));
	}
	
	//Menampilkan Array dalam Format JSON
	echo json_encode(array('result'=>$result));
	
	mysqli_close($con);
?>