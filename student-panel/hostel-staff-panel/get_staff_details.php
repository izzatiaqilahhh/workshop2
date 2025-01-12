<?php
include 'paandbconfig.php'; // MySQL connection setup
include 'includes/header-.php';

// Initialize variables
$staff = null;
$error_message = "";

// Check if staff_id is passed via URL
if (isset($_GET['staff_id'])) {
    $staff_id = intval($_GET['staff_id']); // Sanitize input
    $query = "SELECT * FROM Maintenance_Worker WHERE Worker_Id = ?";
    $stmt = mysqli_prepare($conn, $query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, 'i', $staff_id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        if ($result && $staff = mysqli_fetch_assoc($result)) {
            // Staff details fetched successfully
        } else {
            $error_message = "No staff found with the given ID.";
        }
    } else {
        $error_message = "Database query error: " . mysqli_error($conn);
    }
}

?>

<title>e-HRCS - Maintenance Staff Details</title>

<!-- Start::app-content -->
<div class="main-content app-content">
    <div class="container">
        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Maintenance Staff Details</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="view-maintenance-staff.php">Maintenance Staff Management</a></li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header Close -->

        <!-- Check if staff data is available or show error -->
        <?php if (isset($staff)): ?>
            <div class="modal fade show" id="viewstaffdetails" tabindex="-1" aria-labelledby="viewstaffdetailsLabel" aria-hidden="true" style="display: block;">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="modal-title" style="color: black;">Staff Details</div>
                            <a href="view-maintenance-staff.php" class="btn-close" aria-label="Close"></a>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label>Staff Number</label>
                                        <input type="text" class="form-control" value="<?= htmlspecialchars($staff['Worker_No']); ?>" readonly>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label>Staff Name</label>
                                        <input type="text" class="form-control" value="<?= htmlspecialchars($staff['Name']); ?>" readonly>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label>Phone Number</label>
                                        <input type="text" class="form-control" value="<?= htmlspecialchars($staff['Phone_No']); ?>" readonly>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label>Specialization</label>
                                        <input type="text" class="form-control" value="<?= htmlspecialchars($staff['Specialization']); ?>" readonly>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label>Email</label>
                                        <input type="text" class="form-control" value="<?= htmlspecialchars($staff['Email']); ?>" readonly>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <?php elseif (isset($error_message)): ?>
            <div class="alert alert-danger"><?= htmlspecialchars($error_message); ?></div>
        <?php endif; ?>
    </div>
</div>
<!-- End::app-content -->

<?php
include 'includes/footer-.php';
?>
