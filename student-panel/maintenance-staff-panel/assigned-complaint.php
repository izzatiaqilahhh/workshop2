<?php include('includes/header-.php'); ?>
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
                    // Data dimasukkan secara manual
                    $complaints = [
                        [
                            "id" => "123456",
                            "student_id" => "S003",
                            "room_number" => "SL-L-1-1",
                            "description" => "My door locks was broken",
                            "status" => "Not done yet",
                            "update_status" => "None",
                            "action" => "Assign ASAP"
                        ]
                    ];

                    // Paparkan data
                    foreach ($complaints as $row) {
                        echo "<tr>
                                <td>{$row['id']}</td>
                                <td>{$row['student_id']}</td>
                                <td>{$row['room_number']}</td>
                                <td>{$row['description']}</td>
                                <td>{$row['status']}</td>
                                <td>
                                    <form method='POST' action='#'>
                                        <input type='hidden' name='complaint_id' value='{$row['id']}'>
                                        <select name='status' class='form-control mb-2'>
                                            <option value='Pending'>Pending</option>
                                            <option value='In Progress'>In Progress</option>
                                            <option value='Resolved'>Resolved</option>
                                        </select>
                                        <input type='text' name='progress' class='form-control mb-2' placeholder='Progress Update (optional)'>
                                        <button type='button' class='btn btn-success btn-sm'>Update</button>
                                    </form>
                                </td>
                                <td>{$row['action']}</td>
                            </tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>

        <a href="dashboard.php" class="btn btn-primary mt-4">Back to Dashboard</a>
    </div>
</div>

<?php include('includes/footer-.php'); ?>