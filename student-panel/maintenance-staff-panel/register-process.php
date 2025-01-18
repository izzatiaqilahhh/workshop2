<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

include 'ainaconnection.php'; // Ensure this file includes the database connection setup

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['registerBtn'])) {
    // Retrieve form data
    $name = trim($_POST['name']);
    $worker_no = trim($_POST['worker_no']);
    $email = trim($_POST['email']);
    $phone_no = trim($_POST['phone_no']);
    $specialization = trim($_POST['specialization']);
    $company_id = trim($_POST['company_id']);
    $password = trim($_POST['password']);
    $retype_password = trim($_POST['retype_password']);

    // Validate form data
    if (empty($name) || empty($worker_no) || empty($email) || empty($phone_no) ||
        empty($specialization) || empty($company_id) || empty($password) || empty($retype_password)) {
        $_SESSION['error'] = "All fields are required.";
        header('Location: register.php');
        exit();
    } elseif ($password !== $retype_password) {
        $_SESSION['error'] = "Passwords do not match.";
        header('Location: register.php');
        exit();
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $_SESSION['error'] = "Invalid email address.";
        header('Location: register.php');
        exit();
    }

    // Hash the password
    $hashed_password = password_hash($password, PASSWORD_BCRYPT);

    // Insert user data into the database
    try {
        $stmt = $pdo->prepare("INSERT INTO Maintenance_Worker (Worker_No, Name, Email, Password, Phone_No, Specialization, Company_Id) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([$worker_no, $name, $email, $hashed_password, $phone_no, $specialization, $company_id]);

        // Set a session flag for successful registration
        $_SESSION['registration_success'] = true;
        header('Location: register.php');
        exit();
    } catch (PDOException $e) {
        $_SESSION['error'] = "Registration failed: " . $e->getMessage();
        header('Location: register.php');
        exit();
    }
} else {
    // Redirect to the registration page if the form is not submitted
    header('Location: register.php');
    exit();
}
?>