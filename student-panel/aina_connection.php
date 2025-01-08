<?php
// Database connection settings
$servername = 'config'; // Change if your database is hosted elsewhere
$username = 'root';      // Your MySQL username
$password = '';      // Your MySQL password
$database = 'hostelcomplaint'; // Replace with your database name

// Create a connection
$conn =  new mysqli($servername, $username, $password, $database);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Connected successfully to the database!";
}

// Close the connection (optional, script usually does this at the end)
$conn->close();
?>
