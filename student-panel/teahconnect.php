<?php
$host = "127.0.0.1";   // MariaDB host (localhost)
$port = "3306";         // MariaDB default port
$user = "root";         // Your MariaDB username
$password = "password";         // Your MariaDB password
$database = "utemhostelcomplaintsystem";  // Your database name

// Create a connection using mysqli
$conn = new mysqli($host, $user, $password, $database, $port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully to MariaDB on port 3306";

// Close connection
$conn->close();
?>
