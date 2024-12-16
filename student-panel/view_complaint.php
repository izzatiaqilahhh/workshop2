<?php
// Database connection
$conn = new mysqli('localhost', 'root', 'password', 'hostel_complaints');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get complaint ID
$complaintId = $_GET['id'];

// Fetch complaint details
$result = $conn->query("SELECT * FROM complaints WHERE id = $complaintId");
if ($result->num_rows > 0) {
    $complaint = $result->fetch_assoc();
    echo "<h1>Complaint Details</h1>";
    echo "<p><strong>Type:</strong> {$complaint['complaint_type']}</p>";
    echo "<p><strong>Issue:</strong> {$complaint['issue_type']}</p>";
    echo "<p><strong>Description:</strong> {$complaint['complaint_description']}</p>";
    echo "<p><strong>Date:</strong> {$complaint['created_at']}</p>";
    echo "<p><strong>Status:</strong> {$complaint['status']}</p>";
} else {
    echo "Complaint not found.";
}

$conn->close();
?>
