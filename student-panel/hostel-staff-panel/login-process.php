<?php
session_start();

// Include database connection file
include('qiladbcon.php'); // Update this to the actual database connection file

// Check if the login button is clicked
if (isset($_POST['loginBtn'])) {
    // Retrieve and sanitize input
    $staff_id = isset($_POST['staff_id']) ? filter_var($_POST['staff_id'], FILTER_SANITIZE_STRING) : null;
    $password = isset($_POST['password']) ? $_POST['password'] : null;

    // Validate input
    if (empty($staff_id)) {
        $_SESSION['error'] = "Staff number is required.";
        header("Location: login.php");
        exit();
    }
    if (empty($password)) {
        $_SESSION['error'] = "Password is required.";
        header("Location: login.php");
        exit();
    }

    // Query to check if the user exists
    $query = "SELECT * FROM hostel_staff WHERE staff_id = $1";
    $result = pg_query_params($dbconn, $query, array($staff_id));

    if ($result && pg_num_rows($result) > 0) {
        $staff = pg_fetch_assoc($result);

        // Verify the password
        if (password_verify($password, $user['password'])) {
            // Set session variables
            $_SESSION['staff_id'] = $user['staff_id'];
            $_SESSION['name'] = $user['name'];

            // Redirect to dashboard
            header("Location: dashboard.php");
            exit();
        } else {
            $_SESSION['error'] = "Incorrect password.";
        }
    } else {
        $_SESSION['error'] = "No account found with this staff number.";
    }
} else {
    $_SESSION['error'] = "Invalid request.";
}

// Redirect back to login page on error
header("Location: login.php");
exit();
?>
