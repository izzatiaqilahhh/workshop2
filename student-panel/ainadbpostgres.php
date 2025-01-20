<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database credentials
$dsn = "pgsql:host=10.147.20.11;dbname=ehrcs"; // Data Source Name
$user = "aina";        // Replace with your PostgreSQL username
$password = "password"; // Replace with your PostgreSQL password

try {
    // Create a PDO instance
    $conn = new PDO($dsn, $user, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connection successful!<br>";

    // Query to get all table names in the public schema
    $query = $conn->query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'");
    
    echo "<html><body>";
    echo "<h1>Tables and their data:</h1>";

    while ($row = $query->fetch(PDO::FETCH_NUM)) {
        $table = $row[0];
        echo "<h2>Table: $table</h2>";

        // Fetch all data from the table
        $dataQuery = $conn->query("SELECT * FROM \"$table\"");
        
        // Fetch columns for the table
        $columnsQuery = $conn->query("SELECT column_name FROM information_schema.columns WHERE table_name = '$table'");
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
    echo "Connection failed: " . $e->getMessage();
}
?>
