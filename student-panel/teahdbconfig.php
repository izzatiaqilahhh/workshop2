<?php
// Database connection details
$host = "127.0.0.1";    // Database server
$user = "root";         // Database username
$password = "password"; // Database password
$dbname = "hostelcomplaint"; // Database name

// Create connection
$conn = new mysqli($host, $user, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

// Close the connections
$conn->close();
?>
