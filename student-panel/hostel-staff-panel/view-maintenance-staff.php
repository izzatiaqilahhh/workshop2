<?php include('includes/header-.php'); 
include 'paandbconfig.php';?>?
<title>E-Hostel Room Complaint System - Maintenance Staff Management</title>

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
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Fetch all staff members from the database
                    //include('includes/db_connection.php');
                    $query = "SELECT * FROM Maintenance_Worker";
                    $result = $conn->query($query);
                    if ($result->num_rows > 0) {
                        $counter = 1;
                        while ($staff_member = $result->fetch_assoc()) {
                            ?>
                            <tr>
                                <td><?= $counter++; ?></td>
                                <td><?= $staff_member['Worker_No']; ?></td>
                                <td><?= $staff_member['Name']; ?></td>
                                <td><?= $staff_member['Phone_No']; ?></td>
                                <td>
                                    <button class="btn btn-primary btn-view" data-bs-toggle="modal" data-bs-target="#viewstaffdetails" data-id="<?= $staff_member['Worker_Id'] ?>">View</button>
                                </td>
                            </tr>
                            <?php
                        }
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- End::row-1 -->

<!-- Modal: View Staff Details -->
<div class="modal fade" id="viewstaffdetails" tabindex="-1" aria-labelledby="viewstaffdetailsLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title" style="color: black;">Staff Details</div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Staff Number</label>
                            <input type="text" class="form-control" id="staff_number" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Staff Name</label>
                            <input type="text" class="form-control" id="staff_name" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Phone Number</label>
                            <input type="text" class="form-control" id="phone_number" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Specialization</label>
                            <input type="text" class="form-control" id="specialization" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Email</label>
                            <input type="text" class="form-control" id="email" readonly>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JS for DataTables -->
<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">

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

<!-- JS for Modal with Ajax -->
<script>
    $(document).on('click', '.btn-view', function() {
        var staff_id = $(this).data('id'); // Get the staff ID from data-id attribute

        // Make an Ajax request to fetch staff details
        $.ajax({
            url: 'get_staff_details.php', // PHP file to fetch staff details
            method: 'POST',
            data: { staff_id: staff_id },
            success: function(response) {
                // Populate the modal with the staff details
                var staff = JSON.parse(response); // Assuming the response is in JSON format
                $('#staff_number').val(staff.Worker_No);
                $('#staff_name').val(staff.Name);
                $('#phone_number').val(staff.Phone_No);
                $('#specialization').val(staff.Specialization);
                $('#email').val(staff.Email);
            }
        });
    });
</script>

<?php include('includes/footer-.php'); ?>
