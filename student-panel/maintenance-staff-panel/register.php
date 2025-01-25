<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

include 'ainaconnection.php'; // Ensure this file includes the database connection setup
include('includes/header.php');
?>

<title>e-HRCS - Register</title>

<div class="container">
    <div class="row justify-content-center align-items-center authentication authentication-basic h-100">
        <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12">
            <div class="card custom-card">
                <div class="card-body p-5">
                    <p class="h5 fw-semibold mb-2 text-center">Register</p>
                    <p class="mb-4 text-muted op-7 fw-normal text-center">Please register first if you don't have an account yet.</p>
                    <!-- Start of form -->
                    <form method="POST" action="register-process.php">
                        <div class="row gy-3">
                            <div class="col-xl-12">
                                <label for="staff-name" class="form-label text-default">Staff Name</label>
                                <input type="text" class="form-control form-control-lg" id="staff-name" placeholder="Staff Name" name="name" required>
                            </div>
                            <div class="col-xl-12">
                                <label for="staff-number" class="form-label text-default">Staff Number</label>
                                <input type="text" class="form-control form-control-lg" id="staff-number" placeholder="Staff Number" name="worker_no" required>
                            </div>
                            <div class="col-xl-12">
                                <label for="staff-email" class="form-label text-default">Email Address</label>
                                <input type="email" class="form-control form-control-lg" id="staff-email" placeholder="Email Address" name="email" required>
                            </div>
                            <div class="col-xl-12">
                                <label for="phone-number" class="form-label text-default">Phone Number</label>
                                <input type="tel" class="form-control form-control-lg" id="phone-number" placeholder="Phone Number" name="phone_no" required>
                            </div>
                            <div class="col-xl-12">
                                <label for="specialization" class="form-label text-default">Specialization</label>
                                <input type="text" class="form-control form-control-lg" id="specialization" placeholder="Specialization" name="specialization" required>
                            </div>
                            <div class="col-xl-12">
                                <label for="company-id" class="form-label text-default">Company ID</label>
                                <input type="text" class="form-control form-control-lg" id="company-id" placeholder="Company ID" name="company_id" required>
                            </div>
                            <div class="col-xl-12 mb-2">
                                <label for="password" class="form-label text-default d-block">Password</label>
                                <div class="input-group">
                                    <input type="password" class="form-control form-control-lg" id="password" placeholder="Password" name="password" required>
                                    <button class="btn btn-light" type="button" onclick="createpassword('password',this)" id="button-addon2"><i class="ri-eye-off-line align-middle"></i></button>
                                </div>
                            </div>
                            <div class="col-xl-12 mb-2">
                                <label for="retype-password" class="form-label text-default d-block">Retype Password</label>
                                <div class="input-group">
                                    <input type="password" class="form-control form-control-lg" id="retype-password" placeholder="Retype Password" name="retype_password" required>
                                    <button class="btn btn-light" type="button" onclick="createpassword('retype-password',this)" id="button-addon2"><i class="ri-eye-off-line align-middle"></i></button>
                                </div>
                            </div>
                            <div class="col-xl-12 d-grid mt-2">
                                <button type="submit" name="registerBtn" class="btn btn-lg btn-primary-gradient">Register</button>
                            </div>
                        </div>
                        <div class="text-center">
                            <p class="fs-12 text-muted mt-3">Already have an account? <a href="maintenanceStaffLogin.php" class="text-primary text-decoration-underline">Log In</a></p>
                        </div>
                    </form>
                    <!-- End of form -->
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Show Password JS -->
<script src="assets/js/show-password.js"></script>

<?php 
// Check for registration success flag and unset it after use
if (isset($_SESSION['registration_success']) && $_SESSION['registration_success'] === true): 
    unset($_SESSION['registration_success']);
?>
<script>
    alert("Registration successful. Redirecting to login page ...");
    window.location.href = "maintenanceStaffLogin.php";
</script>
<?php endif; ?>

</body>
</html>

<?php include('includes/footer.php'); ?>