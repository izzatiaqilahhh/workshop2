<?php
include 'paandbconfig.php';

if (isset($_POST['company_id'])) {
    $company_id = $_POST['company_id'];
    
    // Fetch workers based on company
    $query = "SELECT Worker_ID, Name FROM Maintenance_Worker WHERE Company_ID = '$company_id'";
    
    $result = mysqli_query($conn, $query);
    
    echo '<option value="">Select Worker</option>';
    while ($row = mysqli_fetch_assoc($result)) {
        echo '<option value="' . $row['Worker_ID'] . '">' . $row['Name'] . '</option>';
    }
}
?>
