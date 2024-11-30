<title> E-Hostel Complaint - Staff Log In</title>

<div class="container">
    <div class="row justify-content-center align-items-center authentication authentication-basic h-100">
        <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12">
            
            <form action="login-code.php" method="POST">
                <div class="card custom-card">
                    <div class="card-body p-5">
                        <p class="h5 fw-semibold mb-2 text-center">Log In</p>
                        <p class="mb-4 text-muted op-7 fw-normal text-center">E-Hostel Complaint Staff Panel</p>
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
                    Go to Home
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