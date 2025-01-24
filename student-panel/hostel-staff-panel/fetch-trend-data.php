<?php
include 'qiladbcon.php';
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Query to fetch complaint trends
$trend_query = "
    SELECT DATE(date_created) AS date, COUNT(*) AS count 
    FROM complaint 
    GROUP BY DATE(date_created)
    ORDER BY date ASC;
";

$result = $pdo->query($trend_query);

// Check if the query was successful
if (!$result) {
    // Handle query error
    echo json_encode(['error' => 'Query failed: ' . $pdo->errorInfo()[2]]);
    exit;
}

// Prepare the data for JSON response
$dates = [];
$counts = [];
while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
    $dates[] = $row['date'];
    $counts[] = $row['count'];
}

// Return JSON response
header('Content-Type: application/json');
echo json_encode([
    'dates' => $dates,
    'counts' => $counts
]);
?>