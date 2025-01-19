<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Include database connection file
include 'paandbconfig.php';

// Query to fetch complaint trends
$trend_query = "
    SELECT DATE(Date_Created) AS date, COUNT(*) AS count 
    FROM Complaint 
    GROUP BY DATE(Date_Created)
    ORDER BY date ASC;
";

$result = $conn->query($trend_query);

// Prepare the data for JSON response
$dates = [];
$counts = [];
while ($row = $result->fetch_assoc()) {
    $dates[] = $row['date'];
    $counts[] = $row['count'];
}

// Return JSON response
header('Content-Type: application/json');
echo json_encode([
    'dates' => $dates,
    'counts' => $counts
]);
