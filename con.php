<?php
    require_once 'config.php';
    class Connection{
        private $connect;
        function __construct()
        {
            $this->connect = mysqli_connect(hostname, user, password, db_name) or die("FUCK YOU");
        }

        public function get_connection(){
            return $this->connect;
        }
    }
    ?>
