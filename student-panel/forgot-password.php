<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
session_start();
include('teahdbconfig.php'); // Database connection

require __DIR__ . '/../vendor/autoload.php'; // Include PHPMailer autoload

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];

    // Check if the email exists in the database
    $stmt = $pdo->prepare("SELECT * FROM student WHERE Email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch();

    if ($user) {
        // Generate a unique token
        $token = bin2hex(random_bytes(16));
        $expires = time() + 1800; // Token valid for 30 minutes

        // Insert the token into the database
        try {
            $stmt = $pdo->prepare("INSERT INTO password_resets (email, token, expires) VALUES (?, ?, ?)");
            if (!$stmt->execute([$email, $token, $expires])) {
                throw new Exception('Failed to insert token: ' . implode(' ', $stmt->errorInfo()));
            } else {
                echo "Token inserted successfully.<br>";
            }
            // Debugging: Check if the token was inserted
            $stmt = $pdo->prepare("SELECT * FROM password_resets WHERE email = ? AND token = ?");
            $stmt->execute([$email, $token]);
            $resetEntry = $stmt->fetch();
            if (!$resetEntry) {
                throw new Exception('Token insertion check failed.');
            } else {
                echo "Token insertion verified.<br>";
            }
        } catch (Exception $e) {
            $_SESSION['error'] = "Failed to insert token into database: " . $e->getMessage();
            header("Location: forgot-password.php");
            exit();
        }

        // Send the email using PHPMailer
        $mail = new PHPMailer(true);

        try {
            // Server settings
            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com'; // Set the SMTP server to send through
            $mail->SMTPAuth = true;
            $mail->Username = 'fathehaharis69@gmail.com'; // SMTP username
            $mail->Password = 'jpyq tjuq xhey uzke'; // SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            $mail->Port = 587;

            // Recipients
            $mail->setFrom('fathehaharis69@gmail.com', 'fathehah');
            $mail->addAddress($email);

            // Content
            $mail->isHTML(true);
            $mail->Subject = 'Password Reset Request';
            $resetLink = "http://localhost:3000/student-panel/reset-password.php?token=$token&email=$email";
            $mail->Body = "
                <p>Hello,</p>
                <p>We received a request to reset your password for your account. If you didn't make this request, you can ignore this email.</p>
                <p>To reset your password, please click on the link below:</p>
                <p><a href='$resetLink'>Reset Password</a></p>
                <p>If the above link doesn't work, you can copy and paste the following URL into your browser:</p>
                <p>$resetLink</p>
                <p>Thank you,<br>The E-Hostel Room Complaint System Team</p>
            ";

            $mail->send();
            $_SESSION['success'] = "A password reset link has been sent to your email.";
        } catch (Exception $e) {
            $_SESSION['error'] = "Failed to send email. Mailer Error: {$mail->ErrorInfo}";
        }
    } else {
        $_SESSION['error'] = "No account found with that email address.";
    }

    header("Location: forgot-password.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal" data-vertical-style="overlay" data-theme-mode="light" data-header-styles="light" data-menu-styles="light" data-toggled="close">
<head>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>e-HRCS - Forgot Password</title>
    <link rel="icon" href="images/logo.png" type="images/x-icon">
    <!-- Bootstrap CSS -->
    <link id="style" href="hostel-staff-panel/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Style CSS -->
    <link href="hostel-staff-panel/assets/css/styles.min.css" rel="stylesheet">
    <!-- Icons CSS -->
    <link href="hostel-staff-panel/assets/css/icons.min.css" rel="stylesheet">
</head>
<body>
    <!-- App Header -->
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
    <!-- App Header -->

    <!-- Forgot Password Form -->
    <div class="container-lg py-5">
        <div class="row justify-content-center align-items-center authentication authentication-basic h-100">
            <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12 my-5">
                <?php
                if (isset($_SESSION['success'])) {
                    echo '<div class="alert alert-success">' . $_SESSION['success'] . '</div>';
                    unset($_SESSION['success']);
                }
                if (isset($_SESSION['error'])) {
                    echo '<div class="alert alert-danger">' . $_SESSION['error'] . '</div>';
                    unset($_SESSION['error']);
                }
                ?>
                <form action="forgot-password.php" method="POST">
                    <div class="card custom-card" style="background-color:rgba(255,255,255,0.8);">
                        <div class="card-body p-5">
                            <p class="h5 fw-semibold mb-2 text-center">Forgot Password</p>
                            <p class="mb-4 text-muted op-7 fw-normal text-center">Enter your registered email address to reset your password.</p>
                            <div class="row gy-3">
                                <div class="col-xl-12">
                                    <label for="forgot-email" class="form-label text-default">Email Address</label>
                                    <input type="email" class="form-control form-control-lg" id="forgot-email" name="email" placeholder="Email Address" required>
                                </div>
                                <div class="col-xl-12 d-grid mt-3">
                                    <button type="submit" class="btn btn-lg btn-primary-gradient">Send Reset Link</button>
                                </div>
                            </div>
                            <div class="text-center">
                                <p class="fs-12 text-muted mt-3">Remembered your password? <a href="studentLogin.php" class="text-primary text-decoration-underline">Log In</a></p>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Forgot Password Form -->

    <!-- Bootstrap JS -->
    <script src="admin-panel/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>