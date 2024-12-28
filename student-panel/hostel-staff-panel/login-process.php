<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

if (isset($_POST['loginBtn'])) {
    $staff_no = $_POST['Staff_No']; // Ensure this matches your form field name
    $password = $_POST['Password']; // Ensure this matches your form field name

    // Enable error reporting for debugging
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

    // Ensure $pdo is defined
    if (!isset($pdo)) {
        $_SESSION['error'] = 'Database connection is not established.';
        header('Location: login.php');
        exit();
    }

    // Prepare and execute the query
    try {
        $stmt = $pdo->prepare('SELECT * FROM hostel_staff WHERE Staff_No = :Staff_No');
        $stmt->bindParam(':Staff_No', $staff_no);
        $stmt->execute();

        // Fetch the user data
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Debugging: Log the fetched user data (except password)
            error_log('User found: ' . print_r($user, true));

            // Verify the password (Assuming passwords are hashed)
            if ($password == $user['Password']) {
                // Password is correct, start the session
                $_SESSION['hostel_staff'] = $user['Staff_No'];
                error_log('Login successful: ' . $_SESSION['hostel_staff']);
                header('Location: dashboard.php');
                exit();
            } else {
                // Incorrect password
                $_SESSION['error'] = 'Incorrect Staff Number or Password';
                error_log('Login failed: Incorrect password');
            }
        } else {
            // User not found
            $_SESSION['error'] = 'Incorrect Staff Number or Password';
            error_log('Login failed: User not found');
        }
    } catch (PDOException $e) {
        // Handle database connection errors
        $_SESSION['error'] = 'Database connection failed: ' . $e->getMessage();
        error_log('Database connection failed: ' . $e->getMessage());
    }

    // Redirect back to the login page with an error message
    header('Location: login.php');
    exit();
}
?>