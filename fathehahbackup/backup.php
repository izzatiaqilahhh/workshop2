<?php
ob_start(); // Start output buffering

if (isset($_POST['backup'])) {
    // Database credentials
    $host = '127.0.0.1';
    $username = 'root';
    $password = 'password';
    $database = 'hostelcomplaint';

    // Define the output file name and path
    $backupDir = __DIR__ . '\\backup';
    if (!is_dir($backupDir)) {
        mkdir($backupDir, 0777, true); // Create backup directory if not exists
    }

    $backupFile = $backupDir . '\\complaint_backup_' . date('Y-m-d_H-i-s') . '.sql';

    // Command to export the database
    $command = "C:\\xampp\\mysql\\bin\\mysqldump --user=$username --password=$password --host=$host $database > $backupFile";

    // Execute the command
    exec($command . ' 2>&1', $output, $return_var);

    // Output the command for debugging
    echo "<pre>Command: $command\nOutput:\n" . implode("\n", $output) . "\nReturn Code: $return_var</pre>";

    // Check if the backup was successful
    if ($return_var === 0) {
        echo "<script>alert('Database backup successful! Backup saved as: $backupFile');</script>";
    } else {
        echo "<script>alert('Database backup failed. Please check your permissions or command syntax.');</script>";
    }
}

if (isset($_POST['recover'])) {
    // Database credentials
    $host = '127.0.0.1';
    $username = 'root';
    $password = 'password';
    $database = 'hostelcomplaint';

    // Get the latest backup file
    $backupDir = __DIR__ . '\\backup';
    $files = glob($backupDir . '\\complaint_backup_*.sql');
    rsort($files); // Sort files in descending order by name (latest first)

    if (!empty($files)) {
        $latestBackup = $files[0];

        // Command to restore the database
        $command = "C:\\xampp\\mysql\\bin\\mysql --user=$username --password=$password --host=$host $database < $latestBackup";

        // Execute the command
        exec($command . ' 2>&1', $output, $return_var);

        // Output the command for debugging
        echo "<pre>Command: $command\nOutput:\n" . implode("\n", $output) . "\nReturn Code: $return_var</pre>";

        // Check if the recovery was successful
        if ($return_var === 0) {
            echo "<script>alert('Database recovery successful! Restored from: $latestBackup');</script>";
        } else {
            echo "<script>alert('Database recovery failed. Please check your permissions or command syntax.');</script>";
        }
    } else {
        echo "<script>alert('No backup files found for recovery.');</script>";
    }
}

ob_end_flush(); // Flush the output buffer
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Database Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f9;
        }
        form {
            display: flex;
            gap: 10px;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            background-color: #007BFF;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form method="post">
        <button type="submit" name="backup">Backup Database</button>
        <button type="submit" name="recover">Recover Database</button>
    </form>
</body>
</html>