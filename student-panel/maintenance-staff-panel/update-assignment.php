<?php
include 'ainaconnection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $complaint_id = $_POST['complaint_id'];
    $worker_id = $_POST['worker_id'];
    $remarks = $_POST['remarks'];

    // Update the assignment in the database
    $query = "UPDATE Complaint_Assignment SET Remarks = ?, Date_Assigned = current_timestamp() WHERE Complaint_Id = ? AND Worker_Id = ?";
    $stmt = $pdo->prepare($query);
    $stmt->execute([$remarks, $complaint_id, $worker_id]);

    // Redirect back to the assigned complaint page
    header("Location: assigned-complaint.php");
    exit();
} else {
    echo "Invalid request.";
}
?>