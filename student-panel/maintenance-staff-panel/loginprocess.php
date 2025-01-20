<?php
session_start();
include 'ainaconnection.php';

if (isset($_POST['loginBtn'])) {
    $worker_no = $_POST['Worker_No'];
    $password = $_POST['Password'];

    // Validate inputs (basic example)
    if (empty($worker_no) || empty($password)) {
        $_SESSION['error'] = "Please fill in all fields.";
        header("Location: maintenanceStaffLogin.php");
        exit();
    }

    try {
        // Check the worker in the database
        $query = "SELECT * FROM maintenance_staff WHERE Worker_No = :worker_no";
        $stmt = $pdo->prepare($query);
        $stmt->execute(['worker_no' => $worker_no]);

        if ($stmt->rowCount() > 0) {
            $worker = $stmt->fetch(PDO::FETCH_ASSOC);

            // Verify the password
            if (password_verify($password, $worker['Password'])) {
                // Store worker details in session
                $_SESSION['maintenance_staff'] = $worker['Worker_No'];
                $_SESSION['worker_id'] = $worker['Worker_ID'];

                // Redirect to the dashboard
                header("Location: dashboard.php");
                exit();
            } else {
                $_SESSION['error'] = "Incorrect password.";
            }
        } else {
            $_SESSION['error'] = "Worker not found.";
        }
    } catch (Exception $e) {
        $_SESSION['error'] = "An error occurred. Please try again.";
    }

    // Redirect back to login page in case of error
    header("Location: maintenanceStaffLogin.php");
    exit();
}
?>
