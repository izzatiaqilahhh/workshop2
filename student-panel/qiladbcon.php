<?php
// Connection parameters
$host = "localhost";
$port = "5432";
$dbname = "hrcs";
$user = "postgres";
$password = "postgresql";

// Connection string
$conn_string = "host=$host port=$port dbname=$dbname user=$user password=$password";

// Connect to the database
$dbconn = pg_connect($conn_string);

if (!$dbconn) {
    echo "Error: Unable to connect to the database.";
} else {
    echo "Successfully connected to the database.";
}

// Close the connection
pg_close($dbconn);
?>