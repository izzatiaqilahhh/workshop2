<?php
$host = '127.0.0.1'; // or your actual host, e.g., 'localhost'
$dbname = 'hostelcomplaint'; // your actual database name
$username = 'root'; // your actual database username
$password = 'password'; // your actual database password

$dsn = "mysql:host=$host;dbname=$dbname;charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // Connection successful message for debugging
    echo "Connected successfully to the database.";
} catch (PDOException $e) {
    // Handle database connection errors
    echo 'Database connection failed: ' . $e->getMessage();
    exit();
}
?>