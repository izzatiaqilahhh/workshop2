<?php
session_start();
if (isset($_SESSION['student'])) {
    // Redirect logged-in users to the dashboard
    header("Location: dashboard.php");
    exit();
}
?>

<?php include('includes/header.php'); ?>

<head>

    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>e-HRSC - Log In</title>

    <link rel="icon" href="images/logo.png" type="images/x-icon">

    <!-- Bootstrap CSS -->
    <link id="style" href="hostel-staff-panel/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Style CSS -->
    <link href="hostel-staff-panel/assets/css/styles.min.css" rel="stylesheet">

    <!-- Icons CSS -->
    <link href="hostel-staff-panel/assets/css/icons.min.css" rel="stylesheet">

</head>

<div class="container">
    <div class="row justify-content-center align-items-center authentication authentication-basic h-100">
        <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12">
            <div class="card custom-card">
                <div class="card-body p-5">

                    <!-- Display error messages -->
                    <?php
                    if (isset($_SESSION['error'])) {
                        echo "<div class='alert alert-danger text-center'>" . $_SESSION['error'] . "</div>";
                        unset($_SESSION['error']);
                    }
                    ?>
                    <p class="h5 fw-semibold mb-2 text-center">Log In</p>
                    <p class="mb-4 text-muted op-7 fw-normal text-center">Please log in using your matric number and password.</p>
                    <form action="login-process.php" method="POST">
                        <div class="row gy-3">
                            <div class="col-xl-12">
                                <label for="signin-matric-no" class="form-label text-default">Matric Number</label>
                                <input type="text" class="form-control form-control-lg" id="signin-matric-no" placeholder="Matric Number" name="matric_no" required>
                            </div>
                            <div class="col-xl-12 mb-2">
                                <label for="signin-password" class="form-label text-default d-block">Password</label>
                                <div class="input-group">
                                    <input type="Password" class="form-control form-control-lg" id="signin-password" placeholder="Password" name="password" required>
                                    <button class="btn btn-light" type="button" onclick="createpassword('signin-password',this)" id="button-addon2">
                                        <i class="ri-eye-off-line align-middle"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-xl-12 d-grid mt-2">
                                <button type="submit" name="loginBtn" class="btn btn-lg btn-primary-gradient">Log In</button>
                            </div>
                        </div>
                    </form>
                    <div class="text-center">
                        <p class="fs-12 text-muted mt-3">Forgot Password? <a href="forgot-password.php" class="text-primary text-decoration-underline">Reset Password Here</a></p>
                    </div>
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