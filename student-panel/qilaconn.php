<?php
$host = getenv('DB_HOST') ?: '10.147.20.11'; // Change to your actual host, e.g., 'localhost'
$dbname = getenv('DB_NAME') ?: 'ehrcs'; // Change to your actual database name
$username = getenv('DB_USER') ?: 'fathehah'; // Change to your actual database username
$password = getenv('DB_PASS') ?: 'password'; // Change to your actual database password

$dsn = "pgsql:host=$host;dbname=$dbname";

try {
    $pdo = new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);
    // Connection successful message
    echo "Connected successfully to the database.";
} catch (PDOException $e) {
    // Log database connection errors and display a generic error message
    error_log('Database connection failed: ' . $e->getMessage());
    echo 'Database connection failed. Please try again later.';
    exit();
}
?>