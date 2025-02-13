<?php
include 'paandbconfig.php';
include('includes/header-.php');
?>

<title>e-HRCS - Hostel Staff Management</title>

<!-- Start::app-content -->
<div class="main-content app-content">
    <div class="container">
        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Hostel Staff Management</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="view-hostel-staff.php">Hostel Staff Management</a></li>
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
                        <th>Email Address</th>
                        <th>Phone Number</th>
                        <th>Block In-Charge</th>
                    </tr>
                </thead>
                <tbody>

                    <?php
                    // PostgreSQL query to fetch hostel staff data using PDO
                    $query = 'SELECT s."staff_no", s."name", s."email", s."phone_no", b."block_name" 
                              FROM "block" b 
                              JOIN "hostel_staff" s ON b."staff_id" = s."staff_id"';

                    $stmt = $pdo->query($query);

                    if ($stmt && $stmt->rowCount() > 0) {
                        $counter = 1;
                        while ($adminItem = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    ?>
                            <tr>
                                <td><?= $counter++; ?></td>
                                <td><?= htmlspecialchars($adminItem['staff_no']); ?></td>
                                <td><?= htmlspecialchars($adminItem['name']); ?></td>
                                <td><?= htmlspecialchars($adminItem['email']); ?></td>
                                <td><?= htmlspecialchars($adminItem['phone_no']); ?></td>
                                <td><?= htmlspecialchars($adminItem['block_name']); ?></td>
                            </tr>
                        <?php
                        }
                    } else {
                        ?>
                        <tr>
                            <td colspan="6">No record found.</td>
                        </tr>
                    <?php
                    }
                    ?>

                </tbody>
            </table>
        </div>
        <!-- End::row-1 -->
    </div>
</div>
<!-- End::app-content -->


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

<?php
include('includes/footer-.php');
?>