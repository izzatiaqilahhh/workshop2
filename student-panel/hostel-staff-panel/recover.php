<?php
// Database credentials
$dbHost = 'localhost'; // Database host
$dbPort = '5432';      // Default PostgreSQL port
$dbName = 'ehrcs'; // Name of the database to restore
$dbUser = 'postgres';  // PostgreSQL username
$dbPassword = 'postgresql'; // PostgreSQL password

// Backup file path
$backupFile = 'C:\xampp\htdocs\workshop2\workshop2\postgres-backup\latest_backup.sql'; // Full path to the backup file

// Ensure backup file exists
if (!file_exists($backupFile)) {
    die("Error: Backup file not found: $backupFile");
}

// Set the environment variable for password
putenv("PGPASSWORD=$dbPassword");

// Command to restore the database
$command = "psql -h $dbHost -p $dbPort -U $dbUser -d $dbName -f \"$backupFile\"";

// Execute the restore command
$output = [];
$returnVar = 0;
exec($command, $output, $returnVar);

// Check if the restore was successful
if ($returnVar === 0) {
    echo "Database restored successfully from $backupFile.<br>";

    // Verify the restoration by checking if foreign tables exist in the database
    $checkQuery = "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';";
    
    // Connect to the database and perform a query to check the foreign tables
    $conn = pg_connect("host=$dbHost port=$dbPort dbname=$dbName user=$dbUser password=$dbPassword");
    
    if (!$conn) {
        echo "Error: Unable to connect to the database.";
    } else {
        $result = pg_query($conn, $checkQuery);
        if ($result) {
            echo "Tables in the database:<br>";
            while ($row = pg_fetch_assoc($result)) {
                echo $row['table_name'] . "<br>";
            }
        } else {
            echo "Error: Unable to retrieve foreign table information.";
        }
    }
} else {
    echo "Error: Failed to restore the database. Check the backup file and database connection.<br>";
    echo "<pre>" . implode("\n", $output) . "</pre>";
}
?>