<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
session_start();
include('teahdbconfig.php'); // Database connection

// Function to redirect with an error message
function redirectWithError($message) {
    $_SESSION['error'] = $message;
    header("Location: forgot-password.php");
    exit();
}

// Function to validate the password
function validatePassword($password) {
    if (strlen($password) < 8 || strlen($password) > 16) {
        return "Password must be between 8 and 16 characters long.";
    }
    if (!preg_match('/[A-Z]/', $password)) {
        return "Password must include at least one uppercase letter.";
    }
    if (!preg_match('/[0-9]/', $password)) {
        return "Password must include at least one number.";
    }
    return "";
}

// Check if token and email are set
if (!isset($_GET['token']) || !isset($_GET['email'])) {
    redirectWithError("Token or email parameter is missing.");
}

$token = $_GET['token'];
$email = $_GET['email'];

// Check if the token is valid and not expired
$stmt = $pdo->prepare("SELECT * FROM password_resets WHERE email = ? AND token = ? AND expires >= ?");
$stmt->execute([$email, $token, date("U")]);
$resetRequest = $stmt->fetch();

if (!$resetRequest) {
    redirectWithError("Invalid or expired token.");
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $newPassword = $_POST['password'];
    $confirmPassword = $_POST['confirm_password'];

    // Validate the password
    $validationError = validatePassword($newPassword);
    if ($validationError) {
        $_SESSION['error'] = $validationError;
    } elseif ($newPassword !== $confirmPassword) {
        $_SESSION['error'] = "Passwords do not match.";
    } else {
        $hashedPassword = password_hash($newPassword, PASSWORD_BCRYPT);

        // Update the password in the database
        $stmt = $pdo->prepare("UPDATE student SET password = ? WHERE email = ?");
        if ($stmt->execute([$hashedPassword, $email])) {
            // Delete the token from the database
            $stmt = $pdo->prepare("DELETE FROM password_resets WHERE email = ?");
            $stmt->execute([$email]);

            $_SESSION['success'] = "Your password has been reset successfully.";
            header("Location: studentLogin.php");
            exit();
        } else {
            $_SESSION['error'] = "Failed to update password.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>e-HRCS - Reset Password</title>
    <link rel="icon" href="images/logo.png" type="images/x-icon">
    <link id="style" href="hostel-staff-panel/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="hostel-staff-panel/assets/css/styles.min.css" rel="stylesheet">
    <link href="hostel-staff-panel/assets/css/icons.min.css" rel="stylesheet">
    <style>
        .password-toggle {
            cursor: pointer;
        }
    </style>
    <script>
        function togglePasswordVisibility(id, iconId) {
            var passwordField = document.getElementById(id);
            var icon = document.getElementById(iconId);
            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.classList.remove('bi-eye');
                icon.classList.add('bi-eye-slash');
            } else {
                passwordField.type = "password";
                icon.classList.remove('bi-eye-slash');
                icon.classList.add('bi-eye');
            }
        }
    </script>
</head>
<body>
    <div class="container-lg py-5">
        <div class="row justify-content-center align-items-center authentication authentication-basic h-100">
            <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12 my-5">
                <form action="" method="POST">
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
                                    <label for="reset-password" class="form-label text-default">New Password</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control form-control-lg" id="reset-password" name="password" placeholder="New Password" required>
                                        <span class="input-group-text password-toggle" onclick="togglePasswordVisibility('reset-password', 'toggle-icon1')">
                                            <i id="toggle-icon1" class="bi bi-eye"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <label for="confirm-password" class="form-label text-default">Confirm New Password</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control form-control-lg" id="confirm-password" name="confirm_password" placeholder="Confirm New Password" required>
                                        <span class="input-group-text password-toggle" onclick="togglePasswordVisibility('confirm-password', 'toggle-icon2')">
                                            <i id="toggle-icon2" class="bi bi-eye"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-xl-12 d-grid mt-3">
                                    <button type="submit" class="btn btn-lg btn-primary-gradient">Reset Password</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="mt-4 text-center">
                    <p class="text-muted">Password requirements:</p>
                    <ul class="text-muted">
                        <li>Length: 8-16 characters</li>
                        <li>At least one uppercase letter</li>
                        <li>At least one number</li>
                    </ul>
                    <p class="text-muted">Example: <strong>Hehehe1234</strong></p>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
    <script src="admin-panel/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>