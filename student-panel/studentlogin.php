<?php
session_start();

// Include database connection file
include('teahdbconfig.php'); // Update this to the actual database connection file

// Check if the login button is clicked
if (isset($_POST['loginBtn'])) {
    // Retrieve and sanitize input
    $matric_no = isset($_POST['matric_no']) ? filter_var($_POST['matric_no'], FILTER_SANITIZE_STRING) : null;
    $password = isset($_POST['password']) ? $_POST['password'] : null;

    // Validate input
    if (empty($matric_no)) {
        $_SESSION['error'] = "Matric number is required.";
        header("Location: login.php");
        exit();
    }
    if (empty($password)) {
        $_SESSION['error'] = "Password is required.";
        header("Location: login.php");
        exit();
    }

    // Query to check if the user exists
    $query = "SELECT * FROM student WHERE matric_no = $1";
    $result = pg_query_params($dbconn, $query, array($matric_no));

    if ($result && pg_num_rows($result) > 0) {
        $staff = pg_fetch_assoc($result);

        // Verify the password
        if (password_verify($password, $user['password'])) {
            // Set session variables
            $_SESSION['matric_no'] = $user['matric_no'];
            $_SESSION['name'] = $user['name'];

            // Redirect to dashboard
            header("Location: studentdashboard.php");
            exit();
        } else {
            $_SESSION['error'] = "Incorrect password.";
        }
    } else {
        $_SESSION['error'] = "No account found with this matric number.";
    }
} else {
    $_SESSION['error'] = "Invalid request.";
}

// Redirect back to login page on error
header("Location: login.php");
exit();
?>
