<?php
session_start();

include('teahconnect.php');

// Dummy login credentials for demonstration (replace with database query)
$valid_username = 'username'; // Replace with database query
$valid_password = 'password'; // Replace with database query

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Check if the username and password match the valid ones
    if ($username === $valid_username && $password === $valid_password) {
        // Start the session and store the user data
        $_SESSION['username'] = $username; // You can get this from the database

        // Redirect to dashboard.php after successful login
        header("Location: studentdashboard.php");
        exit(); // Ensure no further code runs after redirection
    } else {
        $error_message = "Invalid username or password.";
    }
}
?>