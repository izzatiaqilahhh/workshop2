<?php
include('includes/header.php');
require 'config/function.php';
if (isset($_SESSION['auth'])) {
    redirect('admin/index.php', 'You are already logged in.');
}

?>
<title> GreSIS - Admin Log In</title>

<div class="container">
    <div class="row justify-content-center align-items-center authentication authentication-basic h-100">
        <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12">
            <?= alertMessage(); ?>
            <!-- <div class="my-5 d-flex justify-content-center">
                    <a href="index.html">
                        <img src="../assets/images/brand-logos/desktop-logo.png" alt="logo" class="desktop-logo">
                        <img src="../assets/images/brand-logos/desktop-dark.png" alt="logo" class="desktop-dark">
                    </a>
                </div> -->
            <form action="login-code.php" method="POST">
                <div class="card custom-card">
                    <div class="card-body p-5">
                        <p class="h5 fw-semibold mb-2 text-center">Log In</p>
                        <p class="mb-4 text-muted op-7 fw-normal text-center">GreSIS Admin Panel</p>
                        <div class="row gy-3">
                            <div class="col-xl-12">
                                <label for="signin-username" class="form-label text-default">Email Address</label>
                                <input type="email" class="form-control form-control-lg" id="signin-username" placeholder="Email Address" name="email" required>
                            </div>
                            <div class="col-xl-12 mb-2">
                                <label for="signin-password" class="form-label text-default d-block">Password</label>
                                <div class="input-group">
                                    <input type="password" class="form-control form-control-lg" id="signin-password" placeholder="Password" name="password">
                                    <button class="btn btn-light" type="button" onclick="createpassword('signin-password',this)" id="button-addon2"><i class="ri-eye-off-line align-middle"></i></button>
                                </div>

                            </div>
                            <div class="col-xl-12 d-grid mt-2">
                                <button type="submit" name="loginBtn" class="btn btn-lg btn-primary-gradient">Log In</button>
                            </div>
                        </div>
                        <div class="text-center">
                            <p class="fs-12 text-muted mt-3">Don't have an account yet? <a href="register.php" class="text-primary text-decoration-underline">Register Here</a></p>
                        </div>

                    </div>
                </div>
            </form>

            <div class="my-3">
                <a href="../index.php" class="btn btn-sm btn-outline-primary">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-arrow-left me-2" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8" />
                    </svg>
                    Go to GreSIS Home
                </a>

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
<!-- <div class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5 col-sm-8 col-10">
                <div class="card shadow-lg">
                    <div class="card-header text-center bg-primary text-white">
                        <h4>Login</h4>
                    </div>
                    <div class="card-body p-4">
                        <?= alertMessage(); ?>
                        <form action="login-code.php" method="POST">
                            <div class="form-group mb-3">
                                <label for="email">Email Address</label>
                                <input type="email" name="email" id="email" class="form-control" required>
                            </div>
                            <div class="form-group mb-3">
                                <label for="password">Password</label>
                                <input type="password" name="password" id="password" class="form-control" required>
                            </div>
                            <div class="form-group mb-3">
                                <button type="submit" name="loginBtn" class="btn btn-primary w-100">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> -->
<?php include('includes/footer.php'); ?>