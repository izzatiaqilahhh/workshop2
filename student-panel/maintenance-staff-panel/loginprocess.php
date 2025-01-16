<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

if (isset($_POST['loginBtn'])) {
    $worker_no = $_POST['Worker_No'];
    $password = $_POST['Password'];

    // Enable error reporting for debugging
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

    // Ensure $pdo is defined
    if (!isset($pdo)) {
        $_SESSION['error'] = 'Database connection is not established!';
        header('Location: maintenanceStaffLogin.php');
        exit();
    }

    try {
        // Prepare and execute the query
        $stmt = $pdo->prepare('SELECT * FROM maintenance_worker WHERE Worker_No = :Worker_No');
        $stmt->bindParam(':Worker_No', $worker_no);
        $stmt->execute();

        // Fetch the user data
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Debugging: Log the fetched user data (except password)
            error_log('User found: ' . print_r($user, true));

            if (password_verify($password, $user['Password'])) {
                // Password is already hashed and verified
                $_SESSION['maintenance_staff'] = $user['Worker_No'];
                error_log('You have successfully logged in: ' . $_SESSION['maintenance_staff']);
                header('Location: dashboard.php');
                exit();
            } elseif ($user['Password'] === $password) {
                // Password is in plain text, verify and hash it
                $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
                $stmt = $pdo->prepare('UPDATE maintenance_worker SET Password = :password WHERE Worker_No = :Worker_No');
                $stmt->bindParam(':password', $hashedPassword);
                $stmt->bindParam(':Worker_No', $worker_no);
                $stmt->execute();

                // Set session and redirect
                $_SESSION['maintenance_staff'] = $user['Worker_No'];
                error_log('You have successfully logged in and your password has been hashed.');
                header('Location: dashboard.php');
                exit();
            } else {
                // Incorrect password
                $_SESSION['error'] = 'Incorrect worker number or password!';
                error_log('Login failed: Incorrect password!');
            }
        } else {
            // User not found
            $_SESSION['error'] = 'Incorrect worker number or password!';
            error_log('Login failed: User not found!');
        }
    } catch (PDOException $e) {
        // Handle database connection errors
        $_SESSION['error'] = 'Database connection failed!';
        error_log('Database connection failed!: ' . $e->getMessage());
    }

    // Redirect back to the login page with an error message
    header('Location: maintenanceStaffLogin.php');
    exit();
}
?>