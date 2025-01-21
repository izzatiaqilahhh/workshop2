<?php
// Include database configuration
include 'qiladbcon.php';
include 'includes/header-.php';

// Handle Assign Complaint form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['complaint_id'])) {
    $complaint_id = intval($_POST['complaint_id']);
    $worker_name = htmlspecialchars($_POST['assigned_to'] ?? '');
    $remarks = htmlspecialchars($_POST['remarks'] ?? '');

    if (!empty($complaint_id) && !empty($worker_name)) {
        // Get worker_id based on worker_name
        $worker_query = "SELECT worker_id FROM maintenance_worker WHERE name = :worker_name LIMIT 1";
        $worker_stmt = $pdo->prepare($worker_query);
        $worker_stmt->bindParam(':worker_name', $worker_name, PDO::PARAM_STR);
        $worker_stmt->execute();
        $worker = $worker_stmt->fetch(PDO::FETCH_ASSOC);

        if ($worker) {
            $worker_id = $worker['worker_id'];

            // Proceed with complaint assignment
            $assign_query = "INSERT INTO complaint_assignment (complaint_id, worker_id, remarks) 
                             VALUES (:complaint_id, :worker_id, :remarks)";
            $assign_stmt = $pdo->prepare($assign_query);
            $assign_stmt->bindParam(':complaint_id', $complaint_id, PDO::PARAM_INT);
            $assign_stmt->bindParam(':worker_id', $worker_id, PDO::PARAM_INT);
            $assign_stmt->bindParam(':remarks', $remarks, PDO::PARAM_STR);

            if ($assign_stmt->execute()) {
                // Insert into complaint_status table
                $status_query = "INSERT INTO complaint_status (complaint_status, description, date_update_status, complaint_id) 
                                 VALUES ('Assigned', 'Complaint has been assigned to a worker', NOW(), :complaint_id)";
                $status_stmt = $pdo->prepare($status_query);
                $status_stmt->bindParam(':complaint_id', $complaint_id, PDO::PARAM_INT);

                if ($status_stmt->execute()) {
                    echo "<script>alert('Complaint assigned successfully, and status updated!');</script>";
                } else {
                    echo "<script>alert('Complaint assigned, but failed to update status: " . $pdo->errorInfo()[2] . "');</script>";
                }
            } else {
                echo "<script>alert('Error assigning complaint: " . $pdo->errorInfo()[2] . "');</script>";
            }
        } else {
            echo "<script>alert('Selected worker not found. Please try again.');</script>";
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
            <h1 class="page-title fw-semibold fs-22 mb-0">Complaint Management</h1>
        </div>

        <!-- Complaints Table -->
        <div class="row mb-4">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Room Number</th> <!-- Changed from Complaint ID to Room No -->
                        <th>Complaint Type</th>
                        <th>Complaint Issue</th>
                        <th>Description</th>
                        <th>Complaint Image</th> <!-- New Column for Image -->
                        <th>Date Created</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = "
            SELECT c.complaint_id, c.complaint_type, c.complaint_issue, c.description, c.date_created, r.room_no, c.image 
            FROM complaint c 
            JOIN room r ON c.room_id = r.room_id
            WHERE NOT EXISTS (
                SELECT 1 FROM complaint_assignment ca 
                WHERE ca.complaint_id = c.complaint_id
            )";
                    $result = $pdo->query($query);
                    $counter = 1;
                    while ($complaint = $result->fetch(PDO::FETCH_ASSOC)) {
                    ?>
                        <tr>
                            <td><?= $counter++; ?></td>
                            <td><?= htmlspecialchars($complaint['room_no']); ?></td>
                            <td><?= htmlspecialchars($complaint['complaint_type']); ?></td>
                            <td><?= htmlspecialchars($complaint['complaint_issue']); ?></td>
                            <td><?= htmlspecialchars($complaint['description']); ?></td>
                            <td>
                                <!-- Display the Image if it exists -->
                                <?php if (!empty($complaint['image'])): ?>
                                    <img src="uploads/<?= htmlspecialchars($complaint['image']); ?>" alt="Complaint Image" width="100">
                                <?php else: ?>
                                    No Image
                                <?php endif; ?>
                            </td>
                            <td><?= htmlspecialchars($complaint['date_created']); ?></td>
                            <td>
                                <button class="btn btn-success assign-complaint-btn" data-bs-toggle="modal"
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
                            $worker_query = "SELECT worker_id, name, specialization FROM maintenance_worker";
                            $worker_stmt = $pdo->query($worker_query);
                            while ($worker = $worker_stmt->fetch(PDO::FETCH_ASSOC)) {
                                echo '<option value="' . htmlspecialchars($worker['name']) . '">' . htmlspecialchars($worker['name']) . ' (' . htmlspecialchars($worker['specialization']) . ')</option>';
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