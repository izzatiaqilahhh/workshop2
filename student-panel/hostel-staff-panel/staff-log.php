<?php
session_start();
// Include your database connection
include('qiladbcon.php');

// Check if staff_ID is provided in the URL after login
if (isset($_GET['staff_id'])) {
    $staffID = $_GET['staff_id'];
    $staffName = $_GET['name']; // Optional: staff name if needed for display or logging

    // Set the time zone to your local time zone (for example, Malaysia)
    date_default_timezone_set('Asia/Kuala_Lumpur');

    // Capture the current login time
    $loginTime = date('Y-m-d H:i:s'); // Current timestamp

    try {
        // Prepare the SQL query to insert the login time into staff_log
        $sql = "INSERT INTO staff_log (staff_id, login_time) VALUES (:staff_id, :login_time)";

        // Prepare statement
        $stmt = $pdo->prepare($sql);

        // Bind parameters
        $stmt->bindParam(':staff_id', $staffID, PDO::PARAM_INT);
        $stmt->bindParam(':login_time', $loginTime, PDO::PARAM_STR);

        // Execute the query
        $stmt->execute();

        // Check if the row is inserted successfully
        echo "Login time recorded successfully for staff ID: $staffID";
    } catch (PDOException $e) {
        // If an error occurs
        echo "Error recording login: " . $e->getMessage();
    }
} else {
    echo "Staff ID not found.";
}
?>
