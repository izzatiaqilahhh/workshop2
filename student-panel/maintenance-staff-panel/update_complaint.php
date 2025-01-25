<?php
session_start();

if (!isset($_SESSION['maintenance_staff'])) {
    header('Location: maintenanceStaffLogin.php');
    exit();
}

include 'ainaconnection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $complaint_id = $_POST['Complaint_ID'];
    $new_status = htmlspecialchars(trim($_POST['Complaint_Status']));
    $status_description = htmlspecialchars(trim($_POST['Status_Description']));
    $worker_no = $_SESSION['maintenance_staff']; // Current logged-in worker

    try {
        // Update the complaint status
        $query = "
            UPDATE complaint_status 
            SET Complaint_Status = :new_status, 
                Description = :status_description, 
                Date_Update_Status = NOW() 
            WHERE Complaint_ID = :complaint_id
        ";

        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':new_status', $new_status, PDO::PARAM_STR);
        $stmt->bindParam(':status_description', $status_description, PDO::PARAM_STR);
        $stmt->bindParam(':complaint_id', $complaint_id, PDO::PARAM_INT);  // Correcting the parameter type for integer
        $stmt->execute();

        // Redirect back with a success message
        header('Location: assigned-complaint.php?success=Status updated successfully');
        exit();
    } catch (PDOException $e) {
        error_log($e->getMessage());
        // Redirect with an error message
        header('Location: assigned-complaint.php?error=Failed to update status');
        exit();
    }
}
?>