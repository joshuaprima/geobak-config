<?php
class functions {
 
    private $conn;
 
    // constructor
    function __construct() {
        require_once 'connection.php';
        // koneksi ke database
        $db = new connection();
        $this->conn = $db->connect();
    }
 
    // destructor
    function __destruct() {
         
    }
 
    public function addUser($name, $email, $password, $phone, $address, $date) {
        // $uuid = uniqid('', true);
        $hash = $this->hashSSHA($password);
        $encrypted_password = $hash["encrypted"]; // encrypted password
        // $salt = $hash["salt"]; // salt
 
        $stmt = $this->conn->prepare("INSERT INTO customer (name_customer,phone_customer,email_customer,password_customer,address_customer,date_join_customer) VALUES ('$name','$phone','$email','$password','$address','$date')");
        // $stmt->bind_param("sssss", $uuid, $nama, $email, $encrypted_password, $salt);
        $result = $stmt->execute();
        $stmt->close();
 
        // cek jika sudah sukses
        // if ($result) {
        //     $stmt = $this->conn->prepare("SELECT * FROM customer WHERE email = ?");
        //     $stmt->bind_param("s", $email);
        //     $stmt->execute();
        //     $user = $stmt->get_result()->fetch_assoc();
        //     $stmt->close();
 
        //     return $user;
        // } else {
        //     return false;
        // }
    }
 
    /**
     * Get user berdasarkan email dan password
     */
    // public function getUserByEmailAndPassword($email, $password) {
 
    //     $stmt = $this->conn->prepare("SELECT * FROM tbl_user WHERE email = ?");
 
    //     $stmt->bind_param("s", $email);
 
    //     if ($stmt->execute()) {
    //         $user = $stmt->get_result()->fetch_assoc();
    //         $stmt->close();
 
    //         // verifikasi password user
    //         $salt = $user['salt'];
    //         $encrypted_password = $user['encrypted_password'];
    //         $hash = $this->checkhashSSHA($salt, $password);
    //         // cek password jika sesuai
    //         if ($encrypted_password == $hash) {
    //             // autentikasi user berhasil
    //             return $user;
    //         }
    //     } else {
    //         return NULL;
    //     }
    // }
 
    /**
     * Cek User ada atau tidak
     */
    public function isUserExisted($email) {
        $stmt = $this->conn->prepare("SELECT email_customer from customer WHERE email = ?");
 
        $stmt->bind_param("s", $email);
 
        $stmt->execute();
 
        $stmt->store_result();
 
        if ($stmt->num_rows > 0) {
            // user telah ada 
            $stmt->close();
            return true;
        } else {
            // user belum ada 
            $stmt->close();
            return false;
        }
    }
 
    /**
     * Encrypting password
     * @param password
     * returns salt and encrypted password
     */
    // public function hashSSHA($password) {
 
    //     $salt = sha1(rand());
    //     $salt = substr($salt, 0, 10);
    //     $encrypted = base64_encode(sha1($password . $salt, true) . $salt);
    //     $hash = array("salt" => $salt, "encrypted" => $encrypted);
    //     return $hash;
    // }
 
    // /**
    //  * Decrypting password
    //  * @param salt, password
    //  * returns hash string
    //  */
    // public function checkhashSSHA($salt, $password) {
 
    //     $hash = base64_encode(sha1($password . $salt, true) . $salt);
 
    //     return $hash;
    // }
 
}
 
?>