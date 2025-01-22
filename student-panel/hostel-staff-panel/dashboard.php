<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Check if user is logged in
if (!isset($_SESSION['Hostel_Staff'])) {
    header("Location: hostelStaffLogin.php");
    exit();
}

// Include your database configuration
include('paandbconfig.php');

// Fetch user data and counts
try {
    $stmt = $mysqli->prepare('SELECT * FROM Hostel_Staff WHERE Staff_No = ?');
    $stmt->bind_param('s', $_SESSION['Hostel_Staff']);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    // Counts for dashboard
    $totalComplaintStmt = $mysqli->query('SELECT COUNT(*) FROM Complaint');
    $totalComplaint = $totalComplaintStmt->fetch_row()[0];

    $totalStudentStmt = $mysqli->query('SELECT COUNT(*) FROM Student');
    $totalStudent = $totalStudentStmt->fetch_row()[0];

    $totalHostelStaffStmt = $mysqli->query('SELECT COUNT(*) FROM Hostel_Staff');
    $totalHostelStaff = $totalHostelStaffStmt->fetch_row()[0];

    $totalMaintenanceStaffStmt = $mysqli->query('SELECT COUNT(*) FROM Maintenance_Worker');
    $totalMaintenanceStaff = $totalMaintenanceStaffStmt->fetch_row()[0];
} catch (Exception $e) {
    echo 'Database query failed: ' . $e->getMessage();
    exit();
}

include('includes/header.php');
?>

<title>e-HRCS - Dashboard Overview</title>

<div class="main-content app-content">
    <div class="container">
        <div class="row">
            <h1>Welcome, <?php echo $user['Staff_No']; ?>!</h1>
            <p>Total Complaints: <?php echo $totalComplaint; ?></p>
            <p>Total Students: <?php echo $totalStudent; ?></p>
            <p>Total Hostel Staff: <?php echo $totalHostelStaff; ?></p>
            <p>Total Maintenance Staff: <?php echo $totalMaintenanceStaff; ?></p>
        </div>
    </div>
</div>

<?php include('includes/footer.php'); ?>
