<?php
session_start();

// Include database connection file
include('../qiladbcon.php'); // Ensure this points to your database connection file

// Check if the login button is clicked
if (isset($_POST['loginBtn'])) {
    // Retrieve and sanitize input
    $Staff_No = isset($_POST['Staff_No']) ? filter_var($_POST['Staff_No'], FILTER_SANITIZE_STRING) : null;
    $Password = isset($_POST['Password']) ? $_POST['Password'] : null;

    // Validate input
    if (empty($Staff_No)) {
        $_SESSION['error'] = "Staff number is required.";
        header("Location: login.php");
        exit();
    }
    if (empty($Password)) {
        $_SESSION['error'] = "Password is required.";
        header("Location: login.php");
        exit();
    }

    // Query to check if the user exists
    $query = "SELECT * FROM Hostel_Staff WHERE Staff_No = $1";
    $result = pg_query_params($connection, $query, array($Staff_No)); // Use $connection instead of $dbconn

    if ($result && pg_num_rows($result) > 0) {
        $Hostel_Staff = pg_fetch_assoc($result);

        // Verify the password
        if (password_verify($Password, $Hostel_Staff['Password'])) {
            // Set session variables
            $_SESSION['Staff_ID'] = $Hostel_Staff['Staff_ID'];
            $_SESSION['Staff_No'] = $Hostel_Staff['Staff_No'];
            $_SESSION['Name'] = $Hostel_Staff['Name'];

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
