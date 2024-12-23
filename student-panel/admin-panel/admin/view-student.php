<?php include('includes/header.php'); ?>

<title>E-Hostel Room Complaint System - Student Management</title>

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
            <h1 class="page-title fw-semibold fs-22 mb-0">Student Management</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="view-student.php">Student Management</a></li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Start::row-1 -->
        <div class="row mb-4">
            <table class="table table-bordered display">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Matric Number</th>
                        <th>Student Name</th>
                        <th>Identification Card Number</th>
                        <th>Phone Number</th>
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
                        <td>
                            <button class="btn btn-primary btn-view" data-bs-toggle="modal" data-bs-target="#viewstudentdetails" data-id="<?= $student['student_id'] ?>">View</button>
                        </td>
                    </tr>
                   
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- End::row-1 -->

<!-- Modal: View Student Details -->
<div class="modal fade" id="viewstudentdetails" tabindex="-1" aria-labelledby="viewstudentdetailsLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title" style="color: black;">Student Details</div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Faculty</label>
                            <input type="text" class="form-control" id="faculty" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Course</label>
                            <input type="text" class="form-control" id="course" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Gender</label>
                            <input type="text" class="form-control" id="gender" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Year of Study</label>
                            <input type="text" class="form-control" id="year_of_study" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Room Number</label>
                            <input type="text" class="form-control" id="room_number" readonly>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">

<!-- JSZip for Excel export -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>

<!-- PDFMake for PDF export -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.colVis.min.js"></script>

<script>
    $(document).ready(function() {
        $('.table').DataTable({
            responsive: true,
            dom: 'Bfrtip',
            buttons: [
                {
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
        });

        $('.btn-view').click(function() {
            var studentId = $(this).data('id');
            // Use AJAX to get student details by ID and populate the modal fields
            $.ajax({
                url: 'get_student_details.php',
                method: 'POST',
                data: { id: studentId },
                success: function(response) {
                    $('#student_name').val(response.student_name);
                    $('#matric_number').val(response.matric_number);
                    // Set other fields similarly
                }
            });
        });
    });
</script>

<?php include('includes/footer.php'); ?>
