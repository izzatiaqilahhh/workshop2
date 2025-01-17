<?php
include('ainaconnection.php'); // Include your database connection file

// Fetch new complaints
$sql = "SELECT id, title, description FROM complaints WHERE is_notified = 0";
$result = $conn->query($sql);

$new_complaints = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $new_complaints[] = $row;
    }

    // Mark complaints as notified
    $update_sql = "UPDATE complaints SET is_notified = 1 WHERE is_notified = 0";
    $conn->query($update_sql);
}

header('Content-Type: application/json');
echo json_encode($new_complaints);
?>