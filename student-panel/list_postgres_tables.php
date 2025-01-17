<?php
$host = '10.147.20.11';
$port = '5432'; // Default port for PostgreSQL
$dbname = 'ehrcs';
$user = 'postgres';
$password = 'postgresql';

try {
    $pdo = new PDO("pgsql:host=$host;port=$port;dbname=$dbname", $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    $query = $pdo->query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'");

    echo "Tables in the database:\n";
    while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
        echo $row['table_name'] . "\n";
    }
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}
?>