<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve form data
    $staff_name = $_POST['staff_name'];
    $staff_number = $_POST['staff_number'];
    $staff_email = $_POST['staff_email'];
    $phone_number = $_POST['phone_number'];
    $specialization = $_POST['specialization'];
    $company_name = $_POST['company_name'];
    $company_office = $_POST['company_office'];
    $company_email = $_POST['company_email'];
    $password = $_POST['password'];
    $retype_password = $_POST['retype_password'];

    // Validate input
    if ($password !== $retype_password) {
        $_SESSION['error'] = 'Passwords do not match!';
        header('Location: register.php');
        exit();
    }

    // Hash the password
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    try {
        // Start a transaction
        $pdo->beginTransaction();

        // Check if the company already exists
        $stmt_company = $pdo->prepare('SELECT Company_Id FROM maintenance_company WHERE Company_Name = :Company_Name AND Company_Email = :Company_Email');
        $stmt_company->bindParam(':Company_Name', $company_name);
        $stmt_company->bindParam(':Company_Email', $company_email);
        $stmt_company->execute();

        if ($stmt_company->rowCount() == 0) {
            // Insert company data if it doesn't exist
            $stmt_company = $pdo->prepare('INSERT INTO maintenance_company (Company_Name, Company_Office_No, Company_Email) VALUES (:Company_Name, :Company_Office_No, :Company_Email)');
            $stmt_company->bindParam(':Company_Name', $company_name);
            $stmt_company->bindParam(':Company_Office_No', $company_office);
            $stmt_company->bindParam(':Company_Email', $company_email);
            $stmt_company->execute();
            $company_id = $pdo->lastInsertId();
        } else {
            // Get the existing company ID
            $company_id = $stmt_company->fetch(PDO::FETCH_ASSOC)['Company_Id'];
        }

        // Insert worker data
        $stmt_worker = $pdo->prepare('INSERT INTO maintenance_worker (Worker_No, Name, Email, Password, Phone_No, Specialization, Company_Id) VALUES (:Worker_No, :Name, :Email, :Password, :Phone_No, :Specialization, :Company_Id)');
        $stmt_worker->bindParam(':Worker_No', $staff_number);
        $stmt_worker->bindParam(':Name', $staff_name);
        $stmt_worker->bindParam(':Email', $staff_email);
        $stmt_worker->bindParam(':Password', $hashed_password);
        $stmt_worker->bindParam(':Phone_No', $phone_number);
        $stmt_worker->bindParam(':Specialization', $specialization);
        $stmt_worker->bindParam(':Company_Id', $company_id);
        $stmt_worker->execute();

        // Commit the transaction
        $pdo->commit();

        $_SESSION['success'] = 'Registration successful!';
        header('Location: login.php');
        exit();
    } catch (PDOException $e) {
        // Rollback the transaction on error
        $pdo->rollBack();
        $_SESSION['error'] = 'Registration failed: ' . $e->getMessage();
        header('Location: register.php');
        exit();
    }
}
?>