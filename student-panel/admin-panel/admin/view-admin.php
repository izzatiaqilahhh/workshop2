<?php include('includes/header.php'); ?>
<title>GreSIS - Admin Management</title>
<script src="../assets/js/jquery-3.7.1.min.js"></script>

<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
<!-- DataTables Buttons CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.bootstrap5.min.css">
<!-- DataTables Responsive CSS -->
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">

<!-- Start::app-content -->
<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4  page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Admin Management</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="index.php">Admin Management</a></li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header Close -->

        <!-- Start::row-1 -->
        <div class="row mb-4">
            <?= alertMessage(); ?>

            <div class="d-flex justify-content-end my-3">
                <a href="add-admin.php" class="btn btn-primary btn-sm text-center">

                    Add Admin
                </a>
            </div>

            <table class="table table-bordered display">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Staff Number</th>
                        <th>Staff Name</th>
                        <th>Email Address</th>
                        <th>Phone Number</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>

                    <?php
                    $admin = getAll('admin');
                    $num = 0;
                    if (mysqli_num_rows($admin) > 0) {
                        foreach ($admin as $adminItem) {
                            $num = $num + 1;
                    ?>

                            <tr>
                                <td><?= $num; ?></td>
                                <td><?= $adminItem['staffno']; ?></td>
                                <td><?= $adminItem['name']; ?></td>
                                <td><?= $adminItem['email']; ?></td>
                                <td><?= $adminItem['phone']; ?></td>
                                <td>
                                    <a href="edit-admin.php?id=<?= $adminItem['id']; ?>" class="btn btn-success btn-sm">Edit</a>
                                    <a href="delete-admin.php?id=<?= $adminItem['id']; ?>" class="btn btn-danger btn-sm mx-2" onclick="return confirm('Are you sure you want to delete this data?')">
                                        Delete
                                    </a>
                                </td>
                            </tr>

                        <?php
                        }
                    } else {
                        ?>

                        <tr>
                            <td colspan="7">No record found.</td>
                        </tr>
                    <?php
                    }
                    ?>

                </tbody>
            </table>


        </div>
        <!--End::row-1 -->

    </div>
</div>
<!-- End::app-content -->

</div>


<!-- <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css"> -->

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
    <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.bootstrap5.min.css">
<!-- JSZip for Excel export -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<!-- PDFMake for PDF export -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.colVis.min.js"></script>



<script>
    $(document).ready(function() {
        $('.table').DataTable({
            responsive:true,
            dom: 'Bfrtip',
            layout: {
                topStart: {
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
                                columns: [0, 1, 2, 5]
                            }
                        },
                        'colvis'
                    ]
                }
            }


        });
    });
</script>

<?php include('includes/footer.php'); ?>