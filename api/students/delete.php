<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: DELETE');
header('Access-Control-Allow-Headers:
 		Access-Control-Allow-Headers,
 		Access-Control-Allow-Methods,
 		Content-Type,Authorization,
 		X-Requested-With');


    include_once "../../config/Database.php";
    include_once "../../models/Student.php";

$database = new Database();
$db = $database->connection();

$student = new Student($db);

$res = json_decode(file_get_contents("php://input"));

$student->student_id = $res->id;

if ($student->delete()) {
	echo json_encode(array('message'=>'Student Deleted'));
}else{
	echo json_encode(array('message'=> 'Student Has Not Been Deleted'));
}
