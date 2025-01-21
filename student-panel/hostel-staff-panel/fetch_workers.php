<?php
include 'paandbconfig.php';

try {
    // MySQLi query to fetch worker details
    $query = "SELECT name, specialization FROM maintenance_worker";
    $result = $mysqli->query($query);  // Using MySQLi query

    // Check if there are results
    if ($result->num_rows > 0) {
        while ($worker = $result->fetch_assoc()) {
            echo '<option value="' . htmlspecialchars($worker['name']) . '">'
                . htmlspecialchars($worker['name']) . ' (' . htmlspecialchars($worker['specialization']) . ')'
                . '</option>';
        }
    } else {
        echo '<option value="">No workers found</option>';
    }
} catch (mysqli_sql_exception $e) {
    echo '<option value="">Error loading workers</option>';
}
?>
