<?php
include 'paandbconfig.php';

if (isset($_POST['specialization'])) {
    $specialization = $_POST['specialization'];

    // Fetch companies based on specialization
    $query = "SELECT C.Company_Name FROM Maintenance_Company C
              JOIN Maintenance_Worker W ON C.Company_ID = W.Company_ID
              WHERE W.Specialization = '$specialization' GROUP BY C.Company_ID";

    $result = mysqli_query($conn, $query);

    echo '<option value="">Select Company</option>';
    while ($row = mysqli_fetch_assoc($result)) {
        echo '<option value="' . $row['Company_ID'] . '">' . $row['Company_Name'] . '</option>';
    }
}
