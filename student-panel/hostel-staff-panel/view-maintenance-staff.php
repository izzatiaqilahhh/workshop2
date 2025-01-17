<?php
include 'qiladbcon.php';
include 'includes/header-.php';
?>

<title>e-HRCS - Maintenance Staff Management</title>

<!-- Start::app-content -->
<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Maintenance Staff Management</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="view-maintenance-staff.php">Maintenance Staff Management</a></li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header Close -->

        <!-- Start::row-1 -->
        <div class="row mb-4">
            <table class="table table-bordered display">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Staff Number</th>
                        <th>Staff Name</th>
                        <th>Phone Number</th>
                        <th>Specialization</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Query to fetch maintenance worker details
                    $query = 'SELECT "worker_no", "name", "phone_no", "specialization", "email", "worker_id"
                              FROM "maintenance_worker"';
                    $result = pg_query($connection, $query); // PostgreSQL query execution

                    if ($result) {
                        $counter = 1;
                        while ($staff_member = pg_fetch_assoc($result)) {
                    ?>
                            <tr>
                                <td><?= $counter++; ?></td>
                                <td><?= htmlspecialchars($staff_member['worker_no']); ?></td>
                                <td><?= htmlspecialchars($staff_member['name']); ?></td>
                                <td><?= htmlspecialchars($staff_member['phone_no']); ?></td>
                                <td><?= htmlspecialchars($staff_member['specialization']); ?></td>
                                <td><?= htmlspecialchars($staff_member['email']); ?></td>
                            </tr>
                    <?php
                        }
                    } else {
                        echo '<tr><td colspan="6">No staff records found.</td></tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- End::row-1 -->

<?php
include 'includes/footer-.php';
?>