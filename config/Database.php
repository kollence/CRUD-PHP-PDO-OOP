<?php

class Database
{
    private $conn;
    private $host = "localhost";
    private $name = "root";
    private $pass = "";
    private $db = "school";

    // DB connection
    public function connection(){

        $this->conn = null;

        try{
            $this->conn = new PDO('mysql:host='. $this->host .';dbname='.$this->db, $this->name, $this->pass);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }catch(PDOException $e){
            echo 'Connection is not working with the Base becouse: '. $e->getMessage() ;
        }

        return $this->conn;
    }

}
