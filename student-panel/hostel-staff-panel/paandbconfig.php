<?php
// Database configuration
$host = 'localhost';       // Database host (e.g. localhost)
$username = 'root';        // Replace with your database username
$password = '';            // Replace with your database password
$database = 'Workshop2';   // Replace with your database name

// Create a connection using MySQLi
$conn = new mysqli($host, $username, $password, $database);

// Check the connection
if ($conn->connect_error) {
    die('Database connection failed!');
} else {
    echo 'Database connection successful!';
}
?>
