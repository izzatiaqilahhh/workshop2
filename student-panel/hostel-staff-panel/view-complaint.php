<?php
// Include database configuration
include 'paandbconfig.php';
include 'includes/header-.php'; 

// Handle Assign Complaint form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['complaint_id'])) {
    $complaint_id = intval($_POST['complaint_id']);
    $worker_id = mysqli_real_escape_string($conn, $_POST['assigned_to']);
    $remarks = mysqli_real_escape_string($conn, $_POST['remarks']);

    // Insert into Complaint_Assignment table
    $assign_query = "INSERT INTO Complaint_Assignment (Complaint_Id, Worker_Id, Remarks) 
                     VALUES ('$complaint_id', '$worker_id', '$remarks')";
    if (mysqli_query($conn, $assign_query)) {
        echo "<script>alert('Complaint assigned successfully!');</script>";
    } else {
        echo "<script>alert('Error assigning complaint: " . mysqli_error($conn) . "');</script>";
    }
}
?>

<title>e-HRCS - Complaint Management</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.bootstrap5.min.css">

<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Complaint Management</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="view-complaint.php">Complaint Management</a></li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Complaints Table -->
        <div class="row mb-4">
            <table class="table table-bordered display">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Complaint ID</th>
                        <th>Complaint Type</th>
                        <th>Complaint Issue</th>
                        <th>Description</th>
                        <th>Date Created</th>
                        <th>Room No</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = "SELECT C.Complaint_ID, C.Complaint_Type, C.Complaint_Issue, C.Description,C.Date_Created, R.Room_No 
                              FROM Complaint C JOIN Room R ON C.Room_ID = R.Room_ID";
                    $result = mysqli_query($conn, $query);
                    $counter = 1;

                    while ($complaint = mysqli_fetch_assoc($result)) {
                        // Check if the complaint has already been assigned
                        $check_assigned_query = "SELECT 1 FROM Complaint_Assignment WHERE Complaint_Id = " . $complaint['Complaint_ID'];
                        $assigned_result = mysqli_query($conn, $check_assigned_query);
                        $is_assigned = mysqli_num_rows($assigned_result) > 0;
                        ?>
                        <tr>
                            <td><?= $counter++; ?></td>
                            <td><?= htmlspecialchars($complaint['Complaint_ID']); ?></td>
                            <td><?= htmlspecialchars($complaint['Complaint_Type']); ?></td>
                            <td><?= htmlspecialchars($complaint['Complaint_Issue']); ?></td>
                            <td><?= htmlspecialchars($complaint['Description']); ?></td>
                            <td><?= htmlspecialchars($complaint['Date_Created']); ?></td>
                            <td><?= htmlspecialchars($complaint['Room_No']); ?></td>
                            <td>
                                <button class="btn btn-success assign-complaint-btn" 
                                        data-bs-toggle="modal" 
                                        data-bs-target="#assigncomplaintmodal" 
                                        data-id="<?= htmlspecialchars($complaint['Complaint_ID']); ?>"
                                        <?php if ($is_assigned) echo 'disabled'; ?>>
                                    <?= $is_assigned ? 'Assigned' : 'Assign'; ?>
                                </button>
                            </td>
                        </tr>
                        <?php
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Assign Complaint Modal -->
<div class="modal fade" id="assigncomplaintmodal" tabindex="-1" aria-labelledby="assignComplaintLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="assignComplaintLabel">Assign Complaint</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                    <div class="col-md-6 mb-3">
                            <label>Student Name</label>
                            <input type="text" class="form-control" id="Name" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Matric Number</label>
                            <input type="text" class="form-control" id="Matric_No" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Room Number</label>
                            <input type="text" class="form-control" id="Room_No" readonly>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label>Complaint Image</label>
                            <img src="" id="complaint-image" alt="Complaint Image" class="img-fluid" style="max-width: 100%; height: auto; border: 1px solid #ddd;">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Complaint Type</label>
                            <input type="text" class="form-control" id="complaint-type" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Issue Type</label>
                            <input type="text" class="form-control" id="complaint-issue" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Complaint Description</label>
                            <input type="text" class="form-control" id="complaint-description" readonly>
                        </div>
                <form method="POST" action="">
                    <input type="hidden" id="assignComplaintId" name="complaint_id">
                    
                    <!-- Dropdown for Workers -->
                    <div class="mb-3">
                        <label for="assignedTo" class="form-label">Assign To</label>
                        <select class="form-control" id="assignedTo" name="assigned_to" required>
                            <option value="">Select Maintenance Worker</option>
                            <?php
                            $worker_query = "SELECT Worker_Id, Name, Specialization FROM Maintenance_Worker";
                            $worker_result = mysqli_query($conn, $worker_query);
                            while ($worker = mysqli_fetch_assoc($worker_result)) {
                                echo "<option value='" . htmlspecialchars($worker['Worker_Id']) . "'>" . htmlspecialchars($worker['Name']) . " - " . htmlspecialchars($worker['Specialization']) . "</option>";
                            }
                            ?>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="remarks" class="form-label">Remarks</label>
                        <textarea class="form-control" id="remarks" name="remarks" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Assign</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap and jQuery Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).on('click', '.assign-complaint-btn', function() {
        const complaintId = $(this).data('id');
        $('#assignComplaintId').val(complaintId);
    });
</script>

<?php include('includes/footer-.php'); ?>
