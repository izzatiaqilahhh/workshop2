<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['hostel_staff'])) {
    header("Location: hostelStaffLogin.php");
    exit();
}

// Include database configuration
include('qiladbcon.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $staff_no = $_SESSION['hostel_staff'];
    $current_password = $_POST['current_password'];
    $new_password = $_POST['new_password'];
    $confirm_password = $_POST['confirm_password'];

    // Validate input
    if (empty($current_password) || empty($new_password) || empty($confirm_password)) {
        echo "All fields are required.";
        exit();
    }

    if ($new_password !== $confirm_password) {
        echo "New passwords do not match.";
        exit();
    }

    try {
        // Fetch the current password from the database
        $stmt = $pdo->prepare('SELECT password FROM hostel_staff WHERE staff_no = :staff_no');
        $stmt->bindParam(':staff_no', $staff_no);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$user) {
            echo "User not found!";
            exit();
        }

        // Verify the current password
        if (!password_verify($current_password, $user['password'])) {
            echo "Current password is incorrect.";
            exit();
        }

        // Hash the new password
        $hashed_password = password_hash($new_password, PASSWORD_BCRYPT);

        // Update the password in the database
        $stmt = $pdo->prepare('UPDATE hostel_staff SET password = :password WHERE staff_no = :staff_no');
        $stmt->bindParam(':password', $hashed_password);
        $stmt->bindParam(':staff_no', $staff_no);
        $stmt->execute();

        echo "Password updated successfully.";
    } catch (PDOException $e) {
        echo 'Database query failed: ' . $e->getMessage();
    }
}
?>