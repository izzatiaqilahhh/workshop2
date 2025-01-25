<?php
session_start();
include 'ainaconnection.php'; // Include your database configuration file

// Enable error reporting for debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (isset($_POST['loginBtn'])) {
    $worker_no = $_POST['worker_no'];
    $password = $_POST['password'];

    try {
        // Ensure $pdo is defined and connected
        if (!isset($pdo)) {
            $_SESSION['error'] = 'Database connection is not established!';
            error_log('Error: Database connection is not established!');
            header('Location: maintenanceStaffLogin.php');
            exit();
        }

        // Prepare and execute the query to check if user exists
        $stmt = $pdo->prepare('SELECT * FROM maintenance_worker WHERE worker_no = :worker_no');
        $stmt->bindParam(':worker_no', $worker_no);
        $stmt->execute();

        // Fetch the user data
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Debugging: Log the fetched user data (excluding password)
            error_log('User found: ' . print_r($user, true));

            // Check if the password is hashed and verify it
            if (password_verify($password, $user['password'])) {
                // Password is already hashed and verified
                $_SESSION['maintenance_staff'] = $user['worker_no'];
                $_SESSION['name'] = $user['name'];
                $_SESSION['email'] = $user['email'];
                $_SESSION['specialization'] = $user['specialization'];
                error_log('Login successful for worker_no: ' . $_SESSION['maintenance_staff']);
                header('Location: dashboard.php');
                exit();
            } elseif ($user['password'] === $password) {
                // Password is in plain text, hash it and update the database
                $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
                $stmt = $pdo->prepare('UPDATE maintenance_worker SET password = :password WHERE worker_no = :worker_no');
                $stmt->bindParam(':password', $hashedPassword);
                $stmt->bindParam(':worker_no', $worker_no);
                $stmt->execute();

                // Set session and redirect
                $_SESSION['maintenance_staff'] = $user['worker_no'];
                $_SESSION['name'] = $user['name'];
                $_SESSION['email'] = $user['email'];
                $_SESSION['specialization'] = $user['specialization'];
                error_log('Password was plain text and has been hashed. Login successful for worker_no: ' . $_SESSION['maintenance_staff']);
                header('Location: dashboard.php');
                exit();
            } else {
                // Incorrect password
                $_SESSION['error'] = 'Wrong password!';
                error_log('Login failed for worker_no: ' . $worker_no . ' - Incorrect password.');
            }
        } else {
            // User not found
            $_SESSION['error'] = 'User not found!';
            error_log('Login failed: worker_no not found.');
        }
    } catch (PDOException $e) {
        // Handle database connection errors
        $_SESSION['error'] = 'Database connection failed: ' . $e->getMessage();
        error_log('Database connection error: ' . $e->getMessage());
    } catch (Exception $e) {
        // Handle other errors
        $_SESSION['error'] = 'Error: ' . $e->getMessage();
        error_log('Error: ' . $e->getMessage());
    }

    // Redirect back to the login page with an error message
    header('Location: maintenanceStaffLogin.php');
    exit();
}
?>