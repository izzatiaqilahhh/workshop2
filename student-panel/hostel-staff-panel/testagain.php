<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);


// Include the database connection file
include 'paandbconfig.php'; // Replace with your actual database connection file name

// SQL query to fetch data from Block table
$sql = "SELECT B.Block_ID, B.Block_Name, B.Block_Gender, B.Number_Of_Floors, S.Name FROM Block B JOIN Hostel_Staff S ON B.Staff_ID = S.Staff_ID";
$result = $conn->query($sql);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Block Table Data</title>
    <style>
        table {
            width: 50%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 1px solid black;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>

<body>
    <h1 style="text-align: center;">Block Table Data</h1>
    <table>
        <thead>
            <tr>
                <th>Block ID</th>
                <th>Block Name</th>
                <th>Block Gender</th>
                <th>Number of Floors</th>
                <th>Staff In Charge</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if ($result->num_rows > 0) {
                // Output data of each row
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["Block_ID"] . "</td>";
                    echo "<td>" . $row["Block_Name"] . "</td>";
                    echo "<td>" . $row["Block_Gender"] . "</td>";
                    echo "<td>" . $row["Number_Of_Floors"] . "</td>";
                    echo "<td>" . $row["Name"] . "</td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='4' style='text-align: center;'>No data found</td></tr>";
            }
            ?>
        </tbody>
    </table>
</body>

</html>

<?php
// Close connection
//$conn->close();
?>