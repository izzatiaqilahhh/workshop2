<?php
// Database configuration
$host = 'localhost';       // Database host (e.g., localhost)
$username = 'root'; // Replace with your database username
$password = ''; // Replace with your database password
$database = 'Workshop2'; // Replace with your database name

// Create a connection
$conn = new mysqli($host, $username, $password, $database);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Connection successful!";
}
?>
