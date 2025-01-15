<?php
session_start(); // Start the session
include 'ainaconnection.php'; // Include your database connection file

if (isset($_POST['loginBtn'])) {
    $staff_no = $_POST['Staff_No'];
    $password = $_POST['password'];

    // Query to check if the user exists
    $query = "SELECT * FROM maintenance_worker WHERE Worker_No = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $staff_no);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();

        // Verify the password
        if (password_verify($password, $user['password'])) {
            // Store user data in the session
            $_SESSION['Worker_No'] = $user['id'];
            $_SESSION['Password'] = $user['Staff_No'];

            // Redirect to dashboard
            header("Location: dashboard.php");
            exit();
        } else {
            // Invalid password
            $_SESSION['error'] = "Invalid password.";
            header("Location: login.php");
            exit();
        }
    } else {
        // User not found
        $_SESSION['error'] = "Staff number not found.";
        header("Location: login.php");
        exit();
    }
}
?>
