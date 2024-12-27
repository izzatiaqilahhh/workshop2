<?php
session_start();
if (isset($_SESSION['student'])) {
    // Redirect logged-in users to the dashboard
    header("Location: studentdashboard.php");
    exit();
}
?>

<?php include('includes/header.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login - E-Hostel Room Complaint System</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
    <header>
        <h1>E-Hostel Room Complaint System</h1>
    </header>

    <div class="login-container">
        <div class="login-form">
            <h2>Log In</h2>
            <?php
            if (isset($_SESSION['error'])) {
                echo "<div class='error-message'>" . $_SESSION['error'] . "</div>";
                unset($_SESSION['error']);
            }
            ?>
            <form action="studentlogin.php" method="POST">
                <label for="matric_no">Matric Number</label>
                <input type="text" id="matric_no" name="matric_no" required>

                <label for="password">Password</label>
                <div class="password-container">
                    <input type="password" id="password" name="password" required>
                    <button type="button" onclick="togglePassword('password', this)">Show</button>
                </div>

                <button type="submit" name="loginBtn">Log In</button>
            </form>
            <p><a href="forgot-password.php">Forgot Password?</a></p>
        </div>
    </div>

    <script src="assets/js/show-password.js"></script>
</body>
</html>