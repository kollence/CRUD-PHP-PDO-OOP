<?php


$json = '{"student_id":"3","first_name":"zoltan","last_name":"nemtudom","city":"Belgrade","zip":"41111","state":"HUN"}';
$take = json_decode($json);
$params = [];
$str="";
foreach ($take as $key=>$value) {
  if (isset($key) && $key != "student_id") {
      $str .= "`$key` = :$key,";
      $params[$key] = $value;
  }
}
$str = rtrim($str,",");
$params['student_id'] = $take->student_id;
print_r($str).'<br>';

print_r($params);
// $res = array();
// foreach ($take as $value) {
//   if (!empty($value)) {
//     array_push($res,$value);
//   }
// }
// print_r(array_values($res));
 ?>
