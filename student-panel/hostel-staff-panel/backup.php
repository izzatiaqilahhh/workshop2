<?php
include('qiladbcon.php');

try {
    // Define the backup file name
    $backupFile = 'backup_' . date('Y-m-d_H-i-s') . '.sql';

    // Command to create the backup using pg_dump
    $command = "pg_dump -U username -h localhost -d your_database_name > /path/to/backup/folder/$backupFile";

    // Execute the command
    exec($command);

    echo "Database backup created successfully!";
} catch (Exception $e) {
    echo 'Error creating backup: ' . $e->getMessage();
}
?>
