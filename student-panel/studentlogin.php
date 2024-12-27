<?php
session_start();
include('teahdbconfig.php'); // Make sure to create a database connection file

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $matric_no = $_POST['matric_no'];
    $password = $_POST['password'];

    // You should hash passwords and use prepared statements in a real application
    $query = "SELECT * FROM student WHERE matric_no = ? AND password = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ss", $matric_no, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $_SESSION['student'] = $matric_no;
        header("Location: studentdashboard.php");
        exit();
    } else {
        $_SESSION['error'] = "Invalid Matric Number or Password";
        header("Location: login.php");
        exit();
    }
}
?>