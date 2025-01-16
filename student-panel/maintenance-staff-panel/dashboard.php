<?php include('includes/header-.php');

include 'teahdbconfig.php';  ?> 
<title>e-HRCS - Dashboard</title>

<!-- App Content -->
<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Dashboard</h1>
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

            <!-- Card 1 -->
            <div class="col-sm-12">
                <div class="card custom-card">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <p class="mb-2">Total Complaint</p>
                            <h4 class="mb-0 fw-semibold mb-2"></h4>
                        </div>
                        <div>
                            <span class="avatar avatar-md bg-warning p-2">
                                <i class='bx bx-message-dots side-menu__icon'></i>
                            </span>
                        </div>
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
                                <strong>${complaint.title}</strong>
                                <p class="text-muted mb-0" style="font-size: 0.85em;">${complaint.description}</p>
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