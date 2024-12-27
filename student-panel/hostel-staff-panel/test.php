<?php
$connection = pg_connect("host=localhost dbname=hrcs user=postgres password=postgresql");

if ($connection) {
    echo "Connection successful";
    exit;
    }
    
?>