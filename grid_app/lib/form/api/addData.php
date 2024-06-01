<?php

include_once 'config.php';

if($_SERVER["REQUEST_METHOD"] == "POST"){
    $data =json_decode(file_get_contents('php://input'),true);

    $name = $data["name"];
    $email =$data["email"];
    $password =$data["password"];


   $sql ="INSERT INTO flutter_api(name,email,password) VALUES ('$name','$email','$password')";
   $result =mysqli_query($conn,$sql);
   if($result){
    http_response_code(200);
    echo json_encode(array("message"=>"Success"));
   } 
   else{
    http_response_code(404);
    echo json_encode(array("message"=>"failed"));
   }
}




?>