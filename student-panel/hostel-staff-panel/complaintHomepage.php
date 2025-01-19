<?php include('includes/header.php'); ?>

<title>e-HRCS - Homepage</title>

<div class="container text-center mt-5">
    <h1 class="display-7 font-weight-bold text-primary mb-4">Welcome to E-Hostel Room Complaint System</h1>
    <p class="lead text-muted mb-5">Please choose your user type to proceed:</p>

    <div class="row justify-content-center">
        
        <!-- Student Card -->
        <div class="col-md-4 mb-4">
            <div class="card shadow-lg rounded-lg border-0">
                <div class="card-body p-4">
                    <h5 class="card-title text-center text-info fs-4 fw-semibold">Student</h5>
                    <p class="card-text text-muted">Log in to manage your hostel room complaints.</p>
                    <a href="../studentLogin.php" class="btn btn-primary btn-lg w-100">Student Login</a>
                </div>
            </div>
        </div>

        <!-- Hostel Staff Card -->
        <div class="col-md-4 mb-4">
            <div class="card shadow-lg rounded-lg border-0">
                <div class="card-body p-4">
                    <h5 class="card-title text-center text-success fs-4 fw-semibold">Hostel Staff</h5>
                    <p class="card-text text-muted">Log in to manage and review student complaints.</p>
                    <a href="hostelStaffLogin.php" class="btn btn-success btn-lg w-100">Hostel Staff Login</a>
                </div>
            </div>
        </div>

        <!-- Maintenance Staff Card -->
        <div class="col-md-4 mb-4">
            <div class="card shadow-lg rounded-lg border-0">
                <div class="card-body p-4">
                    <h5 class="card-title text-center text-warning fs-4 fw-semibold">Maintenance Staff</h5>
                    <p class="card-text text-muted">Log in to view and resolve assigned tasks.</p>
                    <a href="../maintenance-staff-panel/maintenanceStaffLogin.php" class="btn btn-warning btn-lg w-100">Maintenance Staff Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>

<?php include('includes/footer.php'); ?>