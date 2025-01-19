<?php
$host = '10.147.20.11'; // e.g., 10.147.20.17
$dbname = 'ehrcs';
$port = '5432';
$username = 'fathehah';
$password = 'password';

$dsn = "pgsql:host=$host;dbname=$dbname;port=$port";

try {
    $pgsql_pdo = new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);
    echo "Connected successfully to the PostgreSQL database.";
} catch (PDOException $e) {
    error_log('PostgreSQL database connection failed: ' . $e->getMessage());
    echo 'Database connection failed. Please try again later.';
    exit();
}
?>