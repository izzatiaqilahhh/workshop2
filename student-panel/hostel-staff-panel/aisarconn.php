<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

$host = "192.168.0.250";
$user = "paan";
$pass = "abc123";
$db = "workshop2";

// Create connection
$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo "Connected successfully!<br>";

// Query the MySQL BED table
$staff_query = "SELECT StaffID, Name FROM STAFF";
$staff_result = $conn->query($staff_query);

if (!$staff_result) {
    die("Error retrieving booking data from MySQL: " . $conn->error);
}

// Display the data
echo "<h2>STAFF Details:</h2>";
echo "<table border='1'>";
echo "<tr><th>StaffID</th><th>Name</th></tr>";

while ($row = $staff_result->fetch_assoc()) {
    echo "<tr>";
    echo "<td>" . htmlspecialchars($row['StaffID']) . "</td>"; // Use htmlspecialchars for security
    echo "<td>" . htmlspecialchars($row['Name']) . "</td>";
    echo "</tr>";
}

echo "</table>";

// Close MySQL connection
//$conn->close();

?>