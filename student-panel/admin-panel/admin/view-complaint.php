<?php include('includes/header.php'); ?>

<title>E-Hostel Room Complaint System - Complaint Management</title>

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
            <h1 class="page-title fw-semibold fs-22 mb-0">Complaint Management</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="view-complaint.php">Complaint Management</a></li>
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
                        <th>Complaint Number</th>
                        <th>Student Name</th>
                        <th>Matric Number</th>
                        <th>Phone Number</th>
                        <th>Room Number</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                   
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <button class="btn btn-primary btn-view" data-bs-toggle="modal" data-bs-target="#viewcomplaindetails">View</button>
                            <button class="btn btn-success btn-assign" data-bs-toggle="modal" data-bs-target="#assigncomplaintmodal">Assign</button>
                        </td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- End::row-1 -->

<!-- Modal: View Complaint Details -->
<div class="modal fade" id="viewcomplaindetails" tabindex="-1" aria-labelledby="viewcomplaintdetailsLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title" style="color: black;">Complaint Details</div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">

                        <!-- New Field for Complaint Image -->
                        <div class="col-md-12 mb-3">
                            <label>Complaint Image</label>
                            <img src="<?php echo '../uploads/' . $complaint_image; ?>" alt="Complaint Image" class="img-fluid" style="max-width: 100%; height: auto; border: 1px solid #ddd;">
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Complaint Type</label>
                            <input type="text" class="form-control" value="Security Issues" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Issue Type</label>
                            <input type="text" class="form-control" value="Broken Locks" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Complaint Description</label>
                            <input type="text" class="form-control" value="My door locks was broken." readonly>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal: Assign Complaint -->
<div class="modal fade" id="assigncomplaintmodal" tabindex="-1" aria-labelledby="assigncomplaintmodalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="assigncomplaintmodalLabel" style="color: black;">Assign Complaint</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Complaint ID</label>
                            <input type="text" class="form-control" value="123456" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Assign To</label>
                            <select class="form-control">
                                <option value="">Select Staff</option>
                                <option value="staff1">Staff Member 1</option>
                                <option value="staff2">Staff Member 2</option>
                                <option value="staff3">Staff Member 3</option>
                            </select>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label>Remarks</label>
                            <textarea class="form-control" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="text-end">
                        <button type="submit" class="btn btn-primary">Assign</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>

<script>
    $(document).ready(function() {
        $('.table').DataTable({
            responsive: true,
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
