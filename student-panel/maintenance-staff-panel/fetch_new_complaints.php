<?php
session_start();
if (!isset($_SESSION['maintenance_staff'])) {
    echo json_encode([]); // Return an empty array if not logged in
    exit();
}

include 'ainaconnection.php';

$worker_no = $_SESSION['maintenance_staff']; // Get the current worker's ID

// Query to get new complaints assigned to the current worker
try {
    $stmt = $pdo->prepare("
        SELECT c.Complaint_Type, c.Complaint_Issue, c.Description, c.Date_Created
        FROM complaint c
        LEFT JOIN complaint_assignment ca ON c.Complaint_ID = ca.Complaint_Id
        WHERE ca.Worker_No = :worker_no AND c.Complaint_Status = 'New'"); // Adjust status if needed
    $stmt->bindParam(':worker_no', $worker_no);
    $stmt->execute();

    // Fetch all complaints
    $complaints = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($complaints);
} catch (PDOException $e) {
    echo json_encode([]); // Return an empty array in case of error
    error_log($e->getMessage());
}
?>