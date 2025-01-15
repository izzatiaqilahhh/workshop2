<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Include Composer's autoloader
require 'vendor/autoload.php';

// Function to send password reset email
function sendPasswordResetEmail($recipientEmail, $resetLink) {
    $mail = new PHPMailer(true);

    try {
        // Server settings
        $mail->isSMTP();
        $mail->Host = 'smtp.student.utem.edu.my'; // Set your SMTP server
        $mail->SMTPAuth = true;
        $mail->Username = 'fathehaharis69@student.utem.edu.my'; // SMTP username
        $mail->Password = 'your-email-password'; // SMTP password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587; // Usually 587 for TLS

        // Recipients
        $mail->setFrom('fathehaharis69@student.utem.edu.my', 'Your Name');
        $mail->addAddress($recipientEmail); // Add a recipient

        // Content
        $mail->isHTML(true); // Set email format to HTML
        $mail->Subject = 'Password Reset Request';
        $mail->Body    = "You have requested a password reset. Click the link below to reset your password:<br><br><a href=\"$resetLink\">$resetLink</a><br><br>If you did not request this, please ignore this email.";
        $mail->AltBody = "You have requested a password reset. Click the link below to reset your password:\n\n$resetLink\n\nIf you did not request this, please ignore this email.";

        // Send the email
        $mail->send();
        echo 'Password reset link has been sent to your email address.';
    } catch (Exception $e) {
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }
}

// Generate a password reset link (this is a simplified example)
function generateResetLink($email) {
    $token = bin2hex(random_bytes(16)); // Generate a random token
    $resetLink = "http://yourdomain.com/reset-password-form.php?token=$token&email=$email";
    
    // Save the token in the database with the user's email (not shown here)
    // ...

    return $resetLink;
}

// Example usage
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $recipientEmail = $_POST['email'];
    $resetLink = generateResetLink($recipientEmail);
    sendPasswordResetEmail($recipientEmail, $resetLink);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Request Password Reset</title>
</head>
<body>
    <form action="reset-password.php" method="post">
        <label for="email">Enter your email:</label>
        <input type="email" id="email" name="email" required>
        <button type="submit">Send Reset Link</button>
    </form>
</body>
</html>