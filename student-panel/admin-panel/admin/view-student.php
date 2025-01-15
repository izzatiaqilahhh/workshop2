<?php include('includes/header.php'); ?>

<title>E-Hostel Room Complaint System - Student Management</title>

<script src="../assets/js/jquery-3.7.1.min.js"></script>

<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.bootstrap5.min.css">

<!-- App Content -->
<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Student Management</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="dashboard.php">Student Management</a></li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Row 1 -->
        <div class="row mb-4">
            <table class="table table-bordered display">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>123456</td>
                        <td>Nur Izzati Aqilah Binti Rahmad</td>
                        <td>
                            <button class="btn btn-primary btn-view" data-bs-toggle="modal" data-bs-target="#viewstudentdetails">View</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal 1 -->
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
                            <label>Full Name</label>
                            <input type="text" class="form-control" value="Nur Izzati Aqilah Binti Rahmad" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Matric Number</label>
                            <input type="text" class="form-control" value="B032320078" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Identification Card Number</label>
                            <input type="text" class="form-control" value="030119-01-0108" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Phone Number</label>
                            <input type="text" class="form-control" value="019-7327658" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Faculty</label>
                            <input type="text" class="form-control" value="Faculty of Information and Communication Technology" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Course</label>
                            <input type="text" class="form-control" value="Bachelor of Science Computer (Database Management) with Honours" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Year of Study</label>
                            <input type="text" class="form-control" value="2" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Room Number</label>
                            <input type="text" class="form-control" value="SL-L-1-1" readonly>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('.table').DataTable({
            responsive: true
        });
    });
</script>

<?php include('includes/footer.php'); ?>
