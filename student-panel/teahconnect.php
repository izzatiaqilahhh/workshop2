<?php
$host = "127.0.0.1";    // Database server
$user = "root";         // Database username
$password = "password";         // Database password
$dbname = "utemhostelcomplaintsystem"; // Database name

// Create connection
$conn = new mysqli($host, $user, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

// Close connection
$conn->close();
?>
