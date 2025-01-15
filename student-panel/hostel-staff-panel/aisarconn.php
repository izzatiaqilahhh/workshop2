<?php
$host = "192.168.0.250";
$user = "root";
$pass = "";
$db = "workshop2";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Failed to connect to the database: " . $conn->connect_error);
}
?>