<?php
$host = '10.147.20.14'; // ZeroTier IP of your friend's MySQL server
$dbname = 'Workshop2';
$port = '3306';
$username = 'theha';
$password = 'abc123';

$dsn = "mysql:host=$host;dbname=$dbname;port=$port;charset=utf8mb4";

try {
    $mysql_pdo = new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);
    // Connection successful message for debugging (optional)
    //"Connected successfully to the MySQL database.";
} catch (PDOException $e) {
    error_log('MySQL database connection failed: ' . $e->getMessage());
    echo 'Database connection failed. Please try again later.';
    exit();
}
?>