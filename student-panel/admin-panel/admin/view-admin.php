<?php include('includes/header.php'); ?>

<title>E-Hostel Room Complaint System  - Admin Management</title>

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
                        <li class="breadcrumb-item"><a href="view-admin.php">Admin Management</a></li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header Close -->

        <!-- Start::row-1 -->
        <div class="row mb-4">
            <div class="d-flex justify-content-end my-3">
                <a href="add-admin.php" class="btn btn-primary btn-sm text-center">Add Admin</a>
            </div>
            <table class="table table-bordered display">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Staff Number</th>
                        <th>Staff Name</th>
                        <th>Email Address</th>
                        <th>Phone Number</th>
                        <th>Position</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (empty($adminItems)): ?>
                        <tr>
                            <td colspan="6">No record found.</td>
                        </tr>
                    <?php else: ?>
                        <?php foreach ($adminItems as $adminItem): ?>
                        <tr>
                            <td><?= $adminItem['no']; ?></td>
                            <td><?= $adminItem['staff_no']; ?></td>
                            <td><?= $adminItem['staff_name']; ?></td>
                            <td><?= $adminItem['email']; ?></td>
                            <td><?= $adminItem['phone']; ?></td>
                            <td><?= $adminItem['position']; ?></td>
                            <td>
                                <a href="edit-admin.php?id=<?= $adminItem['id']; ?>" class="btn btn-success btn-sm">Edit</a>
                                <form action="delete-admin.php" method="POST" style="display:inline;">
                                    <input type="hidden" name="id" value="<?= $adminItem['id']; ?>" />
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this data?')">Delete</button>
                                </form>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
        <!--End::row-1 -->

    </div>
</div>
<!-- End::app-content -->

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>

<script>
    $(document).ready(function() {
        $('.table').DataTable({
            responsive:true,
            dom: 'Bfrtip',
            buttons: [
                { extend: 'copyHtml5', exportOptions: { columns: [0, ':visible'] } },
                { extend: 'excelHtml5', exportOptions: { columns: ':visible' } },
                { extend: 'pdfHtml5', exportOptions: { columns: [0, 1, 2, 5] } },
                'colvis'
            ]
        });
    });
</script>

<?php include('includes/footer.php'); ?>
