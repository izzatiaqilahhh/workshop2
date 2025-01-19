<?php
session_start();
include('qiladbcon.php'); // Include your database configuration file

if (isset($_POST['loginBtn'])) {
    $staff_no = $_POST['staff_no'];
    $password = $_POST['password'];

    // Enable error reporting for debugging
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

    // Ensure $pdo is defined
    if (!isset($pdo)) {
        $_SESSION['error'] = 'Database connection is not established!';
        header('Location: hostelStaffLogin.php');
        exit();
    }

    // Prepare and execute the query
    try {
        // Prepare the query
        $stmt = $pdo->prepare('SELECT * FROM hostel_staff WHERE staff_no = :staff_no');

        // Execute the query
        $stmt->execute(['staff_no' => $staff_no]);

        // Fetch the user data
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Debugging: Log the fetched user data (except password)
            error_log('User found: ' . print_r($user, true));

            // Verify the password (plain text comparison)
            if ($password === $user['password']) {
                // Password is correct, start the session
                $_SESSION['hostel_staff'] = $user['staff_no'];
                $_SESSION['name'] = $user['name'];
                $_SESSION['email'] = $user['email'];
                $_SESSION['phone_no'] = $user['phone_no'];
                error_log('You have successfully logged in.: ' . $_SESSION['hostel_staff']);
                header('Location: dashboard.php');
                exit();
            } else {
                // Incorrect password
                $_SESSION['error'] = 'Incorrect staff number or password!';
                error_log('Login failed: Incorrect password');
            }
        } else {
            // User not found
            $_SESSION['error'] = 'Incorrect staff number or password!';
            error_log('Login failed: User not found');
        }
    } catch (Exception $e) {
        // Handle database connection errors
        $_SESSION['error'] = 'Database connection failed!: ' . $e->getMessage();
        error_log('Database connection failed!: ' . $e->getMessage());
    }

    // Redirect back to the login page with an error message
    header('Location: hostelStaffLogin.php');
    exit();
}
