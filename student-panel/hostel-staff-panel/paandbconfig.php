<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database credentials
$dsn = "pgsql:host=10.147.20.11;dbname=ehrcs"; // Data Source Name
$user = "paan";        // Replace with your PostgreSQL username
$password = "password"; // Replace with your PostgreSQL password

try {
    // Create a PDO instance
    $conn = new PDO($dsn, $user, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connection successful!<br>";

    // Table to query
    $tableName = "complaint"; // Replace with your table name

    // Query to fetch all data from the table
    $query = "SELECT * FROM $tableName";

    // Prepare and execute the query
    $stmt = $conn->prepare($query);
    $stmt->execute();

    // Fetch all rows as an associative array
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Check if the table contains any data
    if (!empty($result)) {
        // Display the results
        echo "<table border='1' cellpadding='5' cellspacing='0'>";
        echo "<tr>";
        foreach (array_keys($result[0]) as $column) {
            echo "<th>$column</th>";
        }
        echo "</tr>";
        foreach ($result as $row) {
            echo "<tr>";
            foreach ($row as $cell) {
                echo "<td>$cell</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "The table '$tableName' is empty.";
    }
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

/*error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database connection details
$servername = "10.147.20.12";
$username = "paan";
$port = "3306";
$password = "password";
$database = "utemhostelcomplaint";

try {
    // Create a PDO connection
    $pdo = new PDO(
        "mysql:host=$servername;port=$port;dbname=$database",
        $username,
        $password,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    // Check if the form is submitted for the update operation
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Prepare an update query
        $stmt = $pdo->prepare("UPDATE STUDENT SET name = :name, email = :email WHERE student_id = :student_id");

        // Bind parameters
        $stmt->bindParam(':name', $_POST['name']);
        $stmt->bindParam(':email', $_POST['email']);
        $stmt->bindParam(':student_id', $_POST['student_id']);

        // Execute the query
        $stmt->execute();

        echo "<p style='color: green;'>Record updated successfully!</p>";
    }

    // Query to fetch data from the STUDENT table
    $query = $pdo->query("SELECT * FROM STUDENT");

    // Start HTML output
    echo "<!DOCTYPE html>";
    echo "<html lang='en'>";
    echo "<head>";
    echo "<meta charset='UTF-8'>";
    echo "<meta name='viewport' content='width=device-width, initial-scale=1.0'>";
    echo "<title>Student Data</title>";
    echo "<style>table { border-collapse: collapse; width: 100%; } th, td { border: 1px solid black; padding: 8px; text-align: left; } th { background-color: #f2f2f2; } form { margin-top: 20px; }</style>";
    echo "</head>";
    echo "<body>";

    echo "<h1>Student Data</h1>";

    // Start table
    echo "<table>";
    echo "<tr>";

    // Fetch the column names for the table header
    for ($i = 0; $i < $query->columnCount(); $i++) {
        $col = $query->getColumnMeta($i);
        echo "<th>" . htmlspecialchars($col['name']) . "</th>";
    }
    echo "</tr>";

    // Fetch and display each row of data
    while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr>";
        foreach ($row as $value) {
            echo "<td>" . htmlspecialchars($value) . "</td>";
        }
        echo "</tr>";
    }

    // End table
    echo "</table>";

    // Update form
    echo "<h2>Update Student Record</h2>";
    echo "<form method='POST'>";
    echo "<label for='student_id'>Student ID:</label><br>";
    echo "<input type='number' id='student_id' name='student_id' required><br>";
    echo "<label for='name'>Name:</label><br>";
    echo "<input type='text' id='name' name='name' required><br>";
    echo "<label for='email'>Email:</label><br>";
    echo "<input type='email' id='email' name='email' required><br>";
    echo "<button type='submit'>Update</button>";
    echo "</form>";

    echo "</body>";
    echo "</html>";
} catch (PDOException $e) {
    // Handle connection errors
    echo 'Connection failed: ' . $e->getMessage();
}*/

?>
