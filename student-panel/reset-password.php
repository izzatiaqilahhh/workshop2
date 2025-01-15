<?php
session_start();
require_once 'teahdbconfig.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);

    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $stmt = $pdo->prepare("SELECT Student_ID FROM Student WHERE Email = :email");
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            $token = bin2hex(random_bytes(50));
            $expiry = date('Y-m-d H:i:s', strtotime('+1 hour'));

            $stmt = $pdo->prepare("INSERT INTO password_resets (email, token, expiry) VALUES (:email, :token, :expiry)
                                   ON DUPLICATE KEY UPDATE token = :token, expiry = :expiry");
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':token', $token);
            $stmt->bindParam(':expiry', $expiry);
            $stmt->execute();

            $resetLink = "http://yourdomain.com/reset-password-form.php?token=$token";
            $subject = "Password Reset Request";
            $message = "You have requested a password reset. Click the link below to reset your password:\n\n$resetLink\n\nIf you did not request this, please ignore this email.";
            $headers = "From: no-reply@yourdomain.com";

            if (mail($email, $subject, $message, $headers)) {
                $_SESSION['success'] = "Password reset link has been sent to your email address.";
            } else {
                $_SESSION['error'] = "Failed to send the reset link. Please try again.";
            }
        } else {
            $_SESSION['error'] = "Email address not found.";
        }
    } else {
        $_SESSION['error'] = "Invalid email address.";
    }
    header("Location: forgot-password.php");
    exit();
} else {
    header("Location: forgot-password.php");
    exit();
}
?>