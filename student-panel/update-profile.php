<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['student'])) {
    // If not logged in, redirect to the login page
    header("Location: studentLogin.php");
    exit();
}

// Include database configuration and functions
include('teahdbconfig.php');

// Function to sanitize input data
function sanitizeInput($data) {
    return htmlspecialchars(stripslashes(trim($data)));
}

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Prepare the update query
    $query = 'UPDATE student SET ';
    $params = [];
    $fields = ['fullName' => 'name', 'email' => 'email', 'phone_no' => 'phone_no', 'gender' => 'gender', 'faculty' => 'faculty', 'course' => 'course', 'year_of_study' => 'year_of_study'];

    foreach ($fields as $field => $dbField) {
        if (!empty($_POST[$field])) {
            $query .= "$dbField = :$field, ";
            $params[$field] = sanitizeInput($_POST[$field]);
        }
    }

    // Remove the trailing comma and space
    $query = rtrim($query, ', ');

    // Add the condition to update the specific user
    $query .= ' WHERE matric_no = :matric_no';
    $params['matric_no'] = $_SESSION['student'];

    // Execute the update query
    try {
        $stmt = $pdo->prepare($query);
        $stmt->execute($params);

        // Set success message and redirect to profile page
        $_SESSION['success'] = 'Profile updated successfully';
        header("Location: profile.php");
        exit();
    } catch (PDOException $e) {
        // Handle database errors
        $_SESSION['error'] = 'Database update failed: ' . $e->getMessage();
        header("Location: profile.php");
        exit();
    }
} else {
    // If form is not submitted, redirect to profile page
    header("Location: profile.php");
    exit();
}
?>