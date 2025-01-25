<?php
session_start();
include('includes/header-.php');

// Check if the user is logged in
if (!isset($_SESSION['maintenance_staff'])) {
    // If not logged in, redirect to the login page
    header("Location: maintenanceStaffLogin.php");
    exit();
}

// Include database configuration and functions
include('ainaconnection.php');

// Fetch user-specific data
try {
    $stmt = $pdo->prepare('SELECT * FROM maintenance_worker WHERE worker_no = :worker_no');
    $stmt->bindParam(':worker_no', $_SESSION['maintenance_staff']);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Fetch company data
    $stmt_company = $pdo->prepare('SELECT * FROM maintenance_company WHERE company_id = :company_id');
    $stmt_company->bindParam(':company_id', $user['company_id']);
    $stmt_company->execute();
    $company = $stmt_company->fetch(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo 'Database connection failed: ' . $e->getMessage();
    exit();
}
?>

<title>e-HRCS - Maintenance Staff Profile</title>

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
                                <label for="name">Name</label>
                                <input type="text" id="name" class="form-control" name="name" value="<?php echo htmlspecialchars($user['name']); ?>" placeholder="Name">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="workerNumber">Worker Number</label>
                                <input type="text" id="workerNumber" class="form-control" name="workerNumber" value="<?php echo htmlspecialchars($user['worker_no']); ?>" placeholder="Worker Number" readonly>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="email">Email Address</label>
                                <input type="email" id="email" class="form-control" name="email" value="<?php echo htmlspecialchars($user['email']); ?>" placeholder="Email Address">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="phone_no">Phone Number</label>
                                <input type="text" id="phone_no" class="form-control" name="phone_no" value="<?php echo htmlspecialchars($user['phone_no']); ?>" placeholder="Phone Number">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="specialization">Specialization</label>
                                <input type="text" id="specialization" class="form-control" name="specialization" value="<?php echo htmlspecialchars($user['specialization']); ?>" placeholder="Specialization">
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

        <!-- Company Details Section -->
        <div class="row mt-4">
            <div class="card custom-card">
                <div class="card-header">
                    <div class="card-title">Company Details</div>
                </div>
                <div class="card-body">
                    <form method="POST" action="update-company.php">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="company_name">Company Name</label>
                                <input type="text" id="company_name" class="form-control" name="company_name" value="<?php echo htmlspecialchars($company['company_name']); ?>" placeholder="Company Name">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="company_office_no">Company Office Number</label>
                                <input type="text" id="company_office_no" class="form-control" name="company_office_no" value="<?php echo htmlspecialchars($company['company_office_no']); ?>" placeholder="Company Office Number">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="company_email">Company Email</label>
                                <input type="email" id="company_email" class="form-control" name="company_email" value="<?php echo htmlspecialchars($company['company_email']); ?>" placeholder="Company Email">
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
        <!-- Company Details Section -->

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

<?php include('includes/footer-.php'); ?>