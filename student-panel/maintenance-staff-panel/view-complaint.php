<?php
include('includes/header-.php'); 
include 'ainaconnection.php'; 
?>

<title>e-HRCS - Complaint Management</title>

<script src="../assets/js/jquery-3.7.1.min.js"></script>

<!-- App Content -->
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

        <!-- Row 1 -->
        <div class="row mb-4">
            <table class="table table-bordered display">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Complaint ID</th>
                        <th>Student Name</th>
                        <th>Matric Number</th>
                        <th>Phone Number</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = "SELECT * FROM complaints"; // Update 'complaints' to your actual table name
                    $result = mysqli_query($conn, $query);

                    if (mysqli_num_rows($result) > 0) {
                        $count = 1;
                        while ($row = mysqli_fetch_assoc($result)) {
                            echo "<tr>";
                            echo "<td>" . $count . "</td>";
                            echo "<td>" . $row['complaint_id'] . "</td>";
                            echo "<td>" . $row['student_name'] . "</td>";
                            echo "<td>" . $row['matric_number'] . "</td>";
                            echo "<td>" . $row['phone_number'] . "</td>";
                            echo "<td>
                                    <button class='btn btn-primary btn-view' data-bs-toggle='modal' data-bs-target='#viewcomplaindetails'>View</button>
                                    <button class='btn btn-success btn-assign' data-bs-toggle='modal' data-bs-target='#assigncomplaintmodal'>Assign</button>
                                  </td>";
                            echo "</tr>";
                            $count++;
                        }
                    } else {
                        echo "<tr><td colspan='6' class='text-center'>No complaints found</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal 1 -->
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
                        <div class="col-md-6 mb-3">
                            <label>Room Number</label>
                            <input type="text" class="form-control" id="room_number" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Complaint Type</label>
                            <input type="text" class="form-control" id="complaint_type" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Issue Type</label>
                            <input type="text" class="form-control" id="issue_type" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Complaint Description</label>
                            <textarea class="form-control" id="complaint_description" readonly></textarea>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal 2: Assign Complaint -->
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
                            <input type="text" class="form-control" id="assign_complaint_id" readonly>
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
                        <button type="button" class="btn btn-primary">Assign</button>
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

        // Example for dynamically populating modal details (replace with your actual implementation)
        $('.btn-view').on('click', function() {
            $('#room_number').val('Example Room');
            $('#complaint_type').val('Example Type');
            $('#issue_type').val('Example Issue');
            $('#complaint_description').val('Example Description');
        });
    });
</script>

<?php include('includes/footer-.php'); ?>
