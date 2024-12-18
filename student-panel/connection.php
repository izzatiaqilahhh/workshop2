<?php
// Database connection settings
$host = 'localhost'; // Change if your database is hosted elsewhere
$user = 'root';      // Your MySQL username
$password = '';      // Your MySQL password
$database = 'hostelcomplaint'; // Replace with your database name

// Create a connection
$conn =  new mysqli($host, $user, $password, $database);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Connected successfully to the database!";
}

// Close the connection (optional, script usually does this at the end)
$conn->close();
?>
