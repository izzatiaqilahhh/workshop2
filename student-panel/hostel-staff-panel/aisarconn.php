<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'paandbconfig.php';

// Insert a new staff record into the STAFF table
$staff_query = "INSERT INTO STAFF (StaffID, Name, Email, Phone_Num, Position, Department_Name) 
                VALUES ('ABC123', 'Muhd Paan', 'muhd.paan@example.com', '012-3456789', 'User', 'FTMK')";
if (!$connAisar->query($staff_query)) {
    die("Error inserting data into the STAFF table: " . $connAisar->error);
}

// Query the STAFF table to display data
$staff_select_query = "SELECT StaffID, Name, Email, Phone_Num, Position, Department_Name FROM STAFF";
$staff_result = $connAisar->query($staff_select_query);

if (!$staff_result) {
    die("Error retrieving staff data from MySQL: " . $connAisar->error);
}

// Display the staff data
echo "<h2>STAFF Details:</h2>";

if ($staff_result->num_rows > 0) {
    echo "<table border='1' style='border-collapse: collapse; width: 80%; text-align: left;'>";
    echo "<tr style='background-color: #f2f2f2;'>
            <th>StaffID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>Position</th>
            <th>Department Name</th>
          </tr>";

    while ($row = $staff_result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($row['StaffID']) . "</td>";
        echo "<td>" . htmlspecialchars($row['Name']) . "</td>";
        echo "<td>" . htmlspecialchars($row['Email']) . "</td>";
        echo "<td>" . htmlspecialchars($row['Phone_Num']) . "</td>";
        echo "<td>" . htmlspecialchars($row['Position']) . "</td>";
        echo "<td>" . htmlspecialchars($row['Department_Name']) . "</td>";
        echo "</tr>";
    }

    echo "</table>";
} else {
    echo "<p>No staff records found.</p>";
}

// Close MySQL connection
//$connAisar->close();

?>
