<?php
// Include the database connection file
include 'ainaconnection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve form data
    $staff_name = $_POST['staff_name'];
    $staff_number = $_POST['staff_number'];
    $email = $_POST['email'];
    $phone_number = $_POST['phone_number'];
    $specialization = $_POST['specialization'];
    $company_name = $_POST['company_name'];
    $company_number = $_POST['company_number'];
    $company_email = $_POST['email'];
    $company_contact = $_POST['company_contact'];
    $password = $_POST['password'];
    $retypepassword = $_POST['retypepassword'];

    // Validate inputs (e.g., password match, email format)
    if ($password !== $retypepassword) {
        echo "Passwords do not match!";
        exit;
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Invalid email format!";
        exit;
    }

    // Hash the password
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Insert data into the database
    $sql = "INSERT INTO users (staff_name, staff_number, email, phone_number, specialization, company_name, company_number, company_email, company_contact, password) 
            VALUES ('$staff_name', '$staff_number', '$email', '$phone_number', '$specialization', '$company_name', '$company_number', '$company_email', '$company_contact', '$hashed_password')";

    if (mysqli_query($conn, $sql)) {
        echo "Registration successful!";
        // Redirect to the login page or display success message
        header("Location: login.php");
        exit;
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }

    // Close the connection
    mysqli_close($conn);
} else {
    echo "Invalid request method.";
}
?>
