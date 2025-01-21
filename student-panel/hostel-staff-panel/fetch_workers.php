<?php
include 'paandbconfig.php';

<<<<<<< HEAD
try {
    // MySQLi query to fetch worker details
=======
try 
{
>>>>>>> 82499bd6 (update)
    $query = "SELECT name, specialization FROM maintenance_worker";
    $result = $mysqli->query($query);  // Using MySQLi query

<<<<<<< HEAD
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
=======
    while ($worker = $result->fetch(PDO::FETCH_ASSOC)) 
    {
        echo '<option value="' . htmlspecialchars($worker['name']) . '">'
            . htmlspecialchars($worker['name']) . ' (' . htmlspecialchars($worker['specialization']) . ')'
            . '</option>';
    }
} 
catch (PDOException $e) 
{
    echo "Error: " . $e->getMessage();
>>>>>>> 82499bd6 (update)
}
?>
