<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
// Database credentials
$servername = "localhost"; // Change to your database server address if not localhost
$username = "root";        // Replace with your MySQL username
$password = "";            // Replace with your MySQL password
$dbname = "workshop2";     // Replace with your database name

// Create connection using MySQLi
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Close the connection (optional, for good practice)
//$conn->close();
?>  
