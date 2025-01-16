<?php
session_start();
require 'teahdbconfig.php'; // Include the database connection

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve form data
    $worker_no = $_POST['Worker_No'];
    $password = $_POST['Password'];

    // Validate input
    if (empty($worker_no) || empty($password)) {
        $_SESSION['error'] = 'Please fill in all fields.';
        header('Location: workerLogin.php');
        exit();
    }

    // Prepare SQL statement to prevent SQL injection
    $stmt = $pdo->prepare('SELECT * FROM Maintenance_Worker WHERE Worker_No = :worker_no');
    $stmt->execute(['worker_no' => $worker_no]);
    $worker = $stmt->fetch(PDO::FETCH_ASSOC);

    // Check if the worker exists and the password is correct
    if ($worker && $password === $worker['Password']) {
        // Successful login
        $_SESSION['worker_id'] = $worker['Worker_Id'];
        $_SESSION['worker_no'] = $worker['Worker_No'];
        $_SESSION['worker_name'] = $worker['Name'];
        $_SESSION['worker'] = true; // Set session variable to indicate worker is logged in
        header('Location: dashboard.php'); // Redirect to the dashboard page
        exit();
    } else {
        // Invalid credentials
        $_SESSION['error'] = 'Invalid worker number or password.';
        header('Location: maintenanceStaffLogin.php');
        exit();
    }
} else {
    $_SESSION['error'] = 'Invalid request method.';
    header('Location: maintenanceStaffLogin.php');
    exit();
}
?>