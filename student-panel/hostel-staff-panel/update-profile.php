<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['hostel_staff'])) {
    // If not logged in, redirect to the login page
    header("Location: hostelStaffLogin.php");
    exit();
}

// Include database configuration
include('qiladbcon.php'); // Ensure this file contains MySQLi connection setup

// Check if the form is submitted
if (isset($_POST['editProfile'])) {
    // Get form data
    $name = $_POST['name'];
    $staff_no = $_SESSION['hostel_staff'];  // Corrected the session variable
    $email = $_POST['email'];
    $phone_no = $_POST['phone'];

    // Prepare and execute the update query using MySQLi
    try {
        // Use MySQLi query with prepared statements
        $stmt = $mysqli->prepare('UPDATE hostel_staff SET Name = ?, Email = ?, Phone_No = ? WHERE Staff_No = ?');
        $stmt->bind_param('ssss', $name, $email, $phone_no, $staff_no); // 'ssss' means all parameters are strings
        $stmt->execute();

        // Check if the update was successful
        if ($stmt->affected_rows > 0) {
            // Set a success message and redirect to the profile page
            $_SESSION['success'] = 'Profile successfully updated.';
            header('Location: profile.php');
            exit();
        } else {
            // No rows affected (maybe the data is the same), handle accordingly
            $_SESSION['error'] = 'No changes were made to the profile.';
            header('Location: profile.php');
            exit();
        }
    } catch (mysqli_sql_exception $e) {
        // Handle database errors
        $_SESSION['error'] = 'Database error: ' . $e->getMessage();
        header('Location: profile.php');
        exit();
    }
}

// If the form is not submitted, redirect to the profile page
header('Location: profile.php');
exit();
