<?php 
include('includes/header-.php'); 
include 'ainaconnection.php'; ?>

// Fetch data from the database
$query = "SELECT * FROM complaint_assignment";
$result = mysqli_query($conn, $query); 

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
                        <th>Assignment ID</th>
                        <th>Complaint ID</th>
                        <th>Worker ID</th>
                        <th>Date Assigned</th>
                        <th>Date Resolved</th>
                        <th>Status</th>
                        <th>Remarks</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($result && mysqli_num_rows($result) > 0) {
                        while ($row = mysqli_fetch_assoc($result)) {
                            echo "<tr>
                                <td>{$row['Assignment_Id']}</td>
                                <td>{$row['Complaint_Id']}</td>
                                <td>{$row['Worker_Id']}</td>
                                <td>{$row['Date_Assigned']}</td>
                                <td>" . ($row['Date_Resolved'] ? $row['Date_Resolved'] : 'N/A') . "</td>
                                <td>{$row['Status']}</td>
                                <td>{$row['Remarks']}</td>
                                <td>
                                    <form method='POST' action='update_assignment.php'>
                                        <input type='hidden' name='assignment_id' value='{$row['Assignment_Id']}'>
                                        <select name='status' class='form-control mb-2'>
                                            <option value='Pending'" . ($row['Status'] == 'Pending' ? ' selected' : '') . ">Pending</option>
                                            <option value='In Progress'" . ($row['Status'] == 'In Progress' ? ' selected' : '') . ">In Progress</option>
                                            <option value='Resolved'" . ($row['Status'] == 'Resolved' ? ' selected' : '') . ">Resolved</option>
                                        </select>
                                        <input type='text' name='remarks' class='form-control mb-2' placeholder='Add remarks (optional)' value='{$row['Remarks']}'>
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
