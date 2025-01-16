<?php
session_start();
require 'teahdbconfig.php'; // Include the database connection

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve form data
    $worker_no = $_POST['Worker_No'];
    $password = $_POST['Password'];

    // Validate input
    if (empty($worker_no) || empty($password)) {
        echo 'Please fill in all fields.';
        exit();
    }

    // Prepare SQL statement to prevent SQL injection
    $stmt = $pdo->prepare('SELECT * FROM Maintenance_Worker WHERE Worker_No = :Worker_No');
    $stmt->execute(['Worker_No' => $worker_no]);
    $worker = $stmt->fetch(PDO::FETCH_ASSOC);

    // Check if the worker exists and the password is correct
    if ($worker && $password === $worker['Password']) {
        // Successful login
        $_SESSION['worker_id'] = $worker['Worker_Id'];
        $_SESSION['worker_no'] = $worker['Worker_No'];
        $_SESSION['worker_name'] = $worker['Name'];
        echo "Login successful. Redirecting to dashboard...";
        header('Location: dashboard.php'); // Redirect to a dashboard or home page
        exit();
    } else {
        // Invalid credentials
        echo 'Invalid worker number or password.';
    }
} else {
    echo 'Invalid request method.';
}
?>