<?php
include('includes/header.php');
include 'ainaconnection.php'; ?>

<title>e-HRCS - Register</title>

<!-- App Header -->
<header class="app-header" style="background-color:rgba(0,0,0,0.0); border:0">
    <div class="main-header-container container-fluid">
        <div class="header-content-left">
            <div class="header-element">
                <div class="horizontal-logo">
                    <a href="register.php" class="text-black fw-bolder fs-20">
                        E-Hostel Room Complaint System
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- App Header -->

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
                                <input type="text" class="form-control form-control-lg" id="staff-name" placeholder="Staff Name" name="staff_name" required>
                            </div>
                            <div class="col-xl-12">
                                <label for="staff-number" class="form-label text-default">Staff Number</label>
                                <input type="text" class="form-control form-control-lg" id="staff-number" placeholder="Staff Number" name="staff_number" required>
                            </div>
                            <div class="col-xl-12">
                                <label for="staff-email" class="form-label text-default">Email Address</label>
                                <input type="email" class="form-control form-control-lg" id="staff-email" placeholder="Email Address" name="staff_email" required>
                            </div>
                            <div class="col-xl-12">
                                <label for="phone-number" class="form-label text-default">Phone Number</label>
                                <input type="tel" class="form-control form-control-lg" id="phone-number" placeholder="Phone Number" name="phone_number" required>
                            </div>
                            <div class="col-xl-12">
                                <label for="specialization" class="form-label text-default">Specialization</label>
                                <input type="text" class="form-control form-control-lg" id="specialization" placeholder="Specialization" name="specialization" required>
                            </div>
                            <div class="col-xl-12">
                                <label for="company-name" class="form-label text-default">Company Name</label>
                                <input type="text" class="form-control form-control-lg" id="company-name" placeholder="Company Name" name="company_name" required>
                            </div>
                            <div class="col-xl-12">
                                <label for="company-office" class="form-label text-default">Company Office Number</label>
                                <input type="tel" class="form-control form-control-lg" id="company-office" placeholder="Company Office Number" name="company_office" required>
                            </div>
                            <div class="col-xl-12">
                                <label for="company-email" class="form-label text-default">Company Email Address</label>
                                <input type="email" class="form-control form-control-lg" id="company-email" placeholder="Company Email Address" name="company_email" required>
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

</body>

</html>

<?php include('includes/footer.php'); ?>