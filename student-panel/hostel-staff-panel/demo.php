<?php
if (isset($_POST['backup'])) {
    // Database credentials
    $host = 'localhost';
    $username = 'root'; // Replace with your MySQL username
    $password = ''; // Replace with your MySQL password
    $database = 'Workshop2';

    // Define the output file name and path
    $backupDir = __DIR__ . '/backup';
    if (!is_dir($backupDir)) {
        mkdir($backupDir, 0777, true); // Create backup directory if not exists
    }

    $backupFile = $backupDir . '/market_backup_' . date('Y-m-d_H-i-s') . '.sql';

    // Command to export the database
    $command = "/opt/lampp/bin/mysqldump --user=$username --password=$password --host=$host $database > $backupFile";

    // Execute the command
    system($command, $output);

    // Check if the backup was successful
    if ($output === 0) {
        echo "<script>alert('Database backup successful! Backup saved as: $backupFile');</script>";
    } else {
        echo "<script>alert('Database backup failed. Please check your permissions or command syntax.');</script>";
    }
}

if (isset($_POST['recover'])) {
    // Database credentials
    $host = 'localhost';
    $username = 'root'; // Replace with your MySQL username
    $password = ''; // Replace with your MySQL password
    $database = 'Workshop2';

    // Get the latest backup file
    $backupDir = __DIR__ . '/backup';
    $files = glob($backupDir . '/market_backup_*.sql');
    rsort($files); // Sort files in descending order by name (latest first)

    if (!empty($files)) {
        $latestBackup = $files[0];

        // Command to restore the database
        $command = "/opt/lampp/bin/mysql --user=$username --password=$password --host=$host $database < $latestBackup";

        // Execute the command
        system($command, $output);

        // Check if the recovery was successful
        if ($output === 0) {
            echo "<script>alert('Database recovery successful! Restored from: $latestBackup');</script>";
        } else {
            echo "<script>alert('Database recovery failed. Please check your permissions or command syntax.');</script>";
        }
    } else {
        echo "<script>alert('No backup files found for recovery.');</script>";
    }
}
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
