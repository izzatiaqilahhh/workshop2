<?php
include('includes/header.php');
require 'config/function.php';

if (isset($_SESSION['auth'])) {
    redirect('admin/index.php', 'You are already logged in.');
}
?>
<title> GreSIS - Admin Registration</title>

<div class="container py-5">
    <div class="row justify-content-center align-items-center authentication authentication-basic h-100">
        <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12 my-5">
        <?= alertMessage(); ?>
            <!-- <div class="my-5 d-flex justify-content-center">
                    <a href="index.html">
                        <img src="../assets/images/brand-logos/desktop-logo.png" alt="logo" class="desktop-logo">
                        <img src="../assets/images/brand-logos/desktop-dark.png" alt="logo" class="desktop-dark">
                    </a>
                </div> -->
            <form action="register-code.php" method="POST">
                <div class="card custom-card ">
                    <div class="card-body p-5">
                        <p class="h5 fw-semibold mb-2 text-center">Register</p>
                        <p class="mb-4 text-muted op-7 fw-normal text-center">GreSIS Admin Registration</p>
                        <div class="row gy-3">
                            <div class="col-xl-12">
                                <label for="signup-firstname" class="form-label text-default">Staff Number</label>
                                <input type="text" class="form-control form-control-lg" id="signup-firstname" placeholder="Staff Number" name="staffno">
                            </div>

                            <div class="col-xl-12">
                                <label for="signup-lastname" class="form-label text-default">Full Name</label>
                                <input type="text" class="form-control form-control-lg" id="signup-lastname" placeholder="Full Name" name="name">
                            </div>

                            <div class="col-xl-12">
                                <label for="signup-lastname" class="form-label text-default">Email Address</label>
                                <input type="email" class="form-control form-control-lg" id="signup-lastname" placeholder="Email Address" name="email">
                            </div>

                            <div class="col-xl-12">
                                <label for="signup-lastname" class="form-label text-default">Phone Number</label>
                                <input type="text" class="form-control form-control-lg" id="signup-lastname" placeholder="Phone Number" name="phone">
                            </div>
                            <div class="col-xl-12">
                                <label for="signup-password" class="form-label text-default">Password</label>
                                <div class="input-group">
                                    <input type="password" class="form-control form-control-lg" id="signup-password" placeholder="Password" name="password">
                                    <button class="btn btn-light" onclick="createpassword('signup-password',this)" type="button" id="button-addon2"><i class="ri-eye-off-line align-middle"></i></button>
                                </div>
                            </div>
                            <div class="col-xl-12 mb-2">
                                <label for="signup-confirmpassword" class="form-label text-default">Confirm Password</label>
                                <div class="input-group">
                                    <input type="password" class="form-control form-control-lg" id="signup-confirmpassword" placeholder="Confirm Password" name="cpassword">
                                    <button class="btn btn-light" onclick="createpassword('signup-confirmpassword',this)" type="button" id="button-addon21"><i class="ri-eye-off-line align-middle"></i></button>
                                </div>

                            </div>
                            <div class="col-xl-12 d-grid mt-2">
                                <button type="submit" name="registerBtn" class="btn btn-lg btn-primary-gradient">Register</button>
                            </div>
                        </div>
                        <div class="text-center">
                            <p class="fs-12 text-muted mt-3">Already have an account? <a href="index.php" class="text-primary text-decoration-underline">Log In</a></p>
                        </div>

                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Show Password JS -->
<script src="assets/js/show-password.js"></script>

<?php include('includes/footer.php'); ?>