<?php
include 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $data = json_decode(file_get_contents('php://input'), true);

    $email = $data["email"];
    $password = $data["password"];

    // Use prepared statements to prevent SQL injection
    $sql = "SELECT * FROM flutter_api WHERE email = $email AND password = $password";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        http_response_code(200);
        echo json_encode(array("message" => "Success"));
    } else {
        http_response_code(404);
        echo json_encode(array("message" => "Failed"));
    }

    $stmt->close();
}
?>
