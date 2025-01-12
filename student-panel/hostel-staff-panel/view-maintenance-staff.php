<?php
include 'paandbconfig.php'; // MySQL connection setup
include 'includes/header-.php';
?>

<title>e-HRCS - Maintenance Staff Management</title>

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
                        <th>Company Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = 'SELECT W.*, C.Company_Name
                              FROM Maintenance_Worker W
                              JOIN Maintenance_Company C
                              ON W.Company_Id = C.Company_Id';
                    $result = mysqli_query($conn, $query); // MySQL query execution
                    
                    if ($result) {
                        $counter = 1;
                        while ($staff_member = mysqli_fetch_assoc($result)) {
                            ?>
                            <tr>
                                <td><?= $counter++; ?></td>
                                <td><?= htmlspecialchars($staff_member['Worker_No']); ?></td>
                                <td><?= htmlspecialchars($staff_member['Name']); ?></td>
                                <td><?= htmlspecialchars($staff_member['Company_Name']); ?></td>
                                
                                <td>
                                    <button class="btn btn-primary btn-view" data-bs-toggle="modal" data-bs-target="#viewstaffdetails" data-id="<?= htmlspecialchars($staff_member['Worker_Id']); ?>">View</button>
                                </td>
                            </tr>
                            <?php
                        }
                    } else {
                        echo '<tr><td colspan="5">No staff records found.</td></tr>';
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
                            <input type="text" class="form-control" id="#staff_number" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Staff Name</label>
                            <input type="text" class="form-control" id="#staff_name" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Phone Number</label>
                            <input type="text" class="form-control" id="#phone_number" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Specialization</label>
                            <input type="text" class="form-control" id="#specialization" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Email</label>
                            <input type="text" class="form-control" id="#email" readonly>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('.table').DataTable({
            responsive: true,
            dom: 'Bfrtip',
            buttons: ['copy', 'excel', 'pdf', 'colvis']
        });
    });

    $(document).on('click', '.btn-view', function() {
        var staff_id = $(this).data('id'); // Get staff ID

        // Fetch details via AJAX
        $.ajax({
            url: 'get_staff_details.php', // PHP script to fetch staff details
            type: 'POST',
            data: { staff_id: staff_id },
            success: function(response) {
                // Assuming response is JSON
                var staff = JSON.parse(response);
                $('#staff_number').val(staff.Worker_No);
                $('#staff_name').val(staff.Name);
                $('#phone_number').val(staff.Phone_No);
                $('#specialization').val(staff.Specialization);
                $('#email').val(staff.Email);
            },
            error: function() {
                alert('Failed to fetch staff details.');
            }
        });
    });
</script>

<?php
include 'includes/footer-.php';
?>
