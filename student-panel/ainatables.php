<?php
$host = '10.147.20.16';
$port = '3306';
$dbname = 'utemhostelcomplaint';
$user = 'tehah';
$password = 'password123';

try {
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    $query = $pdo->query("SHOW TABLES");

    echo "<html><body>";
    echo "<h1>Tables and their data:</h1>";

    while ($row = $query->fetch(PDO::FETCH_NUM)) {
        $table = $row[0];
        echo "<h2>Table: $table</h2>";

        $dataQuery = $pdo->query("SELECT * FROM $table");
        $columnsQuery = $pdo->query("DESCRIBE $table");
        $columns = $columnsQuery->fetchAll(PDO::FETCH_COLUMN);

        // Print column headers
        echo "<table border='1'><tr>";
        foreach ($columns as $column) {
            echo "<th>$column</th>";
        }
        echo "</tr>";

        // Fetch and print table data
        while ($data = $dataQuery->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            foreach ($columns as $column) {
                echo "<td>" . htmlspecialchars($data[$column]) . "</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    }

    echo "</body></html>";
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}
?>