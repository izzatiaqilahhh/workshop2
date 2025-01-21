<?php
// pg_conn.php

$host = '10.147.20.11';
$db = 'ehrcs';
$user = 'fathehah';
$pass = 'password';
$port = '5432'; // Default is 5432

try {
    $pgsql_pdo = new PDO("pgsql:host=$host;port=$port;dbname=$db", $user, $pass);
    $pgsql_pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo 'Connected successfully to the PostgreSQL database.<br>';
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
    exit();
}
?>



