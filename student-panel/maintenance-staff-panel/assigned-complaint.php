<?php
// Start the session
session_start();

// Ensure the worker's ID is stored in a session variable
if (!isset($_SESSION['maintenance_staff'])) {
    header('Location: maintenanceStaffLogin.php');
    exit('Access denied. Please log in as a worker.');
}

// Include the header
include('includes/header-.php');

// Include the database connection file
include 'ainaconnection.php';

// Fetch user-specific data
try {
    // Fetch user profile information
    $stmt = $pdo->prepare('SELECT * FROM maintenance_worker WHERE Worker_No = :Worker_No');
    $stmt->bindParam(':Worker_No', $_SESSION['maintenance_staff'], PDO::PARAM_STR);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Check if user exists
    if (!$user) {
        throw new Exception('User not found.');
    }
} catch (Exception $e) {
    error_log($e->getMessage());
    echo 'Error: Unable to fetch user data.';
    exit();
}

$worker_id = $_SESSION['maintenance_staff'];

// Fetch complaints assigned to the current user
try {
    $query = "
        SELECT 
            c.Complaint_ID, 
            c.Complaint_Type, 
            c.Complaint_Issue, 
            c.Description AS Complaint_Description, 
            ca.Worker_No, 
            ca.Date_Assigned, 
            ca.Remarks AS Assignment_Remarks, 
            cs.Complaint_Status, 
            cs.Description AS Status_Description, 
            cs.Date_Update_Status 
        FROM 
            complaint c
        LEFT JOIN 
            complaint_assignment ca ON c.Complaint_ID = ca.Complaint_Id
        LEFT JOIN 
            complaint_status cs ON c.Complaint_ID = cs.Complaint_ID
        WHERE 
            ca.Worker_No = :worker_id
    ";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':worker_id', $worker_id, PDO::PARAM_STR);
    $stmt->execute();
    $complaints = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    error_log($e->getMessage());
    echo 'Database query failed. Please try again later.';
    exit();
}
?>

<title>e-HRCS - Assigned Complaint Management</title>

<div class="main-content app-content">
    <div class="container">
        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Assigned Complaint Management</h1>
            <div>
                <select id="complaintFilter" class="form-select" onchange="toggleComplaints()">
                    <option value="active">Active Complaints</option>
                    <option value="resolved">Resolved Complaints</option>
                </select>
            </div>
        </div>

        <!-- Active Complaints Table -->
        <div id="activeComplaints" class="complaint-section">
            <h2 class="mb-3">Active Complaints</h2>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Complaint ID</th>
                        <th>Complaint Type</th>
                        <th>Complaint Issue</th>
                        <th>Description</th>
                        <th>Worker No</th>
                        <th>Date Assigned</th>
                        <th>Assignment Remarks</th>
                        <th>Status</th>
                        <th>Status Description</th>
                        <th>Date Updated</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $hasActive = false;
                    foreach ($complaints as $row) {
                        if ($row['Complaint_Status'] !== 'Resolved') {
                            $hasActive = true;
                            echo "<tr>
                                <td>" . htmlspecialchars($row['Complaint_ID']) . "</td>
                                <td>" . htmlspecialchars($row['Complaint_Type']) . "</td>
                                <td>" . htmlspecialchars($row['Complaint_Issue']) . "</td>
                                <td>" . htmlspecialchars($row['Complaint_Description']) . "</td>
                                <td>" . htmlspecialchars($row['Worker_No']) . "</td>
                                <td>" . htmlspecialchars($row['Date_Assigned']) . "</td>
                                <td>" . htmlspecialchars($row['Assignment_Remarks']) . "</td>
                                <td>" . htmlspecialchars($row['Complaint_Status']) . "</td>
                                <td>" . htmlspecialchars($row['Status_Description']) . "</td>
                                <td>" . htmlspecialchars($row['Date_Update_Status']) . "</td>
                                <td>
                                    <form action='update_complaint.php' method='POST'>
                                        <input type='hidden' name='Complaint_ID' value='" . htmlspecialchars($row['Complaint_ID']) . "'>
                                        <select name='Complaint_Status' class='form-select mb-1' required>
                                            <option value='Assigned' " . ($row['Complaint_Status'] === 'Assigned' ? 'selected' : '') . ">Assigned</option>
                                            <option value='In Progress' " . ($row['Complaint_Status'] === 'In Progress' ? 'selected' : '') . ">In Progress</option>
                                            <option value='Resolved'>Resolved</option>
                                        </select>
                                        <textarea name='Status_Description' placeholder='Status Description' required class='form-control mb-1'></textarea>
                                        <button type='submit' class='btn btn-primary btn-sm'>Update</button>
                                    </form>
                                </td>
                            </tr>";
                        }
                    }

                    if (!$hasActive) {
                        echo "<tr><td colspan='11' class='text-center'>No active complaints assigned to you.</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>

        <!-- Resolved Complaints Table -->
        <div id="resolvedComplaints" class="complaint-section" style="display: none;">
            <h2 class="mb-3">Resolved Complaints</h2>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Complaint ID</th>
                        <th>Complaint Type</th>
                        <th>Complaint Issue</th>
                        <th>Description</th>
                        <th>Worker No</th>
                        <th>Date Assigned</th>
                        <th>Assignment Remarks</th>
                        <th>Status</th>
                        <th>Status Description</th>
                        <th>Date Updated</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $hasResolved = false;
                    foreach ($complaints as $row) {
                        if ($row['Complaint_Status'] === 'Resolved') {
                            $hasResolved = true;
                            echo "<tr>
                                <td>" . htmlspecialchars($row['Complaint_ID']) . "</td>
                                <td>" . htmlspecialchars($row['Complaint_Type']) . "</td>
                                <td>" . htmlspecialchars($row['Complaint_Issue']) . "</td>
                                <td>" . htmlspecialchars($row['Complaint_Description']) . "</td>
                                <td>" . htmlspecialchars($row['Worker_No']) . "</td>
                                <td>" . htmlspecialchars($row['Date_Assigned']) . "</td>
                                <td>" . htmlspecialchars($row['Assignment_Remarks']) . "</td>
                                <td>" . htmlspecialchars($row['Complaint_Status']) . "</td>
                                <td>" . htmlspecialchars($row['Status_Description']) . "</td>
                                <td>" . htmlspecialchars($row['Date_Update_Status']) . "</td>
                            </tr>";
                        }
                    }

                    if (!$hasResolved) {
                        echo "<tr><td colspan='10' class='text-center'>No resolved complaints assigned to you.</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function toggleComplaints() {
        const filter = document.getElementById('complaintFilter').value;
        const activeSection = document.getElementById('activeComplaints');
        const resolvedSection = document.getElementById('resolvedComplaints');

        if (filter === 'active') {
            activeSection.style.display = 'block';
            resolvedSection.style.display = 'none';
        } else {
            activeSection.style.display = 'none';
            resolvedSection.style.display = 'block';
        }
    }
</script>

<script>
    $(document).ready(function() {
        let table = new DataTable('.table', {
            dom: 'Bfrtip', // To specify where the buttons should be placed
            buttons: [{
                    extend: 'excelHtml5', // Export to Excel
                    title: 'Data Export'
                },
                {
                    extend: 'pdfHtml5', // Export to PDF
                    title: 'Data Export'
                },
                {
                    extend: 'print', // Export to PDF
                    title: 'Data Export'
                }
            ]
        });
    });
</script>

<?php include('includes/footer-.php'); ?>