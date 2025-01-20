<?php
include('includes/header-.php');

// Check if the user is logged in
if (!isset($_SESSION['hostel_staff'])) {
    header("Location: hostelStaffLogin.php");
    exit();
}

// Include database configuration and fetch user data
include('qiladbcon.php');

try {
    $stmt = $pdo->prepare('SELECT * FROM hostel_staff WHERE staff_no = :staff_no');
    $stmt->bindParam(':staff_no', $_SESSION['hostel_staff']);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        echo "User not found!";
        exit();
    }
} catch (PDOException $e) {
    echo 'Database query failed: ' . $e->getMessage();
    exit();
}
?>

<title>e-HRCS - My Profile</title>


<!-- App Content -->
<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Profile</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item active" aria-current="page">Profile</li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="d-flex my-3">
            <a href="dashboard.php" class="btn btn-primary btn-sm">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle-fill me-2" viewBox="0 0 16 16">
                    <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
                </svg>
                Back to Dashboard
            </a>
        </div>

        <!-- Row 1: Profile Details -->
        <div class="row">
            <form action="update-profile.php" method="POST">
                <div class="card custom-card">
                    <div class="card-header">
                        <div class="card-title">
                            My Details
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Staff Name</label>
                                    <input type="text" name="name" value="<?php echo htmlspecialchars($user['name']); ?>" required class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Staff Number</label>
                                    <input type="text" name="staffno" value="<?php echo htmlspecialchars($user['staff_no']); ?>" required class="form-control" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Email Address</label>
                                    <input type="email" name="email" value="<?php echo htmlspecialchars($user['email']); ?>" required class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Phone Number</label>
                                    <input type="text" name="phone" value="<?php echo htmlspecialchars($user['phone_no']); ?>" required class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <button type="submit" name="editProfile" class="btn btn-primary">Save Changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- Change Password Section -->
        <div class="card custom-card">
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
                <form method="POST" action="change-password.php">
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
                            <label for="confirmPassword">Retype New Password</label>
                            <div class="input-group">
                                <input type="password" id="confirmPassword" class="form-control" name="confirmPassword" placeholder="Retype New Password" required>
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

    </div>
</div>

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

<?php include('includes/footer.php'); ?>