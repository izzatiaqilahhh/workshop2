<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['student'])) {
    // If not logged in, redirect to the login page
    header("Location: studentLogin.php");
    exit();
}

// Include database configuration and functions
include('teahdbconfig.php');

// Fetch user-specific data
try {
    $stmt = $pdo->prepare('SELECT * FROM student WHERE matric_no = :matric_no');
    $stmt->bindParam(':matric_no', $_SESSION['student']);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo 'Database connection failed: ' . $e->getMessage();
    exit();
}
?>

<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal" data-theme-mode="light" data-header-styles="light" data-menu-styles="gradient" data-nav-style="menu-hover" data-width="boxed" loader="enable">

<head>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>e-HRCS - My Profile</title>

    <link rel="icon" href="images/logo.png" type="image/x-icon">

    <!-- Bootstrap CSS -->
    <link id="style" href="hostel-staff-panel/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Style CSS -->
    <link href="hostel-staff-panel/assets/css/styles.min.css" rel="stylesheet">

    <!-- Icons CSS -->
    <link href="hostel-staff-panel/assets/css/icons.min.css" rel="stylesheet">
</head>

<body>

    <!-- App Header -->
    <header class="app-header">
        <div class="main-header-container container-fluid">
            <div class="header-content-left">
                <div class="header-element">
                    <div class="horizontal-logo">
                        <a href="profile.php" class="text-black fw-bolder fs-20">E-Hostel Room Complaint System</a>
                    </div>
                </div>
            </div>
            <div class="header-content-right">
                <div class="header-element">
                    <a href="#" class="header-link dropdown-toggle" id="mainHeaderProfile" data-bs-toggle="dropdown" aria-expanded="false">
                        <div class="d-flex align-items-center">
                            <div class="me-sm-2 me-0">
                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" style="fill: rgba(10, 10, 0, 1);">
                                    <path d="M12 2C6.579 2 2 6.579 2 12s4.579 10 10 10 10-4.579 10-10S17.421 2 12 2zm0 5c1.727 0 3 1.272 3 3s-1.273 3-3 3c-1.726 0-3-1.272-3-3s1.274-3 3-3zm-5.106 9.772c.897-1.32 2.393-2.2 4.106-2.2h2c1.714 0 3.209.88 4.106 2.2C15.828 18.14 14.015 19 12 19s-3.828-.86-5.106-2.228z"></path>
                                </svg>
                            </div>
                            <div class="d-sm-block d-none">
                                <p class="fw-semibold mb-0 lh-1"><?php echo htmlspecialchars($user['name']); ?></p>
                                <span class="op-7 fw-normal d-block fs-11"><?php echo htmlspecialchars($user['email']); ?></span>
                            </div>
                        </div>
                    </a>
                    <ul class="main-header-dropdown dropdown-menu pt-0 overflow-hidden header-profile-dropdown dropdown-menu-end" aria-labelledby="mainHeaderProfile">
                        <li><a class="dropdown-item d-flex" href="logout.php"><i class="ti ti-logout fs-18 me-2 op-7"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!-- App Header -->

    <!-- App Content -->
    <div class="main-content app-content">
        <div class="container-fluid">

            <!-- Page Header -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-header-breadcrumb py-sm-4 py-md-0">
                <h1 class="page-title fw-semibold fs-18 mb-0">My Profile</h1>
                <div class="ms-md-1 ms-0">
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item active" aria-current="page">My Profile</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!-- Page Header -->

            <!-- Profile Section -->
            <div class="row mt-4">
                <div class="d-flex my-3">
                    <a href="dashboard.php" class="btn btn-primary btn-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle-fill me-2" viewBox="0 0 16 16">
                            <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
                        </svg>
                        Back to Dashboard
                    </a>
                </div>
                <div class="card custom-card">
                    <div class="card-header">
                        <div class="card-title">My Details</div>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="update-profile.php">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" id="fullName" class="form-control" name="fullName" value="<?php echo htmlspecialchars($user['name']); ?>" placeholder="Full Name">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="matricNumber">Matric Number</label>
                                    <input type="text" id="matricNumber" class="form-control" name="matricNumber" value="<?php echo htmlspecialchars($user['matric_no']); ?>" placeholder="Matric Number" readonly>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="email">Email Address</label>
                                    <input type="email" id="email" class="form-control" name="email" value="<?php echo htmlspecialchars($user['email']); ?>" placeholder="Email Address">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="Phone_No">Phone Number</label>
                                    <input type="text" id="phone_no" class="form-control" name="Phone_No" value="<?php echo htmlspecialchars($user['phone_no']); ?>" placeholder="Phone Number">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="gender">Gender</label>
                                    <input type="text" id="gender" class="form-control" name="gender" value="<?php echo htmlspecialchars($user['gender']); ?>" placeholder="Gender">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="faculty">Faculty</label>
                                    <input type="text" id="faculty" class="form-control" name="faculty" value="<?php echo htmlspecialchars($user['faculty']); ?>" placeholder="Faculty">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="course">Course</label>
                                    <input type="text" id="course" class="form-control" name="course" value="<?php echo htmlspecialchars($user['course']); ?>" placeholder="Course">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="Year_Of_Study">Year of Study</label>
                                    <input type="text" id="year_of_study" class="form-control" name="year_of_study" value="<?php echo htmlspecialchars($user['year_of_study']); ?>" placeholder="Year of Study">
                                </div>
                                <div class="col-md-12">
                                    <div class="d-flex justify-content-start align-items-center">
                                        <button type="submit" class="btn btn-primary">Save Changes</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Profile Section -->

            <!-- Change Password Section -->
            <div class="card custom-card mt-4">
                <div class="card-header">
                    <div class="card-title">Change Password</div>
                </div>
                <div class="card-body">
                    <?php if (isset($_SESSION['password_error'])): ?>
                        <div class="alert alert-danger">
                            <?php
                            echo $_SESSION['password_error'];
                            unset($_SESSION['password_error']);
                            ?>
                        </div>
                    <?php endif; ?>
                    <?php if (isset($_SESSION['password_success'])): ?>
                        <div class="alert alert-success">
                            <?php
                            echo $_SESSION['password_success'];
                            unset($_SESSION['password_success']);
                            ?>
                        </div>
                    <?php endif; ?>
                    <form method="POST" action="update-password.php">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="currentPassword">Current Password</label>
                                <div class="input-group">
                                    <input type="password" id="currentPassword" class="form-control" name="currentPassword" placeholder="Current Password" required>
                                    <button class="btn btn-outline-secondary" type="button" onclick="togglePasswordVisibility('currentPassword')">
                                        <i class="bi bi-eye-slash" id="toggleCurrentPasswordIcon"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="newPassword">New Password</label>
                                <div class="input-group">
                                    <input type="password" id="newPassword" class="form-control" name="newPassword" placeholder="New Password" required>
                                    <button class="btn btn-outline-secondary" type="button" onclick="togglePasswordVisibility('newPassword')">
                                        <i class="bi bi-eye-slash" id="toggleNewPasswordIcon"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="confirmPassword">Confirm New Password</label>
                                <div class="input-group">
                                    <input type="password" id="confirmPassword" class="form-control" name="confirmPassword" placeholder="Confirm New Password" required>
                                    <button class="btn btn-outline-secondary" type="button" onclick="togglePasswordVisibility('confirmPassword')">
                                        <i class="bi bi-eye-slash" id="toggleConfirmPasswordIcon"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="d-flex justify-content-start align-items-center">
                                    <button type="submit" class="btn btn-primary">Save Changes</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- Change Password Section -->

        </div>
    </div>
    <!-- App Content -->

    <!-- Bootstrap JS -->
    <script src="hostel-staff-panel/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JS for toggling password visibility -->
    <script>
        function togglePasswordVisibility(id) {
            const passwordInput = document.getElementById(id);
            const toggleIcon = document.querySelector(`#${id} + button i`);
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('bi-eye-slash');
                toggleIcon.classList.add('bi-eye');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('bi-eye');
                toggleIcon.classList.add('bi-eye-slash');
            }
        }
    </script>
</body>

</html>