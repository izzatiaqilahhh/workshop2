<?php include('includes/header.php'); ?>

<title>e-HRCS - Homepage</title>

<!-- App Header -->
<header class="app-header" style="background-color:rgba(0,0,0,0.0); border:0">
    <div class="main-header-container container-fluid">
        <div class="header-content-left">
            <div class="header-element">
                <div class="horizontal-logo">
                    <a href="homepage.php" class="text-black fw-bolder fs-20">
                        E-Hostel Room Complaint System
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- App Header -->

<div class="container text-center mt-5">
    <h1>Welcome to E-Hostel Room Complaint System</h1>
    <p class="mb-4 text-muted">Choose Your User Type to Proceed:</p>

    <div class="row justify-content-center">
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Student</h5>
                    <p class="card-text">Log in to manage your hostel room complaints.</p>
                    <a href="../studentLogin.php" class="btn btn-primary">Student Login</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Hostel Staff</h5>
                    <p class="card-text">Log in to manage and review student complaints.</p>
                    <a href="hostelStaffLogin.php" class="btn btn-primary">Hostel Staff Login</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Maintenance Staff</h5>
                    <p class="card-text">Log in to view and resolve assigned tasks.</p>
                    <a href="maintenanceStaffLogin.php" class="btn btn-primary">Maintenance Staff Login</a>
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