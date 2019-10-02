<?php

include('con.php');
header('Content-Type: application/json');

/**
 * User Registeration
 */
class Login
{
    private $db;
    private $connection;

    function __construct()
    {
        //constructor call
        $this->db = new Connection();
        $this->connection = $this->db->get_connection();
    }

    public function check_user_exist($mail, $pass)
    {
        // does user already exist or not
        $query = "SELECT * FROM customer WHERE email_customer='$mail' AND password_customer='$pass'";
        $result = mysqli_query($this->connection, $query);
        if (mysqli_num_rows($result) > 0) {
            $json['status'] = 200;
            $json['message'] = 'Login success!';
            $json['email'] = $mail;
            echo json_encode($json);
            mysqli_close($this->connection);
        } else {
                $json['status'] = 400;
                $json['message'] = "Email & Password not match";
            echo json_encode($json);
            mysqli_close($this->connection);
        }
    }
}

$register = new Login();
if (isset($_POST['email'], $_POST['password'])) {
    $mail = $_POST['email'];
    $pass = $_POST['password'];
    if (!empty($mail) && !empty($pass)) {
        $register->check_user_exist($mail, $pass);
    } else {
        $json['status'] = 100;
        $json['message'] = 'You must fill all the fields';
        echo json_encode($json);
    }
}

