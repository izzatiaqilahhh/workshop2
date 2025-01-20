<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database credentials
$dsn = "pgsql:host=10.147.20.11;dbname=ehrcs"; // Data Source Name
$user = "fathehah";        // Replace with your PostgreSQL username
$password = "password"; // Replace with your PostgreSQL password

try {
    // Create a PDO instance
    $conn = new PDO($dsn, $user, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connection successful!";
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>