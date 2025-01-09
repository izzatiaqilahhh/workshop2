<?php include('includes/header-.php'); ?>
<title>e-HRCS - Assigned Complaints</title>

<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Assigned Complaints</h1>
        </div>

        <!-- Table -->
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Complaint ID</th>
                        <th>Student ID</th>
                        <th>Room Number</th>
                        <th>Complaint</th>
                        <th>Current Status</th>
                        <th>Update Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    include('db_connection.php'); // Include database connection

                    // Fetch assigned complaints
                    $sql = "SELECT * FROM complaints WHERE assigned_staff = 'Staff001'"; // Replace 'Staff001' with the logged-in staff ID
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<tr>
                                <td>{$row['id']}</td>
                                <td>{$row['student_id']}</td>
                                <td>{$row['room_number']}</td>
                                <td>{$row['description']}</td>
                                <td>{$row['status']}</td>
                                <td>
                                    <form method='POST' action='update_complaint.php'>
                                        <input type='hidden' name='complaint_id' value='{$row['id']}'>
                                        <select name='status' class='form-control mb-2'>
                                            <option value='Pending'>Pending</option>
                                            <option value='In Progress'>In Progress</option>
                                            <option value='Resolved'>Resolved</option>
                                        </select>
                                        <input type='text' name='progress' class='form-control mb-2' placeholder='Progress Update (optional)'>
                                        <button type='submit' class='btn btn-success btn-sm'>Update</button>
                                    </form>
                                </td>
                            </tr>";
                        }
                    } else {
                        echo "<tr><td colspan='7' class='text-center'>No assigned complaints</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>

        <a href="dashboard.php" class="btn btn-primary mt-4">Back to Dashboard</a>
    </div>
</div>

<?php include('includes/footer-.php'); ?>