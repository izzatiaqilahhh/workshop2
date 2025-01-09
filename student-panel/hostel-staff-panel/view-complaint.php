<?php
// Include database configuration
include 'paandbconfig.php';
include 'includes/header-.php';

// Handle Assign Complaint form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['complaint_id'])) {
    $complaint_id = intval($_POST['complaint_id']);
    $worker_id = mysqli_real_escape_string($conn, $_POST['assigned_to'] ?? '');
    $remarks = mysqli_real_escape_string($conn, $_POST['remarks'] ?? '');

    if (!empty($complaint_id) && !empty($worker_id)) {
        // Insert into Complaint_Assignment table
        $assign_query = "INSERT INTO Complaint_Assignment (Complaint_Id, Worker_Id, Remarks) 
                         VALUES ('$complaint_id', '$worker_id', '$remarks')";
        if (mysqli_query($conn, $assign_query)) {
            // Insert into Complaint_Status table
            $status_query = "INSERT INTO Complaint_Status (Complaint_Status, Description, Date_Update_Status, Complaint_ID) 
                             VALUES ('Assigned', 'Complaint has been assigned to a worker', NOW(), '$complaint_id')";
            if (mysqli_query($conn, $status_query)) {
                echo "<script>alert('Complaint assigned successfully, and status updated!');</script>";
            } else {
                echo "<script>alert('Complaint assigned, but failed to update status: " . mysqli_error($conn) . "');</script>";
            }
        } else {
            echo "<script>alert('Error assigning complaint: " . mysqli_error($conn) . "');</script>";
        }
    } else {
        echo "<script>alert('Please fill in all required fields.');</script>";
    }
}
?>

<title>e-HRCS - Complaint Management</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Complaint Management</h1>
        </div>

        <!-- Complaints Table -->
        <div class="row mb-4">
            <table class="table table-bordered">
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
                    $query = "
                    SELECT C.Complaint_ID, C.Complaint_Type, C.Complaint_Issue, C.Description, C.Date_Created, R.Room_No 
                    FROM Complaint C 
                    JOIN Room R ON C.Room_ID = R.Room_ID
                    WHERE NOT EXISTS (
                        SELECT 1 FROM Complaint_Assignment CA 
                        WHERE CA.Complaint_Id = C.Complaint_ID
                    )";
                    $result = mysqli_query($conn, $query);
                    $counter = 1;

                    while ($complaint = mysqli_fetch_assoc($result)) {
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
                                        data-id="<?= htmlspecialchars($complaint['Complaint_ID']); ?>">
                                    Assign
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
                <form method="POST" action="">
                    <input type="hidden" id="assignComplaintId" name="complaint_id">
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
