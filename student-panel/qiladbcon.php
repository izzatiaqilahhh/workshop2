<?php
$connection = pg_connect("host=localhost dbname=hrcs user=postgres password=postgresql");

if (!$connection) {
    echo "An error occurred while connecting to the database.<br>";
    exit;
}

echo "Connection successful.";
?>
