<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['student'])) {
    // If not logged in, redirect to the login page
    header("Location: login.php");
    exit();
}

// Include database configuration and functions
include('teahdbconfig.php');

// Fetch user-specific data
try {
    // Fetch user profile information
    $stmt = $pdo->prepare('SELECT * FROM student WHERE Matric_No = :Matric_No');
    $stmt->bindParam(':Matric_No', $_SESSION['student']);
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

    <title>E-Hostel Room Complaint System - Student Dashboard</title>

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
                        <a href="dashboard.php" class="text-black fw-bolder fs-20">E-Hostel Room Complaint System</a>
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
                                <p class="fw-semibold mb-0 lh-1"><?php echo htmlspecialchars($user['Name']); ?></p> <!-- Display Full Name -->
                                <span class="op-7 fw-normal d-block fs-11"><?php echo htmlspecialchars($user['Email']); ?></span> <!-- Display Email -->
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
                <h1 class="page-title fw-semibold fs-18 mb-0">Dashboard</h1>
                <div class="ms-md-1 ms-0">
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="#"></a></li>
                            <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!-- Page Header -->

            <!-- Dashboard Modules Section -->
            <div class="row mt-4">
                <!-- My Profile Section -->
                <div class="col-sm-12 col-md-4">
                    <div class="card custom-card">
                        <div class="card-body">
                            <h5 class="card-title">My Profile</h5>
                            <p class="card-text">View and edit your personal details.</p>
                            <a href="profile.php" class="btn btn-primary">Go to Profile</a>
                        </div>
                    </div>
                </div>
                <!-- My Profile Section -->

                <!-- My Complaints Section -->
                <div class="col-sm-12 col-md-4">
                    <div class="card custom-card">
                        <div class="card-body">
                            <h5 class="card-title">My Complaints</h5>
                            <p class="card-text">Submit a new complaint or check the status of your existing complaints.</p>
                            <a href="complaint-list.php" class="btn btn-primary">Manage Complaints</a>
                        </div>
                    </div>
                </div>
                <!-- My Complaints Section -->

                <!-- Room Information Section -->
                <div class="col-sm-12 col-md-4">
                    <div class="card custom-card">
                        <div class="card-body">
                            <h5 class="card-title">Hostel Information</h5>
                            <p class="card-text">Check your room details and report any issues you may have with your hostel room.</p>
                            <a href="hostel-information.php" class="btn btn-primary">Hostel Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Dashboard Modules Section -->

        </div>
    </div>
    <!-- App Content -->

    <!-- Bootstrap JS -->
    <script src="admin-panel/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
