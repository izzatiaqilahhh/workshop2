<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

if (isset($_POST['loginBtn'])) {
    $matric_no = $_POST['Matric_No'];
    $password = $_POST['Password'];

    // Database connection
    try {
        // Prepare and execute the query
        $stmt = $pdo->prepare('SELECT * FROM student WHERE Matric_No = :Matric_No');
        $stmt->bindParam(':Matric_No',$matric_no);
        $stmt->execute();

        // Fetch the user data
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Verify the password (Assuming passwords are hashed)
            if (password_verify($password, $user['Password'])) {
                // Password is correct, start the session
                $_SESSION['student'] = $user['Matric_No'];
                header('Location: dashboard.php');
                exit();
            } else {
                // Incorrect password
                $_SESSION['error'] = 'Incorrect Matric Number or Password';
            }
        } else {
            // User not found
            $_SESSION['error'] = 'Incorrect Matric Number or Password';
        }
    } catch (PDOException $e) {
        // Handle database connection errors
        $_SESSION['error'] = 'Database connection failed: ' . $e->getMessage();
    }
}

// Redirect back to the login page with an error message
header('Location: login.php');
exit();
?>