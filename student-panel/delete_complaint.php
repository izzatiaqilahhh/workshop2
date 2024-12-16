<?php
// Database connection
$conn = new mysqli('localhost', 'root', '', 'hostel_complaints');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$complaintId = $_GET['id'];

// Delete complaint
$conn->query("DELETE FROM complaints WHERE id = $complaintId");
echo "Complaint deleted successfully!";
$conn->close();
?>
