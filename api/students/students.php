<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

    include_once "../../config/Database.php";
    include_once "../../models/Student.php";
// Instance of BASE and CONNECTION
$database = new Database();
$db = $database->connection();
// Instance of MODEL
$student = new Student($db);
// MODEL method for read all selected
$result = $student->read();
// Count rows of result
$num = $result->rowCount();
// if have rows in result
if ($num > 0) {
    // initialize array variable
    $students_arr = array();
    $students_arr['students'] = array();

    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        // extract help with $row['id'] in $id
        extract($row);
        $students_item = array(
           'id'=>$student_id,
           'name'=>$name,
           'hometown'=>$hometown,
           'avg_score'=>$avg_score
        );
        array_push($students_arr['students'], $students_item);
    }

    echo json_encode($students_arr);

}else {
    echo json_encode(array("message"=>"NO DATA, nada, zero, none"));
}
