<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

// Check if the token is present in the URL
if (!isset($_GET['token'])) {
    $_SESSION['error'] = "Invalid request.";
    header("Location: login.php");
    exit();
}

$token = $_GET['token'];

// Validate the token
try {
    $stmt = $pdo->prepare("SELECT * FROM password_resets WHERE token = :token AND expires_at > NOW()");
    $stmt->bindParam(':token', $token);
    $stmt->execute();
    $reset = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$reset) {
        $_SESSION['error'] = "Invalid or expired token.";
        header("Location: login.php");
        exit();
    }
} catch (PDOException $e) {
    $_SESSION['error'] = "Database error: " . $e->getMessage();
    header("Location: login.php");
    exit();
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $new_password = $_POST['new_password'];
    $confirm_password = $_POST['confirm_password'];

    if ($new_password !== $confirm_password) {
        $_SESSION['error'] = "Passwords do not match.";
    } else {
        // Update the user's password
        try {
            $hashed_password = password_hash($new_password, PASSWORD_BCRYPT);
            $stmt = $pdo->prepare("UPDATE student SET password = :password WHERE Email = :Email");
            $stmt->bindParam(':password', $hashed_password);
            $stmt->bindParam(':Email', $reset['Email']);
            $stmt->execute();

            // Delete the reset token
            $stmt = $pdo->prepare("DELETE FROM password_resets WHERE token = :token");
            $stmt->bindParam(':token', $token);
            $stmt->execute();

            $_SESSION['success'] = "Password has been reset successfully.";
            header("Location: login.php");
            exit();
        } catch (PDOException $e) {
            $_SESSION['error'] = "Database error: " . $e->getMessage();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal" data-vertical-style="overlay" data-theme-mode="light" data-header-styles="light" data-menu-styles="light" data-toggled="close">
<head>
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge'>
    <title>E-Hostel Room Complaint System - Reset Password</title>
    <link rel="icon" href="images/logo.png" type="images/x-icon">
    <link id="style" href="hostel-staff-panel/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="hostel-staff-panel/assets/css/styles.min.css" rel="stylesheet">
    <link href="hostel-staff-panel/assets/css/icons.min.css" rel="stylesheet">
</head>
<body>
    <header class="app-header" style="background-color:rgba(0,0,0,0.0); border:0">
        <div class="main-header-container container-fluid">
            <div class="header-content-left">
                <div class="header-element">
                    <div class="horizontal-logo">
                        <a href="index.php" class="text-black fw-bolder fs-20">
                            E-Hostel Room Complaint System
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="container-lg py-5">
        <div class="row justify-content-center align-items-center authentication authentication-basic h-100">
            <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12 my-5">
                <form action="" method="POST"> <!-- Form submits to the same page -->
                    <div class="card custom-card" style="background-color:rgba(255,255,255,0.8);">
                        <div class="card-body p-5">
                            <p class="h5 fw-semibold mb-2 text-center">Reset Password</p>
                            <p class="mb-4 text-muted op-7 fw-normal text-center">Enter your new password below.</p>
                            <?php
                            if (isset($_SESSION['error'])) {
                                echo '<div class="alert alert-danger">' . $_SESSION['error'] . '</div>';
                                unset($_SESSION['error']);
                            }
                            ?>
                            <div class="row gy-3">
                                <div class="col-xl-12">
                                    <label for="new-password" class="form-label text-default">New Password</label>
                                    <input type="password" class="form-control form-control-lg" id="new-password" name="new_password" placeholder="New Password" required>
                                </div>
                                <div class="col-xl-12">
                                    <label for="confirm-password" class="form-label text-default">Confirm Password</label>
                                    <input type="password" class="form-control form-control-lg" id="confirm-password" name="confirm_password" placeholder="Confirm Password" required>
                                </div>
                                <div class="col-xl-12 d-grid mt-3">
                                    <button type="submit" class="btn btn-lg btn-primary-gradient">Reset Password</button>
                                </div>
                            </div>
                            <div class="text-center">
                                <p class="fs-12 text-muted mt-3">Remembered your password? <a href="login.php" class="text-primary text-decoration-underline">Log In</a></p>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="hostel-staff-panel/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>