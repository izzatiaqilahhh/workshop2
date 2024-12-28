<?php
// process_login.php
session_start();
require_once '../qiladbcon.php'; // Include database connection file

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $staffNo = trim($_POST['Staff_No']);
    $password = trim($_POST['Password']);

    // Prepare and execute SQL query with parameterized input
    $query = "SELECT Staff_No, Password FROM Hostel_Staff WHERE Staff_No = $1";
    $result = pg_query_params($connection, $query, [$staffNo]);

    if ($result && pg_num_rows($result) > 0) {
        $row = pg_fetch_assoc($result);
        $staffNo = $row['Staff_No'];
        $hashedPassword = $row['password'];

        // Verify password
        if (password_verify($password, $hashedPassword)) {
            $_SESSION['staff_id'] = $staffId;
            header('Location: dashboard.php'); // Redirect to dashboard
            exit();
        } else {
            echo "<script>alert('Invalid staff number or password!'); window.location.href = 'login.php';</script>";
        }
    } else {
        echo "<script>alert('Staff does not exist!'); window.location.href = 'login.php';</script>";
    }

    // Free the result and close the connection
    pg_free_result($result);
    pg_close($conn);
}
?>
