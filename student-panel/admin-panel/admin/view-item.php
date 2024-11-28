<?php include('includes/header.php'); ?>

<title>GreSIS - Item Management</title>

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
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Item Management</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="index.php">Item Management</a></li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header Close -->

        <!-- Start::row-1 -->
        <div class="row mb-3">
            <?= alertMessage(); ?>
            <div class="d-flex justify-content-end my-3">
                <a href="add-item.php" class="btn btn-primary btn-sm ">Add Item</a>
            </div>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Image</th>
                        <th>Item Name</th>
                        <th>QR Code</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>

                    <?php
                    $items = getAll('item');
                    $num = 0;
                    if (mysqli_num_rows($items) > 0) {
                        foreach ($items as $item) {
                            $num = $num + 1;
                    ?>

                            <tr>
                                <td><?= $num; ?></td>
                                <td><img src="../uploads/items/<?= $item['image']; ?>" class="img-fluid" width="150px" height="150px" /></td>
                                <td><?= $item['name']; ?></td>
                                <td><img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=<?= $item['qrcode']; ?>" /></td>
                                <td>
                                    <button class="btn btn-success btn-sm my-1" data-bs-toggle="modal" data-bs-target="#viewdetails<?= $item['id']; ?>">View</button>
                                    <a href="edit-item.php?id=<?= $item['id']; ?>" class="btn btn-success btn-sm my-1">Edit</a>
                                    <a href="delete-item.php?id=<?= $item['id']; ?>" class="btn btn-danger btn-sm my-1" onclick="return confirm('Are you sure you want to delete this data?')">Delete</a>
                                </td>
                            </tr>

                        <?php
                        }
                    } else {
                        ?>

                        <tr>
                            <td colspan="14">No record found.</td>
                        </tr>

                    <?php
                    }
                    ?>

                </tbody>
            </table>


        </div>
        <!--End::row-1 -->

    </div>
    <?php
    $items = getAll('item');
    $num = 0;
    if (mysqli_num_rows($items) > 0) {
        foreach ($items as $item) {
            $num = $num + 1;
    ?>

            <div class="modal modal-fade" id="viewdetails<?= $item['id']; ?>">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="modal-title" style="color: black;"><?= $item['name']; ?></div>
                            <button type="button" class=" btn btn-close" data-bs-dismiss="modal" data-bs-theme="light"></button>
                        </div>
                        <div class="modal-body">
                            <p class="card-text"><span class="fw-bold">Fabricator:</span> <?= $item['fabricator']; ?></p>
                            <p class="card-text"><span class="fw-bold">Dimension:</span> <?= $item['dimension']; ?></p>
                            <p class="card-text"><span class="fw-bold">Weight:</span> <?= $item['weight']; ?></p>
                            <p class="card-text"><span class="fw-bold">Green Materials:</span> <?= $item['gmaterials']; ?></p>
                            <p class="card-text"><span class="fw-bold">Percentage Utilization:</span> <?= $item['putilization']; ?></p>
                            <p class="card-text"><span class="fw-bold">Function:</span> <?= $item['function']; ?></p>
                            <p class="card-text"><span class="fw-bold">Description:</span> <?= $item['description']; ?></p>
                            <p class="card-text"><span class="fw-bold">Process:</span> </p>
                            <img src="../uploads/process/<?= $item['process']; ?>" alt="process-<?= $item['process']; ?>" class="img-fluid">

                        </div>
                    </div>
                </div>
            </div>

        <?php
        }
    } else {
        ?>
        <tr>
            <td colspan="14">No record found.</td>
        </tr>
    <?php
    }
    ?>
</div>
<!-- End::app-content -->

</div>

<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">

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