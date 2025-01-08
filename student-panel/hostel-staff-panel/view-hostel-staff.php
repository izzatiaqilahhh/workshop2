<?php
include 'qiladbcon.php';
include('includes/header-.php');
?>

<title>e-HRCS - Hostel Staff Management</title>

<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.bootstrap5.min.css">

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
                    // Fetch hostel staff data from the database
                    $query = 'SELECT S."Staff_No", S."Name", S."Email", S."Phone_No", B."Block_Name" 
                              FROM "Block" B 
                              JOIN "Hostel_Staff" S ON B."Staff_ID" = S."Staff_ID"';

                    $result = pg_query($connection, $query); // Adjusted for PostgreSQL

                    if ($result && pg_num_rows($result) > 0) {
                        $counter = 1;
                        while ($adminItem = pg_fetch_assoc($result)) {
                    ?>
                            <tr>
                                <td><?= $counter++; ?></td>
                                <td><?= htmlspecialchars($adminItem['Staff_No']); ?></td>
                                <td><?= htmlspecialchars($adminItem['Name']); ?></td>
                                <td><?= htmlspecialchars($adminItem['Email']); ?></td>
                                <td><?= htmlspecialchars($adminItem['Phone_No']); ?></td>
                                <td><?= htmlspecialchars($adminItem['Block_Name']); ?></td>
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

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.colVis.min.js"></script>

<script>
    $(document).ready(function() {
        $('.table').DataTable({
            responsive: true,
            dom: 'Bfrtip',
            buttons: [{
                    extend: 'copyHtml5',
                    exportOptions: {
                        columns: [0, ':visible']
                    }
                },
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                'colvis'
            ]
        });
    });
</script>

<?php
include('includes/footer-.php');
?>