<?php
// Include database connection (not shown here)
// ...

session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $token = $_POST['token'];
    $newPassword = $_POST['new_password'];

    // Verify the token and email in the database (not shown here)
    // ...

    // Update the user's password in the database (password should be hashed)
    // ...

    $_SESSION['success'] = 'Your password has been reset successfully.';
    header('Location: login.php');
    exit();
} else if (isset($_GET['token']) && isset($_GET['email'])) {
    $token = $_GET['token'];
    $email = $_GET['email'];
} else {
    echo 'Invalid request.';
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <link href="hostel-staff-panel/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="hostel-staff-panel/assets/css/styles.min.css" rel="stylesheet">
</head>
<body>
    <div class="container-lg py-5">
        <div class="row justify-content-center align-items-center authentication authentication-basic h-100">
            <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12 my-5">
                <form action="reset-password-form.php" method="post">
                    <div class="card custom-card" style="background-color:rgba(255,255,255,0.8);">
                        <div class="card-body p-5">
                            <p class="h5 fw-semibold mb-2 text-center">Reset Password</p>
                            <div class="row gy-3">
                                <div class="col-xl-12">
                                    <input type="hidden" name="email" value="<?php echo htmlspecialchars($email); ?>">
                                    <input type="hidden" name="token" value="<?php echo htmlspecialchars($token); ?>">
                                    <label for="new_password" class="form-label text-default">New Password</label>
                                    <input type="password" class="form-control form-control-lg" id="new_password" name="new_password" required>
                                </div>
                                <div class="col-xl-12 d-grid mt-3">
                                    <button type="submit" class="btn btn-lg btn-primary-gradient">Reset Password</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>