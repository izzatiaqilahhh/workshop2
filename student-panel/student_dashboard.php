<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal" data-theme-mode="light" data-header-styles="light" data-menu-styles="gradient" data-nav-style="menu-hover" data-width="boxed" loader="enable">

<head>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>E-Hostel Complaint - Dashboard</title>

    <link rel="icon" href="images/logo.png" type="images/x-icon">

    <!-- Bootstrap CSS -->
    <link id="style" href="admin-panel/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Style CSS -->
    <link href="admin-panel/assets/css/styles.min.css" rel="stylesheet">

    <!-- Icons CSS -->
    <link href="admin-panel/assets/css/icons.min.css" rel="stylesheet">
</head>

<body>
    <!-- App Header -->
    <header class="app-header">
        <div class="main-header-container container-fluid">
            <div class="header-content-left">
                <div class="header-element">
                    <div class="horizontal-logo">
                        <a href="user-homepage.php" class="text-black fw-bolder fs-20">E-Hostel Complaint</a>
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
                                <p class="fw-semibold mb-0 lh-1">Nur Izzati Aqilah Binti Rahmad</p>
                                <span class="op-7 fw-normal d-block fs-11">B032320078@student.utem.edu.my</span>
                            </div>
                        </div>
                    </a>
                    <ul class="main-header-dropdown dropdown-menu pt-0 overflow-hidden header-profile-dropdown dropdown-menu-end" aria-labelledby="mainHeaderProfile">
                        <li><a class="dropdown-item d-flex" href="#"><i class="ti ti-logout fs-18 me-2 op-7"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!-- /App Header -->

    <!-- Start::App Content -->
    <div class="main-content app-content">
        <div class="container-fluid">
            <!-- Page Header -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-header-breadcrumb py-sm-4 py-md-0">
                <h1 class="page-title fw-semibold fs-18 mb-0">Dashboard</h1>
                <div class="ms-md-1 ms-0">
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="#">Nur Izzati Aqilah Binti Rahmad</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!-- /Page Header -->

            <!-- Start::Dashboard Modules Section -->
            <div class="row mt-4">
                <!-- My Profile Section -->
                <div class="col-md-4">
                    <div class="card custom-card">
                        <div class="card-body">
                            <h5 class="card-title">My Profile</h5>
                            <p class="card-text">View and edit your personal details.</p>
                            <a href="student-profile.php" class="btn btn-primary">Go to Profile</a>
                        </div>
                    </div>
                </div>

                <!-- My Complaints Section -->
                <div class="col-md-4">
                    <div class="card custom-card">
                        <div class="card-body">
                            <h5 class="card-title">My Complaints</h5>
                            <p class="card-text">Submit a new complaint or check the status of your existing complaints.</p>
                            <a href="complaint-list.php" class="btn btn-primary">Manage Complaints</a>
                        </div>
                    </div>
                </div>

                <!-- Room Information Section -->
                <div class="col-md-4">
                    <div class="card custom-card">
                        <div class="card-body">
                            <h5 class="card-title">Room Information</h5>
                            <p class="card-text">Check your room details and report any issues you may have with your hostel room.</p>
                            <a href="room-information.php" class="btn btn-primary">Room Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End::Dashboard Modules Section -->

        </div>
    </div>
    <!-- End::App Content -->

    <!-- Bootstrap JS -->
    <script src="admin-panel/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
