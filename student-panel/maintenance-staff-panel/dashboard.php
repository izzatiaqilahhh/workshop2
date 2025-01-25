<?php
include 'ainaconnection.php';  
include('includes/header-.php');
if (!isset($_SESSION['maintenance_staff'])) {
    header('Location: maintenancestafflogin.php');
    exit();
}

// Fetch user-specific data
try {
    // Fetch user profile information
    $stmt = $pdo->prepare('SELECT * FROM maintenance_worker WHERE worker_no = :worker_no');
    $stmt->bindParam(':worker_no', $_SESSION['maintenance_staff']);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo 'Database connection failed: ' . $e->getMessage();
    exit();
}

// Initialize counts and details
$totalAssigned = 0;
$totalCompleted = 0;
$assignedComplaints = [];
$completedComplaints = [];

try {
    // Fetch total complaints assigned to the user but not resolved yet
    $stmtAssigned = $pdo->prepare('
        SELECT ca.complaint_id, c.complaint_issue, ca.date_assigned 
        FROM complaint_assignment ca
        JOIN complaint c ON ca.complaint_id = c.complaint_id
        LEFT JOIN complaint_status cs ON ca.complaint_id = cs.complaint_id
        WHERE ca.worker_no = :worker_no AND (cs.complaint_status IS NULL OR cs.complaint_status != "resolved")
    ');
    $stmtAssigned->bindParam(':worker_no', $_SESSION['maintenance_staff']);
    $stmtAssigned->execute();
    $assignedComplaints = $stmtAssigned->fetchAll(PDO::FETCH_ASSOC);
    $totalAssigned = count($assignedComplaints);

    // Fetch total complaints completed by the user
    $stmtCompleted = $pdo->prepare('
        SELECT ca.complaint_id, c.complaint_issue, c.date_resolved 
        FROM complaint_assignment ca
        JOIN complaint c ON c.complaint_id = ca.complaint_id
        JOIN complaint_status cs ON c.complaint_id = cs.complaint_id
        WHERE ca.worker_no = :worker_no AND cs.complaint_status = "resolved"
    ');
    $stmtCompleted->bindParam(':worker_no', $_SESSION['maintenance_staff']);
    $stmtCompleted->execute();
    $completedComplaints = $stmtCompleted->fetchAll(PDO::FETCH_ASSOC);
    $totalCompleted = count($completedComplaints);
} catch (PDOException $e) {
    echo 'Database query failed: ' . $e->getMessage();
    exit();
}
?>

<title>e-HRCS - Dashboard Overview</title>

<!-- App Content -->
<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Dashboard Overview</h1>
            <div class="ms-md-1 ms-0 d-flex align-items-center">

                <!-- Notification Icon -->
                <div class="dropdown">
                    <button class="btn btn-light position-relative" id="notificationDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class='bx bx-bell' style="font-size: 24px;"></i>
                        <span id="notificationCount" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger d-none">0</span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="notificationDropdown" style="width: 300px; max-height: 400px; overflow-y: auto;">
                        <li class="dropdown-header">New Complaints</li>
                        <div id="notificationList">
                            <li class="dropdown-item text-muted">No new complaints</li>
                        </div>
                    </ul>
                </div>
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

            <!-- Card for Assigned Complaints -->
            <div class="col-sm-6">
                <div class="card custom-card">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <p class="mb-2">Total Complaints Assigned (Not Resolved)</p>
                            <h4 class="mb-0 fw-semibold mb-2"><?= htmlspecialchars($totalAssigned) ?></h4>
                        </div>
                        <div>
                            <span class="avatar avatar-md bg-warning p-2">
                                <i class='bx bx-message-dots side-menu__icon'></i>
                            </span>
                        </div>
                    </div>
                    <div class="card-footer">
                        <?php if ($totalAssigned > 0): ?>
                            <ul class="list-unstyled mb-0">
                                <?php foreach ($assignedComplaints as $complaint): ?>
                                    <li>
                                        <strong>Complaint ID:</strong> <?= htmlspecialchars($complaint['complaint_id']) ?><br>
                                        <strong>Issue:</strong> <?= htmlspecialchars($complaint['complaint_issue']) ?><br>
                                        <strong>Date Assigned:</strong> <?= htmlspecialchars($complaint['date_assigned']) ?>
                                    </li>
                                    <hr>
                                <?php endforeach; ?>
                            </ul>
                        <?php else: ?>
                            <p>No complaints assigned yet.</p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>

            <!-- Card for Completed Complaints -->
            <div class="col-sm-6">
                <div class="card custom-card">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <p class="mb-2">Total Complaints Completed (Resolved)</p>
                            <h4 class="mb-0 fw-semibold mb-2"><?= htmlspecialchars($totalCompleted) ?></h4>
                        </div>
                        <div>
                            <span class="avatar avatar-md bg-success p-2">
                                <i class='bx bx-check-circle side-menu__icon'></i>
                            </span>
                        </div>
                    </div>
                    <div class="card-footer">
                        <?php if ($totalCompleted > 0): ?>
                            <ul class="list-unstyled mb-0">
                                <?php foreach ($completedComplaints as $complaint): ?>
                                    <li>
                                        <strong>Complaint ID:</strong> <?= htmlspecialchars($complaint['complaint_id']) ?><br>
                                        <strong>Issue:</strong> <?= htmlspecialchars($complaint['complaint_issue']) ?><br>
                                        <strong>Date Resolved:</strong> <?= htmlspecialchars($complaint['date_resolved']) ?>
                                    </li>
                                    <hr>
                                <?php endforeach; ?>
                            </ul>
                        <?php else: ?>
                            <p>No complaints completed yet.</p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Notification Script -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function fetchNewComplaints() {
        $.ajax({
            url: 'fetch_new_complaints.php', // PHP script to fetch new complaints
            method: 'GET',
            success: function(data) {
                const complaints = JSON.parse(data);
                const notificationCount = complaints.length;

                // Update the notification icon badge
                const notificationBadge = document.getElementById('notificationCount');
                if (notificationCount > 0) {
                    notificationBadge.textContent = notificationCount;
                    notificationBadge.classList.remove('d-none');
                } else {
                    notificationBadge.classList.add('d-none');
                }

                // Update the notification dropdown list
                const notificationList = document.getElementById('notificationList');
                notificationList.innerHTML = ''; // Clear the list
                if (notificationCount > 0) {
                    complaints.forEach(complaint => {
                        const listItem = `
                            <li class="dropdown-item">
                                <strong>${complaint.complaint_type} - ${complaint.complaint_issue}</strong>
                                <p class="text-muted mb-0" style="font-size: 0.85em;">${complaint.description}</p>
                                <small class="text-muted">${complaint.date_created}</small>
                            </li>
                        `;
                        notificationList.insertAdjacentHTML('beforeend', listItem);
                    });
                } else {
                    notificationList.innerHTML = '<li class="dropdown-item text-muted">No new complaints</li>';
                }
            },
            error: function(err) {
                console.error("Error fetching complaints:", err);
            }
        });
    }

    // Fetch new complaints every 5 seconds
    setInterval(fetchNewComplaints, 5000);

    // Initial fetch when the page loads
    fetchNewComplaints();
</script>

<?php include('includes/footer-.php'); ?>
