<?php
include('qiladbcon.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['backup_file'])) {
    $backupFile = $_FILES['backup_file']['tmp_name'];
    
    try {
        // Command to restore the database using pg_restore
        $command = "pg_restore -U username -h localhost -d your_database_name $backupFile";
        
        // Execute the command
        exec($command);
        
        echo "Database restored successfully!";
    } catch (Exception $e) {
        echo 'Error restoring database: ' . $e->getMessage();
    }
} else {
    echo 'No backup file uploaded!';
}
?>
