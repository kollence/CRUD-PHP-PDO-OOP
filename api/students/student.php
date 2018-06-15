<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

    include_once "../../config/Database.php";
    include_once "../../models/Student.php";

$database = new Database();
$db = $database->connection();

$student = new Student($db);

$student->student_id = isset($_GET['id']) ? $_GET['id'] : die();

$student->read_single();

$data_arr = array(
	'id'=>$student->student_id,
	'name' => $student->first_name.' '.$student->last_name,
	'hometown' => $student->city.' '.$student->state.' '.$student->zip.' '.$student->phone
);

print_r(json_encode($data_arr));
