<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['hostel_staff'])) {
    // If not logged in, redirect to the login page
    header("Location: hostelStaffLogin.php");
    exit();
}

// Include database configuration
include('qiladbcon.php');

// Check if the form is submitted
if (isset($_POST['editProfile'])) {
    // Get form data
    $name = $_POST['name'];
    $staff_no = $_SESSION['hostel_staff'];  // Corrected the session variable
    $email = $_POST['email'];
    $phone_no = $_POST['phone'];

    // Prepare and execute the update query
    try {
        $stmt = $pdo->prepare('UPDATE hostel_staff SET Name = :name, Email = :email, Phone_No = :phone_no WHERE Staff_No = :staff_no');
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':staff_no', $staff_no);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':phone_no', $phone_no);
        $stmt->execute();

        // Set a success message and redirect to the profile page
        $_SESSION['success'] = 'Profile successfully updated.';
        header('Location: profile.php');
        exit();
    } catch (PDOException $e) {
        // Handle database errors
        $_SESSION['error'] = 'Database error: ' . $e->getMessage();
        header('Location: profile.php');
        exit();
    }
}

// If the form is not submitted, redirect to the profile page
header('Location: profile.php');
exit();
