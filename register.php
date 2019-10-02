<?php
include('con.php');
header('Content-Type: application/json');
/**
User Registeration
 */
class Register
{
	private $db;
	private $connection;
	function __construct()
	{
		//constructor call
		$this->db = new Connection();
		$this->connection=$this->db->get_connection();
	}
	public function does_user_exist($name,$mail,$number,$add,$pass)
	{
		// does user already exist or not
		$query = "SELECT * FROM customer WHERE email_customer='$mail'";
		$result=mysqli_query($this->connection,$query);
		if(mysqli_num_rows($result)>0){
			$json['status']=400;
			$json['message']=' Fuck you '.$mail.' is already exist.';
			echo json_encode($json);
			mysqli_close($this->connection);
		}else {
			$query="insert into customer(name_customer, phone_customer, email_customer, password_customer, address_customer, date_join_customer) values('$name', '$number','$mail','$pass','$add',now())";
			$is_inserted=mysqli_query($this->connection,$query);
			if($is_inserted == 1){
				$json['status']=200;
				$json['email'] = $mail;
				$json['name'] = $name;
				$json['message']='Account created, Fuck you '.$name;
			}else {
				$json['status']=401;
				$json['message']='Something wrong';
			}
			echo json_encode($json);
			mysqli_close($this->connection);
		}
	}
}
$register=new Register();
if(isset($_POST['name'],$_POST['email'],$_POST['number'],$_POST['address'],$_POST['password']))
{
	$name=$_POST['name'];
	$mail=$_POST['email'];
	$number=$_POST['number'];
	$add=$_POST['address'];
	$pass=$_POST['password'];
	if (!empty($name) && !empty($mail) && !empty($number) && !empty($add) && !empty($pass)) {
		$encrypted_password=$pass;
		$register-> does_user_exist($name,$mail,$number,$add,$encrypted_password);
	}else {
		$json['status']=100;
		$json['message']='You must fill all the fields';
		echo json_encode($json);
	}
}

?>