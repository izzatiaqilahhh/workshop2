<?php 
// Start the session
session_start();

// Include the header
include('includes/header-.php'); 

// Include the database connection file
include 'ainaconnection.php'; 

// Ensure the worker's ID is stored in a session variable
if (!isset($_SESSION['worker_id'])) {
    die('Access denied. Please log in as a worker.');
}
$worker_id = $_SESSION['worker_id'];

// Fetch data from the database with join and filter by worker ID
$query = "
    SELECT 
        ca.Complaint_Id, 
        ca.Worker_Id, 
        ca.Date_Assigned, 
        ca.Remarks, 
        cs.Complaint_Status, 
        cs.Description, 
        cs.Date_Update_Status 
    FROM 
        Complaint_Assignment ca
    JOIN 
        Complaint_Status cs 
    ON 
        ca.Complaint_Id = cs.Complaint_ID
    WHERE 
        ca.Worker_Id = :worker_id
";
$stmt = $pdo->prepare($query);
$stmt->execute(['worker_id' => $worker_id]);
?>
<title>e-HRCS - Assigned Complaint Management</title>

<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Assigned Complaint Management</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="assigned-complaint.php">Assigned Complaint Management</a></li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Table -->
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Complaint ID</th>
                        <th>Worker ID</th>
                        <th>Date Assigned</th>
                        <th>Remarks</th>
                        <th>Status</th>
                        <th>Description</th>
                        <th>Date Updated</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Check if query returned results
                    if ($stmt->rowCount() > 0) {
                        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                            echo "<tr>
                                <td>" . htmlspecialchars($row['Complaint_Id']) . "</td>
                                <td>" . htmlspecialchars($row['Worker_Id']) . "</td>
                                <td>" . htmlspecialchars($row['Date_Assigned']) . "</td>
                                <td>" . htmlspecialchars($row['Remarks']) . "</td>
                                <td>" . htmlspecialchars($row['Complaint_Status']) . "</td>
                                <td>" . htmlspecialchars($row['Description']) . "</td>
                                <td>" . htmlspecialchars($row['Date_Update_Status']) . "</td>
                                <td>
                                    <form method='POST' action='update_assignment.php'>
                                        <input type='hidden' name='complaint_id' value='" . htmlspecialchars($row['Complaint_Id']) . "'>
                                        <input type='hidden' name='worker_id' value='" . htmlspecialchars($row['Worker_Id']) . "'>
                                        <input type='text' name='remarks' class='form-control mb-2' placeholder='Add remarks (optional)' value='" . htmlspecialchars($row['Remarks']) . "'>
                                        <button type='submit' class='btn btn-success btn-sm'>Update</button>
                                    </form>
                                </td>
                            </tr>";
                        }
                    } else {
                        echo "<tr><td colspan='8' class='text-center'>No assignments found.</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>

        <a href="dashboard.php" class="btn btn-primary mt-4">Back to Dashboard</a>
    </div>
</div>

<?php include('includes/footer-.php'); ?>
