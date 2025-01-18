<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Check if the user is logged in
if (!isset($_SESSION['hostel_staff'])) {
    header("Location: hostelStaffLogin.php");
    exit();
}

// Include database configuration and functions
include('qiladbcon.php');

// Function to sanitize input data
function sanitizeInput($data) {
    return htmlspecialchars(stripslashes(trim($data)));
}

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $currentPassword = sanitizeInput($_POST['currentPassword']);
    $newPassword = sanitizeInput($_POST['newPassword']);
    $confirmPassword = sanitizeInput($_POST['confirmPassword']);

    // Validate new password
    if ($newPassword !== $confirmPassword) {
        $_SESSION['password_error'] = 'New password does not match!';
        header("Location: profile.php");
        exit();
    }

    if (strlen($newPassword) < 6) {
        $_SESSION['password_error'] = 'New password must be at least 6 characters long!';
        header("Location: profile.php");
        exit();
    }

    try {
        // Fetch the user's current password from the database
        $stmt = $pdo->prepare('SELECT password FROM hostel_staff WHERE staff_no = :staff_no');
        $stmt->bindParam(':staff_no', $_SESSION['hostel_staff']);  // Corrected typo here
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // Verify the current password
        if ($user && password_verify($currentPassword, $user['password'])) {
            // Hash the new password
            $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

            // Update the password in the database
            $stmt = $pdo->prepare('UPDATE hostel_staff SET password = :password WHERE staff_no = :staff_no');
            $stmt->bindParam(':password', $hashedPassword);
            $stmt->bindParam(':staff_no', $_SESSION['hostel_staff']);
            $stmt->execute();

            $_SESSION['password_success'] = 'Password successfully updated!';
        } else {
            $_SESSION['password_error'] = 'Current password is incorrect!';
        }
    } catch (PDOException $e) {
        $_SESSION['password_error'] = 'Database error: ' . $e->getMessage();
    }

    // Redirect back to the profile page
    header("Location: profile.php");
    exit();
} else {
    // If form is not submitted, redirect to profile page
    header("Location: profile.php");
    exit();
}
?>