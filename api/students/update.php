<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: PUT');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Access-Control-Allow-Methods,Content-Type,Authorization,X-Requested-With');


    include_once "../../config/Database.php";
    include_once "../../models/Student.php";

$database = new Database();
$db = $database->connection();

$student = new Student($db);

$res = json_decode(file_get_contents("php://input"));

$student->params = [];
$setParam="";
foreach ($res as $key=>$value) {
  if (isset($key) && $key != "student_id") {
      $setParam .= "`$key` = :$key,";
      $student->params[$key] = htmlspecialchars(strip_tags($value));
  }
}
$student->setParam = rtrim($setParam,",");

$student->student_id = $res->student_id;




if ($student->update()) {
	echo json_encode(array('message'=>'Student Updated'));
}else{
	echo json_encode(array('message'=> 'Student Not Updated'));
}
