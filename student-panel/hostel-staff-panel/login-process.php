<?php
// Start session
session_start();

// Include the database configuration file
include('paandbconfig.php');

// Check if the login form is submitted
if (isset($_POST['loginBtn'])) {
    // Get the input values from the form
    $staffNo = $_POST['Staff_No'];
    $password = $_POST['Password'];

    // Sanitize the input to prevent SQL injection
    $staffNo = $conn->real_escape_string($staffNo);
    $password = $conn->real_escape_string($password);

    // SQL query to fetch the user data based on the Staff_No
    $sql = "SELECT * FROM hostel_staff WHERE Staff_No = '$staffNo'";

    // Execute the query
    $result = $conn->query($sql);

    // Check if the Staff_No exists
    if ($result->num_rows > 0) {
        // Fetch the user record
        $row = $result->fetch_assoc();

        // Verify the password (plain text comparison)
        if ($row['Password'] == $password) {
            // Set session variable for logged-in user
            $_SESSION['hostel_staff'] = $row['Staff_No'];  // Note: $_SESSION['hostel_staff']

            // Redirect to the dashboard
            header("Location: dashboard.php");
            exit();
        } else {
            // If the password is incorrect, set an error message
            $_SESSION['error'] = "Invalid password. Please try again.";
            header("Location: hostelStaffLogin.php");
            exit();
        }
    } else {
        // If the Staff_No does not exist, set an error message
        $_SESSION['error'] = "Staff number not found. Please check your Staff Number.";
        header("Location: hostelStaffLogin.php");
        exit();
    }
}

// Close the database connection
$conn->close();
?>
