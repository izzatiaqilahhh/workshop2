<?php
require 'ainaconnection.php';
require 'teahdbconfig.php'; // Database configuration for students
require 'qiladbcon.php'; // Database configuration for hostel staff

$complaintId = $_GET['Complaint_Id'] ?? '';

if ($complaintId) {
    try {
        // Fetch the latest status from the Complaint_Status table
        $sql = "SELECT complaint_status,FROM complaint_status WHERE complaint_id = :complaintId;";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':complaintId' => $complaintId]);

        $status = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($status) {
            echo "Status: " . htmlspecialchars($status['Complaint_Status']) . "<br>";
        } else {
            echo "No status found for Complaint ID: " . htmlspecialchars($complaintId);
        }
    } catch (PDOException $e) {
        echo 'Error fetching status: ' . $e->getMessage();
    }
} else {
    echo "No Complaint ID provided.";
}
?>