<?php
require 'config/function.php';
if (isset($_POST['registerBtn'])) {
    $staffnoInput = validate($_POST['staffno']);
    $nameInput = validate($_POST['name']);
    $emailInput = validate($_POST['email']);
    $phoneInput = validate($_POST['phone']);
    $passwordInput = validate($_POST['password']);
    $passwordInput = validate($_POST['cpassword']);
    $staffNo = filter_var($staffnoInput, FILTER_SANITIZE_STRING);
    $name = filter_var($nameInput, FILTER_SANITIZE_STRING);
    $email = filter_var($emailInput, FILTER_SANITIZE_EMAIL);
    $phone = filter_var($phoneInput, FILTER_SANITIZE_STRING);
    $password = filter_var($passwordInput, FILTER_SANITIZE_STRING);
    $password = filter_var($passwordInput, FILTER_SANITIZE_STRING);
    if (
        $staffNo != '' &&
        $name != '' &&
        $email != '' &&
        $phone != '' &&
        $password != '' &&
        $password != ''
    ) {

        // Check if passwords match
        if ($password !== $password) {
            redirect('register.php', 'The password entered does not match!');
        }

        // Check if email already exists
        $emailCheckQuery = "SELECT * FROM admin WHERE email='$email' LIMIT 1";
        $emailCheckResult = mysqli_query($conn, $emailCheckQuery);
        if ($emailCheckResult && mysqli_num_rows($emailCheckResult) > 0) {
            redirect('register.php', 'Email address already exists!');
        }

        // Hash the password
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Insert new user into the database
        $insertQuery = "INSERT INTO admin (staffno, name, email, phone, password) VALUES ('$staffNo', '$name', '$email', '$phone', '$hashedPassword')";
        $insertResult = mysqli_query($conn, $insertQuery);
        if ($insertResult) {
            redirect('index.php', 'You have successfully registered. Please login.');
        } else {
            redirect('register.php', 'Something went wrong!');
        }
    } else {
        redirect('register.php', 'All fields are mandatory!');
    }
}
