<?php
$connection = pg_connect("host=localhost dbname=ehrcs user=postgres password=postgresql");
if (!$connection) {
    echo "An error occured.<br>";
    exit;
}
?>