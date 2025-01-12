<?php
include('ainaconnection.php'); // Include your database connection

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $complaint_id = $_POST['complaint_id'];
    $status = $_POST['status'];
    $progress = $_POST['progress'];

    // Update complaint status and progress
    $sql = "UPDATE complaints SET status = ?, progress_update = ?, updated_at = NOW() WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('ssi', $status, $progress, $complaint_id);

    if ($stmt->execute()) {
        echo "<script>alert('Complaint updated successfully'); window.location.href='assigned_complaints.php';</script>";
    } else {
        echo "<script>alert('Error updating complaint'); window.location.href='assigned_complaints.php';</script>";
    }

    $stmt->close();
    $conn->close();
}
?>