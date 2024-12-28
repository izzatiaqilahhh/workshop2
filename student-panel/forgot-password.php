<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal" data-vertical-style="overlay" data-theme-mode="light" data-header-styles="light" data-menu-styles="light" data-toggled="close">

<head>

  <!-- Meta Data -->
  <meta charset="UTF-8">
  <meta name='viewport' content='width=device-width, initial-scale=1.0'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>E-Hostel Room Complaint System - Forgot Password</title>

  <link rel="icon" href="images/logo.png" type="images/x-icon">

  <!-- Bootstrap CSS -->
  <link id="style" href="hostel-staff-panel/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Style CSS -->
  <link href="hostel-staff-panel/assets/css/styles.min.css" rel="stylesheet">

  <!-- Icons CSS -->
  <link href="hostel-staff-panel/assets/css/icons.min.css" rel="stylesheet">

  <!-- Custom Background Style (move to external CSS if needed) -->
  <style>
    body {
      background-image: url('images/banner1.jpg');
      background-repeat: no-repeat;
      background-size: cover;
      -webkit-backdrop-filter: blur(8px);
      backdrop-filter: blur(8px);
    }
  </style>

</head>

<body>

  <!-- App Header -->
  <header class="app-header" style="background-color:rgba(0,0,0,0.0); border:0">
    <div class="main-header-container container-fluid">
      <div class="header-content-left">
        <div class="header-element">
          <div class="horizontal-logo">
            <a href="index.php" class="text-black fw-bolder fs-20">
              E-Hostel Room Complaint System
            </a>
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- App Header -->

  <!-- Forgot Password Form -->
  <div class="container-lg py-5">
    <div class="row justify-content-center align-items-center authentication authentication-basic h-100">
      <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12 my-5">
        <?php
        if (isset($_SESSION['success'])) {
            echo '<div class="alert alert-success">' . $_SESSION['success'] . '</div>';
            unset($_SESSION['success']);
        }
        if (isset($_SESSION['error'])) {
            echo '<div class="alert alert-danger">' . $_SESSION['error'] . '</div>';
            unset($_SESSION['error']);
        }
        ?>
        <form action="reset-password.php" method="POST">
          <div class="card custom-card" style="background-color:rgba(255,255,255,0.8);">
            <div class="card-body p-5">
              <p class="h5 fw-semibold mb-2 text-center">Forgot Password</p>
              <p class="mb-4 text-muted op-7 fw-normal text-center">Enter your registered email address to reset your password.</p>
              <div class="row gy-3">
                <div class="col-xl-12">
                  <label for="forgot-email" class="form-label text-default">Email Address</label>
                  <input type="email" class="form-control form-control-lg" id="forgot-email" placeholder="Email Address" required>
                </div>
                <div class="col-xl-12 d-grid mt-3">
                  <button type="submit" class="btn btn-lg btn-primary-gradient">Send Reset Link</button>
                </div>
              </div>
              <div class="text-center">
                <p class="fs-12 text-muted mt-3">Remembered your password? <a href="login.php" class="text-primary text-decoration-underline">Log In</a></p>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- Forgot Password Form -->

  <!-- Bootstrap JS -->
  <script src="admin-panel/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
