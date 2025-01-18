<?php
$host = getenv('DB_HOST') ?: '127.0.0.1'; // or your actual host, e.g., 'localhost'
$dbname = getenv('DB_NAME') ?: 'hostelcomplaint'; // your actual database name
$username = getenv('DB_USER') ?: 'root'; // your actual database username
$password = getenv('DB_PASS') ?: 'password'; // your actual database password

$dsn = "mysql:host=$host;dbname=$dbname;charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);
    // Connection successful message for debugging (optional)
    // echo "Connected successfully to the database.";
} catch (PDOException $e) {
    // Log database connection errors and display a generic error message
    error_log('Database connection failed: ' . $e->getMessage());
    echo 'Database connection failed. Please try again later.';
    exit();
}
?>