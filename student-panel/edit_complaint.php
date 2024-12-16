<?php
// Database connection
$conn = new mysqli('localhost', 'root', '', 'hostel_complaints');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$complaintId = $_GET['id'];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $description = $_POST['description'];
    $conn->query("UPDATE complaints SET complaint_description = '$description' WHERE id = $complaintId");
    echo "Complaint updated successfully!";
}

// Fetch complaint details
$result = $conn->query("SELECT * FROM complaints WHERE id = $complaintId");
$complaint = $result->fetch_assoc();
?>

<form method="POST">
    <textarea name="description" rows="4" required><?php echo $complaint['complaint_description']; ?></textarea>
    <button type="submit">Update Complaint</button>
</form>
