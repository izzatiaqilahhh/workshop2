<?php
// Database configuration
$host = getenv('DB_HOST') ?: '127.0.0.1'; // or your actual host, e.g., 'localhost'
$dbname = getenv('DB_NAME') ?: 'utemhostelcomplaint'; // your actual database name
$username = getenv('DB_USER') ?: 'root'; // your actual database username
$password = getenv('DB_PASS') ?: 'password'; // your actual database password

// Backup directory
$backupDir = 'C:/backups';
$date = date('Ymd_His');
$backupFile = $backupDir . '/' . $dbname . '_backup_' . $date . '.sql';

// Ensure the backup directory exists
if (!file_exists($backupDir)) {
    mkdir($backupDir, 0777, true);
}

// Command to execute
$command = "mysqldump --host=$host --user=$username --password=$password $dbname > $backupFile 2>&1";

// Execute the command
$output = [];
$return_var = null;
exec($command, $output, $return_var);

// Check if the command executed successfully
if ($return_var === 0) {
    echo "Backup successful: $backupFile";
} else {
    echo "Backup failed. Error code: $return_var\n";
    echo "Output:\n" . implode("\n", $output);
}

// Optional: Delete backups older than 7 days
$files = glob($backupDir . '/*.sql');
$now = time();

foreach ($files as $file) {
    if (is_file($file)) {
        if ($now - filemtime($file) >= 7 * 24 * 60 * 60) { // 7 days
            unlink($file);
        }
    }
}
?>