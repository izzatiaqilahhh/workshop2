<?php
// Include database configuration
include 'qiladbcon.php';
include 'includes/header-.php';

// Handle Assign Complaint form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['complaint_id'])) {
    $complaint_id = intval($_POST['complaint_id']);
    $worker_id = $_POST['assigned_to'] ?? '';
    $remarks = $_POST['remarks'] ?? '';

    if (!empty($complaint_id) && !empty($worker_id)) {
        try {
            // Insert into Complaint_Assignment table
            $assign_query = $pdo->prepare("INSERT INTO \"Complaint_Assignment\" (\"Complaint_Id\", \"Worker_Id\", \"Remarks\") 
                                           VALUES (:complaint_id, :worker_id, :remarks)");
            $assign_query->execute([
                ':complaint_id' => $complaint_id,
                ':worker_id' => $worker_id,
                ':remarks' => $remarks
            ]);

            // Insert into Complaint_Status table
            $status_query = $pdo->prepare("INSERT INTO \"Complaint_Status\" (\"Complaint_Status\", \"Description\", \"Date_Update_Status\", \"Complaint_ID\") 
                                           VALUES ('Assigned', 'Complaint has been assigned to a worker', NOW(), :complaint_id)");
            $status_query->execute([':complaint_id' => $complaint_id]);

            echo "<script>alert('Complaint assigned successfully, and status updated!');</script>";
        } catch (PDOException $e) {
            echo "<script>alert('Error: " . $e->getMessage() . "');</script>";
        }
    } else {
        echo "<script>alert('Please fill in all required fields.');</script>";
    }
}
?>

<title>e-HRCS - Complaint Management</title>

<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Pending Complaint Management</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="view-complaint.php"> Pending Complaint Management</a></li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Complaints Table -->
        <div class="row mb-4">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
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
                    // PostgreSQL query to fetch complaints not assigned yet
                    $query = "
                    SELECT c.\"complaint_id\", c.\"complaint_type\", c.\"complaint_issue\", c.\"description\", c.\"date_created\", r.\"room_no\" 
                    FROM \"complaint\" c 
                    JOIN \"room\" r ON c.\"room_id\" = r.\"room_id\"
                    WHERE NOT EXISTS (
                        SELECT 1 FROM \"complaint_assignment\" ca
                        WHERE ca.\"complaint_id\" = c.\"complaint_id\"
                    )";

                    $result = $pdo->query($query);
                    $counter = 1;

                    while ($complaint = $result->fetch(PDO::FETCH_ASSOC)) {
                    ?>
                        <tr>
                            <td><?= $counter++; ?></td>
                            <td><?= htmlspecialchars($complaint['complaint_type']); ?></td>
                            <td><?= htmlspecialchars($complaint['complaint_issue']); ?></td>
                            <td><?= htmlspecialchars($complaint['description']); ?></td>
                            <td><?= htmlspecialchars($complaint['date_created']); ?></td>
                            <td><?= htmlspecialchars($complaint['room_no']); ?></td>
                            <td>
                                <button class="btn btn-success assign-complaint-btn"
                                    data-bs-toggle="modal"
                                    data-bs-target="#assigncomplaintmodal"
                                    data-id="<?= htmlspecialchars($complaint['complaint_id']); ?>">
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
                            // Fetching maintenance workers for assignment
                            $worker_query = "SELECT \"Worker_Id\", \"Name\", \"Specialization\" FROM \"Maintenance_Worker\"";
                            $worker_result = $pdo->query($worker_query);
                            while ($worker = $worker_result->fetch(PDO::FETCH_ASSOC)) {
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

<script>
    $(document).on('click', '.assign-complaint-btn', function() {
        const complaintId = $(this).data('id');
        $('#assignComplaintId').val(complaintId);
    });
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