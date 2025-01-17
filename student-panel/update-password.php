<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['student'])) {
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
    $currentPassword = sanitizeInput($_POST['currentPassword']);
    $newPassword = sanitizeInput($_POST['newPassword']);
    $confirmPassword = sanitizeInput($_POST['confirmPassword']);

    // Validate new password
    if ($newPassword !== $confirmPassword) {
        $_SESSION['password_error'] = 'New passwords do not match!';
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
        $stmt = $pdo->prepare('SELECT Password FROM student WHERE Matric_No = :Matric_No');
        $stmt->bindParam(':Matric_No', $_SESSION['student']);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // Verify the current password
        if ($user && password_verify($currentPassword, $user['Password'])) {
            // Hash the new password
            $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

            // Update the password in the database
            $stmt = $pdo->prepare('UPDATE student SET Password = :password WHERE Matric_No = :Matric_No');
            $stmt->bindParam(':password', $hashedPassword);
            $stmt->bindParam(':Matric_No', $_SESSION['student']);
            $stmt->execute();

            $_SESSION['password_success'] = 'Password updated successfully!';
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