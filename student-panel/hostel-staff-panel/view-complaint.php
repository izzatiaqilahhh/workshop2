<?php
// include database configuration
include 'paandbconfig.php';
include 'includes/header-.php';

// handle assign complaint form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['complaint_id'])) {
    $complaint_id = intval($_POST['complaint_id']);
<<<<<<< HEAD
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
=======
    $worker_id = mysqli_real_escape_string($conn, $_POST['assigned_to'] ?? '');
    $remarks = mysqli_real_escape_string($conn, $_POST['remarks'] ?? '');

    if (!empty($complaint_id) && !empty($worker_id)) {
        // insert into complaint_assignment table
        $assign_query = "INSERT INTO complaint_assignment (complaint_id, worker_id, remarks) 
                         VALUES ('$complaint_id', '$worker_id', '$remarks')";
        if (mysqli_query($conn, $assign_query)) {
            // insert into complaint_status table
            $status_query = "INSERT INTO complaint_status (complaint_status, description, date_update_status, complaint_id) 
                             VALUES ('Assigned', 'Complaint has been assigned to a worker', NOW(), '$complaint_id')";
            if (mysqli_query($conn, $status_query)) {
                echo "<script>alert('Complaint assigned successfully, and status updated!');</script>";
            } else {
                echo "<script>alert('Complaint assigned, but failed to update status: " . mysqli_error($conn) . "');</script>";
            }
        } else {
            echo "<script>alert('Error assigning complaint: " . mysqli_error($conn) . "');</script>";
>>>>>>> 9393cbee (update code)
        }
    } else {
        echo "<script>alert('Please fill in all required fields.');</script>";
    }
}
?>

<title>e-hrcs - complaint management</title>

<div class="main-content app-content">
    <div class="container">
<<<<<<< HEAD
        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Complaint Management</h1>
=======

        <!-- page header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">complaint management</h1>
>>>>>>> 9393cbee (update code)
        </div>

        <!-- complaints table -->
        <div class="row mb-4">
            <table class="table table-bordered">
                <thead>
                    <tr>
<<<<<<< HEAD
                        <th>No</th>
                        <th>Room Number</th> <!-- Changed from Complaint ID to Room No -->
                        <th>Complaint Type</th>
                        <th>Complaint Issue</th>
                        <th>Description</th>
                        <th>Complaint Image</th> <!-- New Column for Image -->
                        <th>Date Created</th>
                        <th>Action</th>
=======
                        <th>no</th>
                        <th>complaint id</th>
                        <th>complaint type</th>
                        <th>complaint issue</th>
                        <th>description</th>
                        <th>date created</th>
                        <th>room no</th>
                        <th>action</th>
>>>>>>> 9393cbee (update code)
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = "
<<<<<<< HEAD
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
=======
                    SELECT c.complaint_id, c.complaint_type, c.complaint_issue, c.description, c.date_created, r.room_no 
                    FROM complaint c 
                    JOIN room r ON c.room_id = r.room_id
                    WHERE NOT EXISTS (
                        SELECT 1 FROM complaint_assignment ca 
                        WHERE ca.complaint_id = c.complaint_id
                    )";
                    $result = mysqli_query($conn, $query);
                    $counter = 1;
                    while ($complaint = mysqli_fetch_assoc($result)) {
                        ?>
                        <tr>
                            <td><?= $counter++; ?></td>
                            <td><?= htmlspecialchars($complaint['complaint_id']); ?></td>
>>>>>>> 9393cbee (update code)
                            <td><?= htmlspecialchars($complaint['complaint_type']); ?></td>
                            <td><?= htmlspecialchars($complaint['complaint_issue']); ?></td>
                            <td><?= htmlspecialchars($complaint['description']); ?></td>
                            <td>
<<<<<<< HEAD
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
=======
                                <button class="btn btn-success assign-complaint-btn" data-bs-toggle="modal" 
                                        data-bs-target="#assigncomplaintmodal" 
                                        data-id="<?= htmlspecialchars($complaint['complaint_id']); ?>">
                                    assign
>>>>>>> 9393cbee (update code)
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

<!-- assign complaint modal -->
<div class="modal fade" id="assigncomplaintmodal" tabindex="-1" aria-labelledby="assigncomplaintlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="assigncomplaintlabel">assign complaint</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
            </div>
            <div class="modal-body">
                <form method="POST" action="">
                    <input type="hidden" id="assigncomplaintid" name="complaint_id">
                    <div class="mb-3">
                        <label for="assignedto" class="form-label">assign to</label>
                        <select class="form-control" id="assignedto" name="assigned_to" required>
                            <option value="">select maintenance worker</option>
                            <?php
                            $worker_query = "SELECT worker_id, name, specialization FROM maintenance_worker";
<<<<<<< HEAD
                            $worker_stmt = $pdo->query($worker_query);
                            while ($worker = $worker_stmt->fetch(PDO::FETCH_ASSOC)) {
                                echo '<option value="' . htmlspecialchars($worker['name']) . '">' . htmlspecialchars($worker['name']) . ' (' . htmlspecialchars($worker['specialization']) . ')</option>';
=======
                            $worker_result = mysqli_query($conn, $worker_query);
                            while ($worker = mysqli_fetch_assoc($worker_result)) {
                                echo "<option value='" . htmlspecialchars($worker['worker_id']) . "'>" . htmlspecialchars($worker['name']) . " - " . htmlspecialchars($worker['specialization']) . "</option>";
>>>>>>> 9393cbee (update code)
                            }
                            ?>
                        </select>

                    </div>
                    <div class="mb-3">
                        <label for="remarks" class="form-label">remarks</label>
                        <textarea class="form-control" id="remarks" name="remarks" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">assign</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- bootstrap and jquery scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).on('click', '.assign-complaint-btn', function() {
        const complaint_id = $(this).data('id');
        $('#assigncomplaintid').val(complaint_id);
    });
</script>

<<<<<<< HEAD
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
=======
<?php include('includes/footer-.php'); ?>
>>>>>>> 9393cbee (update code)
