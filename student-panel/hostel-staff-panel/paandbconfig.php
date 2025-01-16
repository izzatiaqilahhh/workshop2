<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
// Database credentials
$servername = "localhost"; // Change to your database server address if not localhost
$username = "root";        // Replace with your MySQL username
$password = "";            // Replace with your MySQL password
$dbname = "Workshop2";     // Replace with your database name


error_reporting(E_ALL);
ini_set('display_errors', 1);

$host = "192.168.0.250";
$user = "paan";
$pass = "abc123";
$db = "workshop2";

// Create connection
$connAisar = new mysqli($host, $user, $pass, $db);

// Check connection
if ($connAisar->connect_error) {
    die("Connection failed: " . $connAisar->connect_error);
}

echo "Connected successfully!<br>";
// Create connection using MySQLi
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Close the connection (optional, for good practice)
//$conn->close();







?>  
