<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['Email'];

    // Validate email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $_SESSION['error'] = "Invalid email address.";
        header("Location: forgot-password.php");
        exit();
    }

    try {
        // Check if email exists
        $stmt = $pdo->prepare("SELECT * FROM student WHERE Email = :Email");
        $stmt->bindParam(':Email', $email);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Generate a unique token
            $token = bin2hex(random_bytes(50));
            $expires_at = date("Y-m-d H:i:s", strtotime("+1 hour"));

            // Store the token in the database
            $stmt = $pdo->prepare("INSERT INTO password_resets (email, token, expires_at) VALUES (:email, :token, :expires_at)");
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':token', $token);
            $stmt->bindParam(':expires_at', $expires_at);
            $stmt->execute();

            // Send the email
            $reset_link = "reset-password-form.php" . $token;
            $subject = "Password Reset Request";
            $message = "Click on the following link to reset your password: " . $reset_link;
            $headers = "From: no-reply@yourdomain.com";

            if (mail($email, $subject, $message, $headers)) {
                $_SESSION['success'] = "Password reset link has been sent to your email.";
                header("Location: forgot-password.php");
                exit();
            } else {
                $_SESSION['error'] = "Failed to send email.";
                header("Location: forgot-password.php");
                exit();
            }
        } else {
            $_SESSION['error'] = "No account found with that email address.";
            header("Location: forgot-password.php");
            exit();
        }
    } catch (PDOException $e) {
        $_SESSION['error'] = "Database error: " . $e->getMessage();
        header("Location: forgot-password.php");
        exit();
    }
} else {
    header("Location: forgot-password.php");
    exit();
}
?>