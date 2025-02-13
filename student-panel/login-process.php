<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

if (isset($_POST['loginBtn'])) {
    $matric_no = $_POST['matric_no']; // Ensure this matches your form field name
    $password = $_POST['password']; // Ensure this matches your form field name

    // Enable error reporting for debugging
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

    // Ensure $pdo is defined
    if (!isset($pdo)) {
        $_SESSION['error'] = 'Database connection is not established!';
        header('Location: studentLogin.php');
        exit();
    }

    // Prepare and execute the query
    try {
        $stmt = $pdo->prepare('SELECT * FROM student WHERE matric_no = :matric_no');
        $stmt->bindParam(':matric_no', $matric_no);
        $stmt->execute();

        // Fetch the user data
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Debugging: Log the fetched user data (except password)
            error_log('User found: ' . print_r($user, true));

            // Check if the password is already hashed
            if (password_verify($password, $user['password'])) {
                // Password is already hashed and verified
                $_SESSION['student'] = $user['matric_no'];
                error_log('You have successfully logged in.: ' . $_SESSION['student']);
                header('Location: dashboard.php');
                exit();
            } elseif ($user['password'] === $password) {
                // Password is in plain text, verify and hash it
                $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
                $stmt = $pdo->prepare('UPDATE student SET password = :password WHERE matric_no = :matric_no');
                $stmt->bindParam(':password', $hashedPassword);
                $stmt->bindParam(':matric_no', $matric_no);
                $stmt->execute();

                // Set session and redirect
                $_SESSION['student'] = $user['matric_no'];
                error_log('You have successfully logged in and your password has been hashed.');
                header('Location: dashboard.php');
                exit();
            } else {
                // Incorrect password
                $_SESSION['error'] = 'Incorrect matric number or password!';
                error_log('Login failed: Incorrect password!');
            }
        } else {
            // User not found
            $_SESSION['error'] = 'Incorrect matric number or password!';
            error_log('Login failed: User not found!');
        }
    } catch (PDOException $e) {
        // Handle database connection errors
        $_SESSION['error'] = 'Database connection failed!: ' . $e->getMessage();
        error_log('Database connection failed!: ' . $e->getMessage());
    }

    // Redirect back to the login page with an error message
    header('Location: studentLogin.php');
    exit();
}
?>