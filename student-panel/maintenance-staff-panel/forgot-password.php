<?php
include('includes/header.php');
include 'ainaconnection.php';  // Include your database configuration file
?>

<title>e-HRCS - Forgot Password</title>

<div class="container">
    <div class="row justify-content-center align-items-center authentication authentication-basic h-100">
        <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12">
            <div class="card custom-card">
                <div class="card-body p-5">
                    <p class="h5 fw-semibold mb-2 text-center">Forgot Password</p>
                    <p class="mb-4 text-muted op-7 fw-normal text-center">Enter your registered email address to reset your password.</p>
                    <!-- Start of form -->
                    <form method="POST" action="reset-password-process.php">
                        <div class="row gy-3">
                            <div class="col-xl-12">
                                <label for="email" class="form-label text-default">Email Address</label>
                                <input type="email" class="form-control form-control-lg" id="email" placeholder="Email Address" name="email" required>
                            </div>
                            <div class="col-xl-12 d-grid mt-2">
                                <button type="submit" name="resetPasswordBtn" class="btn btn-lg btn-primary-gradient">Send Reset Link</button>
                            </div>
                        </div>
                        <div class="text-center">
                            <p class="fs-12 text-muted mt-3">Remembered your password? <a href="login.php" class="text-primary text-decoration-underline">Log In</a></p>
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