<?php
// Database configuration
$host = 'localhost';       // Database host (usually localhost)
$username = 'root';        // MySQL username (default is 'root' for local servers)
$password = 'password';            // MySQL password (leave empty for XAMPP/WAMP defaults)
$database = 'hostelcomplaint';        // Replace 'test' with your actual database name

// Establish a connection to the MySQL database
$conn = mysqli_connect($host, $username, $password, $database);

// Check the connection
if (!$conn) {
    // Display a detailed error message if the connection fails
    die("Database connection failed: " . mysqli_connect_error());
} else {
    echo "Connected successfully to the database.";
}

// Close the connection (optional, as PHP usually closes it automatically)
mysqli_close($conn);
?>
