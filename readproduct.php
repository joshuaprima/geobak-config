<?php
	require_once('connection.php');
	
	//Membuat SQL Query
	$sql = "SELECT * FROM products INNER JOIN seller ON products.id_product = seller.id_product";
	
	//Mendapatkan Hasil
	$r = mysqli_query($con,$sql);
	
	//Membuat Array Kosong 
	$result = array();
	
	while($row = mysqli_fetch_array($r)){
		
		//Memasukkan Nama produk, penjual, harga kedalam Array Kosong yang telah dibuat 
		array_push($result,array(
            "name_product"=>$row['name_product'],
            "name_seller"=>$row['name_seller'],
            "price_unit"=>$row['price_unit'],
            "rating" => $row["rating"],
            "latitude" => $row["latitude"],
            "longitude" => $row["longitude"],
            "image" => $row["image"]
		));
	}
	
	//Menampilkan Array dalam Format JSON
	echo json_encode(array('result'=>$result));
	
	mysqli_close($con);
?>