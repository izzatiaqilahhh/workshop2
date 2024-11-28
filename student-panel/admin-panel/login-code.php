<?php
require 'config/function.php';
if (isset($_POST['loginBtn'])) {
    $emailInput = validate($_POST['email']);
    $passwordInput = validate($_POST['password']); 
    $email = filter_var($emailInput, FILTER_SANITIZE_EMAIL);
    $password = filter_var($passwordInput, FILTER_SANITIZE_STRING);
    if ($email != '' && $password != '') {
        $query = "SELECT * FROM admin WHERE email='$email' LIMIT 1";
        $result = mysqli_query($conn, $query);
        if ($result) {
            if (mysqli_num_rows($result) == 1) {
                $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
                $hashedPassword = $row['password'];
                if (!password_verify($password, $hashedPassword)) {
                    redirect('index.php', 'Wrong password! Please try again.');
                }
                $_SESSION['auth'] = true;
                $_SESSION['loggedInAdminRole'] = $row['role'];
                $_SESSION['loggedInAdmin'] = [
                    'name' => $row['name'],
                    'email' => $row['email'],
                    'id' => $row['id']
                ];

                // Redirect based on the admin role
                if ($row['role'] == 'admin') {
                    redirect('admin/index.php', 'You have successfully logged in.');
                } else {
                    redirect('admin/index.php', 'You have successfully logged in.');
                }
            } else {
                redirect('index.php', 'No admin found with that email address!');
            }
        } else {
            redirect('index.php', 'Something went wrong!');
        }
    } else {
        redirect('index.php', 'All fields are mandatory!');
    }
}
