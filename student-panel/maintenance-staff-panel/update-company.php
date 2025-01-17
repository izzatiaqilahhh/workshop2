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
    $company_name = $_POST['Company_Name'];
    $company_office_no = $_POST['Company_Office_No'];
    $company_email = $_POST['Company_Email'];
    $company_id = $_SESSION['company_id']; // Assume company ID is stored in session

    try {
        $stmt = $pdo->prepare('UPDATE maintenance_company SET Company_Name = :Company_Name, Company_Office_No = :Company_Office_No, Company_Email = :Company_Email WHERE Company_Id = :Company_Id');
        $stmt->bindParam(':Company_Name', $company_name);
        $stmt->bindParam(':Company_Office_No', $company_office_no);
        $stmt->bindParam(':Company_Email', $company_email);
        $stmt->bindParam(':Company_Id', $company_id);
        $stmt->execute();

        $_SESSION['success'] = "Company details updated successfully.";
    } catch (PDOException $e) {
        $_SESSION['error'] = "Failed to update company details: " . $e->getMessage();
    }

    header("Location: profile.php");
    exit();
}
?>