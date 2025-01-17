<?php
$host = '10.147.19.12';
$port = '3306';
$dbname = 'utemhostelcomplaint';
$user = 'root';
$password = 'password';

try {
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    $query = $pdo->query("SHOW TABLES");

    echo "Tables in the database:\n";
    while ($row = $query->fetch(PDO::FETCH_NUM)) {
        echo $row[0] . "\n";
    }
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}
?>