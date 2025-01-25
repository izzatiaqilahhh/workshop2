<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['maintenance_staff'])) {
    header("Location: maintenanceStaffLogin.php");
    exit();
}

// Include database configuration and functions
include('teahdbconfig.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $company_name = $_POST['company_name'];
    $company_office_no = $_POST['company_office_no'];
    $company_email = $_POST['company_email'];
    $company_id = $_SESSION['company_id']; // Assume company ID is stored in session

    try {
        $stmt = $pdo->prepare('UPDATE maintenance_company SET company_name = :company_name, company_office_no = :company_office_no, company_email = :company_email WHERE company_id = :company_id');
        $stmt->bindParam(':company_name', $company_name);
        $stmt->bindParam(':company_office_no', $company_office_no);
        $stmt->bindParam(':company_email', $company_email);
        $stmt->bindParam(':company_id', $company_id);
        $stmt->execute();

        $_SESSION['success'] = "Company details updated successfully.";
    } catch (PDOException $e) {
        $_SESSION['error'] = "Failed to update company details: " . $e->getMessage();
    }

    header("Location: profile.php");
    exit();
}
?>