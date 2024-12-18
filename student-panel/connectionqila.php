<?php
$connection = pg_connect("host=localhost dbname=workshop2 user=postgres password=postgresql");
if (!$connection) {
    echo "An error occured.<br>";
    exit;
}
?>
