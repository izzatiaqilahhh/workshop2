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
            $assign_query = $pdo->prepare("INSERT INTO \"complaint_assignment\" (\"complaint_id\", \"worker_id\", \"remarks\") 
                                           VALUES (:complaint_id, :worker_id, :remarks)");
            $assign_query->execute([
                ':complaint_id' => $complaint_id,
                ':worker_id' => $worker_id,
                ':remarks' => $remarks
            ]);

            // Insert into Complaint_Status table
            $status_query = $pdo->prepare("INSERT INTO \"complaint_status\" (\"complaint_status\", \"Description\", \"date_update_status\", \"complaint_id\") 
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

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>e-HRCS - Complaint Management</title>

    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <div class="main-content app-content">
        <div class="container">
            <!-- Page Header -->
            <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
                <h1 class="page-title fw-semibold fs-22 mb-0">Pending Complaint Management</h1>
                <div class="ms-md-1 ms-0">
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="view-complaint.php">Pending Complaint Management</a></li>
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
                            <th>Room Number</th>
                            <th>Complaint Type</th>
                            <th>Complaint Issue</th>
                            <th>Description</th>
                            <th>Date Created</th>
                            <th>Image</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // PostgreSQL query to fetch complaints not assigned yet
                        $query = "
                        SELECT c.\"complaint_id\", c.\"complaint_type\", c.\"complaint_issue\", c.\"description\", c.\"date_created\", r.\"room_no\", c.\"image\" 
                        FROM \"complaint\" c 
                        JOIN \"room\" r ON c.\"room_id\" = r.\"room_id\"
                        WHERE NOT EXISTS (
                            SELECT 1 FROM \"complaint_assignment\" ca
                            WHERE ca.\"complaint_id\" = c.\"complaint_id\"
                        )";

                        // Execute query and check if successful
                        $result = $pdo->query($query);
                        if ($result === false) {
                            echo "<script>alert('Error fetching complaints.');</script>";
                        } else {
                            $counter = 1;
                            while ($complaint = $result->fetch(PDO::FETCH_ASSOC)) {
                                $image_url = !empty($complaint['image']) ? 'uploads/' . htmlspecialchars($complaint['image']) : 'path/to/default-image.jpg';
                        ?>
                                <tr>
                                    <td><?= $counter++; ?></td>
                                    <td><?= htmlspecialchars($complaint['room_no']); ?></td>
                                    <td><?= htmlspecialchars($complaint['complaint_type']); ?></td>
                                    <td><?= htmlspecialchars($complaint['complaint_issue']); ?></td>
                                    <td><?= htmlspecialchars($complaint['description']); ?></td>
                                    <td><?= htmlspecialchars($complaint['date_created']); ?></td>
                                    <td>
                                        <img src="<?= $image_url; ?>" alt="Complaint Image" width="100" height="100" />
                                    </td>
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
                        }
                        ?>
                    </tbody>
                </table>
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
                                        $worker_query = "SELECT \"worker_id\", \"Name\", \"specialization\" FROM \"maintenance_worker\"";
                                        $worker_result = $pdo->query($worker_query);
                                        while ($worker = $worker_result->fetch(PDO::FETCH_ASSOC)) {
                                            echo "<option value='" . htmlspecialchars($worker['worker_id']) . "'>" . htmlspecialchars($worker['name']) . " - " . htmlspecialchars($worker['specialization']) . "</option>";
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
                // Capture the complaint_id and set it in the hidden input field when the assign button is clicked
                $(document).on('click', '.assign-complaint-btn', function() {
                    const complaintId = $(this).data('id');
                    $('#assignComplaintId').val(complaintId);
                });

                // Ensure the worker dropdown is populated before the modal is shown
                $(document).on('show.bs.modal', '#assigncomplaintmodal', function (e) {
                    // Fetch workers dynamically, if needed
                    $.ajax({
                        url: 'fetch_workers.php', // Fetch worker options from a separate PHP script
                        type: 'GET',
                        success: function(data) {
                            $('#assignedTo').html(data); // Populate the dropdown with worker options
                        }
                    });
                });
            </script>

        </div>
    </div>

    <?php include('includes/footer-.php'); ?>
</body>

</html>
