<?php
include 'paandbconfig.php';

// Retrieve filters
$status = isset($_GET['Status']) ? $_GET['Status'] : '';
$startDate = isset($_GET['Date_Created']) ? $_GET['Date_Created'] : '';
$endDate = isset($_GET['Date_Resolved']) ? $_GET['Date_Resolved'] : '';

// Build the query dynamically
$query = "SELECT 
            COUNT(*) AS total,
            SUM(CASE WHEN status = 'Resolved' THEN 1 ELSE 0 END) AS Resolved,
            SUM(CASE WHEN status = 'Pending' THEN 1 ELSE 0 END) AS Pending,
            SUM(CASE WHEN status = 'In progress' THEN 1 ELSE 0 END) AS Progress
          FROM Complaint WHERE 1=1";

if ($status) {
    $query .= " AND status = '$status'";
}
if ($startDate) {
    $query .= " AND Date_Created >= '$startDate'";
}
if ($endDate) {
    $query .= " AND Date_Created <= '$endDate'";
}

$result = $conn->query($query);
$data = $result->fetch_assoc();

echo json_encode($data);
