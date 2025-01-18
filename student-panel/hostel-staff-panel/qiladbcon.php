<?php
try {
    $pdo = new PDO('pgsql:host=localhost;dbname=ehrcs', 'postgres', 'postgresql');
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
    exit;
}
