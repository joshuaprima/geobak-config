<?php

include_once 'connection.php';

$response = array("error" => FALSE);

if (isset($_POST['email']) && isset($_POST['name']) && isset($_POST['phone']) && isset($_POST['address']) && isset($_POST['password'])) {
		
		$email = $_POST['email'];
		$name = $_POST['name'];
		$phone = $_POST['phone'];
		$address = $_POST['address'];
		$password = $_POST['password'];
 
    $sql = $con->execute("SELECT email_customer from customer WHERE email_customer = '$email'");

    if(mysqli_num_rows($sql) > 0) {
  		$response["error"] = TRUE;
        $response["message"] = "User already existed";

        echo json_encode($response);
    }else{
     	$sql = $con->execute("INSERT INTO customer (name_customer,phone_customer,email_customer,password_customer,address_customer,date_join_customer) VALUES ('$name','$phone','$email','$password','$address', NOW())"); 

     	if($sql) {
         $response["error"] = FALSE;
         $response["message"] = "Register Successfull";

   		 echo json_encode($response);
     	} else {
      	 $response["error"] = TRUE;
         $response["message"] = "Register Failure";

   		 echo json_encode($response);
     }  
    }
    
}
?>