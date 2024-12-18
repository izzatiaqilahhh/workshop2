<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal" data-vertical-style="overlay" data-theme-mode="light" data-header-styles="light" data-menu-styles="light" data-toggled="close">

<head>

  <!-- Meta Data -->
  <meta charset="UTF-8">
  <meta name='viewport' content='width=device-width, initial-scale=1.0'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>E-Hostel Room Complaint System - Log In</title>

  <link rel="icon" href="images/logo.png" type="images/x-icon">

  <!-- Bootstrap CSS -->
  <link id="style" href="admin-panel/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Style CSS -->
  <link href="admin-panel/assets/css/styles.min.css" rel="stylesheet">

  <!-- Icons CSS -->
  <link href="admin-panel/assets/css/icons.min.css" rel="stylesheet">

  <!-- JavaScript for toggling password visibility -->
  <script>
    function createpassword(inputId, button) {
      var passwordInput = document.getElementById(inputId);
      var passwordType = passwordInput.type;

      if (passwordType === "password") {
        passwordInput.type = "text";
        button.innerHTML = "<i class='ri-eye-line align-middle'></i>";
      } else {
        passwordInput.type = "password";
        button.innerHTML = "<i class='ri-eye-off-line align-middle'></i>";
      }
    }
  </script>
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

  <div class="container">
    <div class="row justify-content-center align-items-center authentication authentication-basic h-100">
      <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12">

        <!-- Login Form -->
        <form action="login.php" method="POST">
          <div class="card custom-card" style="background-color:rgba(255,255,255,0.8);">
            <div class="card-body p-5">
              <p class="h5 fw-semibold mb-2 text-center text-default">Log In</p>
              <p class="mb-4 text-muted op-7 fw-normal text-center">Student Panel</p>
              <div class="row gy-3">
                <div class="col-xl-12">
                  <label for="signin-username" class="form-label text-default">Email Address</label>
                  <input type="email" class="form-control form-control-lg" id="signin-username" name="email" placeholder="Email Address" required>
                </div>
                <div class="col-xl-12 mb-2">
                  <label for="signin-password" class="form-label text-default d-block">Password</label>
                  <div class="input-group">
                    <input type="password" class="form-control form-control-lg" id="signin-password" name="password" placeholder="Password" required>
                    <button class="btn btn-light" type="button" onclick="createpassword('signin-password',this)" id="button-addon2"><i class="ri-eye-off-line align-middle"></i></button>
                  </div>
                </div>
                <div class="col-xl-12 d-grid mt-2">
                  <button type="submit" name="loginBtn" class="btn btn-lg btn-primary-gradient">Log In</button>
                </div>
              </div>
              <div class="text-center">
                <p class="fs-12 text-muted mt-3">Forgot Password? <a href="forgot-password.php" class="text-primary text-decoration-underline">Reset Password Here</a></p>
              </div>
            </div>
          </div>
        </form>
        <!-- Login Form -->

      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="admin-panel/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
