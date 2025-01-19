<!-- <?php
        include('qiladbcon.php');

        try {
            // Fetch counts for the dashboard
            $totalComplaintStmt = $pdo->query('SELECT COUNT(*) FROM complaint');
            $totalComplaint = $totalComplaintStmt->fetchColumn();

            $totalStudentStmt = $pdo->query('SELECT COUNT(*) FROM student');
            $totalStudent = $totalStudentStmt->fetchColumn();

            $totalHostelStaffStmt = $pdo->query('SELECT COUNT(*) FROM hostel_staff');
            $totalHostelStaff = $totalHostelStaffStmt->fetchColumn();

            $totalMaintenanceStaffStmt = $pdo->query('SELECT COUNT(*) FROM maintenance_worker');
            $totalMaintenanceStaff = $totalMaintenanceStaffStmt->fetchColumn();

            // Return data as JSON
            echo json_encode([
                'totalComplaint' => $totalComplaint,
                'totalStudent' => $totalStudent,
                'totalHostelStaff' => $totalHostelStaff,
                'totalMaintenanceStaff' => $totalMaintenanceStaff,
            ]);
        } catch (PDOException $e) {
            echo json_encode(['error' => $e->getMessage()]);
        }
        ?>

<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['hostel_staff'])) {
    header("Location: hostelStaffLogin.php");
    exit();
}

include('qiladbcon.php');
include('includes/header-.php');
?>

<title>e-HRCS - Dashboard Overview</title>

<!-- App Content -->
<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Dashboard Overview</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="dashboard.php">Dashboard Overview</a></li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Row 1 -->
        <div class="row print">

            <div class="d-flex justify-content-end my-3 hidden-print">
                <button class="btn btn-primary btn-sm text-center" onclick="printPage()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" style="fill: rgba(255, 255, 255, 1);">
                        <path d="M19 7h-1V2H6v5H5c-1.654 0-3 1.346-3 3v7c0 1.103.897 2 2 2h2v3h12v-3h2c1.103 0 2-.897 2-2v-7c0-1.654-1.346-3-3-3zM8 4h8v3H8V4zm8 16H8v-4h8v4zm4-3h-2v-3H6v3H4v-7c0-.551.449-1 1-1h14c.552 0 1 .449 1 1v7z"></path>
                        <path d="M14 10h4v2h-4z"></path>
                    </svg>
                    Print
                </button>
            </div>

            <!-- Card 1 -->
            <div class="col-sm-6">
                <div class="card custom-card">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <p class="mb-2">Total Complaint</p>
                            <h4 class="mb-0 fw-semibold mb-2" id="totalComplaint">Loading...</h4>
                        </div>
                        <div>
                            <span class="avatar avatar-md bg-warning p-2">
                                <i class='bx bx-detail side-menu__icon'></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="col-sm-6">
                <div class="card custom-card">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <p class="mb-2">Total Student</p>
                            <h4 class="mb-0 fw-semibold mb-2" id="totalStudent">Loading...</h4>
                        </div>
                        <div>
                            <span class="avatar avatar-md bg-primary p-2">
                                <i class='bx bx-user side-menu__icon'></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 3 -->
            <div class="col-sm-6">
                <div class="card custom-card">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <p class="mb-2">Total Hostel Staff</p>
                            <h4 class="mb-0 fw-semibold mb-2" id="totalHostelStaff">Loading...</h4>
                        </div>
                        <div>
                            <span class="avatar avatar-md bg-success p-2">
                                <i class='bx bxs-user-rectangle side-menu__icon'></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 4 -->
            <div class="col-sm-6">
                <div class="card custom-card">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <p class="mb-2">Total Maintenance Staff</p>
                            <h4 class="mb-0 fw-semibold mb-2" id="totalMaintenanceStaff">Loading...</h4>
                        </div>
                        <div>
                            <span class="avatar avatar-md bg-secondary p-2">
                                <i class='bx bxs-user side-menu__icon'></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Print Page JavaScript Function -->
<script>
    function printPage() {
        window.print();
    }

    // Function to fetch and update data
    function fetchData() {
        fetch('fetch_data.php')
            .then(response => response.json())
            .then(data => {
                if (!data.error) {
                    document.getElementById('totalComplaint').textContent = data.totalComplaint;
                    document.getElementById('totalStudent').textContent = data.totalStudent;
                    document.getElementById('totalHostelStaff').textContent = data.totalHostelStaff;
                    document.getElementById('totalMaintenanceStaff').textContent = data.totalMaintenanceStaff;
                } else {
                    console.error(data.error);
                }
            })
            .catch(error => console.error('Error fetching data:', error));
    }

    // Fetch data initially and then every 5 seconds
    fetchData();
    setInterval(fetchData, 5000);
</script>

<?php include('includes/footer-.php'); ?> -->