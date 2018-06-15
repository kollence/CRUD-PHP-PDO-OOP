<?php

class Student
{
    private $conn;
    private $table = 'students';
    //Students table propertis
    public $student_id;
    public $first_name;
    public $last_name;
    public $email;
    public $street;
    public $city;
    public $state;
    public $zip;
    public $phone;
    public $birth_date;
    public $sex;
    public $params;
    public $setParam;
    // Constructor with DB
    public function __construct($db){
        $this->conn = $db;
    }

    public function read(){
        // Select QUERY to read all data
        $query = "SELECT
                    s.student_id,
                    CONCAT(s.first_name,' ',s.last_name) as name,
                    CONCAT(s.city,' ',s.state) as hometown,
                    AVG(sc.score) as avg_score
                  FROM $this->table as s
                  LEFT JOIN
                    scores as sc
                  ON
                    s.student_id = sc.student_id
                  GROUP BY s.student_id
                  ORDER BY avg_score DESC";
        // Prepare statment
        $stmt = $this->conn->prepare($query);
        //Execute query
        $stmt->execute();

        return $stmt;
    }

    public function read_single()
    {
        $query = 'SELECT * FROM '.$this->table.' WHERE student_id= ?';

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(1, $this->student_id);

        $stmt->execute();

        // return $stmt;

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->first_name = $row['first_name'];
        $this->last_name = $row['last_name'];
        $this->email = $row['email'];
        $this->street = $row['street'];
        $this->city = $row['city'];
        $this->state = $row['state'];
        $this->zip = $row['zip'];
        $this->phone = $row['phone'];
        $this->birth_date = $row['birth_date'];
        $this->sex = $row['sex'];
        $this->date_entered = $row['date_entered'];
        $this->student_id = $row['student_id'];

    }
// Found here !!!!!!!!!! https://phpdelusions.net/pdo_examples/dynamical_update
    public function create()
    {
        $query = 'INSERT INTO '.$this->table.'
                  SET '.$this->setParam;

        $stmt = $this->conn->prepare($query);


        if($stmt->execute($this->params)){
            return true;
        }

        printf("Error: %s.\n", $stmt->error);

        return false;
    }
// Found here !!!!!!!!!! https://phpdelusions.net/pdo_examples/dynamical_update
        public function update()
    {
        $query = 'UPDATE '.$this->table.'
                  SET '.$this->setParam.'
                  WHERE student_id = '.$this->student_id;

        $stmt = $this->conn->prepare($query);


        if($stmt->execute($this->params)){
            return true;
        }

        printf("Error: %s.\n", $stmt->error);

        return false;
    }

    public function delete()
    {
        $query= 'DELETE FROM '.$this->table.' WHERE student_id= ?';

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(1, $this->student_id);

        if ($stmt->execute()) {
            return true;
        }

        printf("Error: %s.\n", $stmt->error);

        return false;
    }

}
