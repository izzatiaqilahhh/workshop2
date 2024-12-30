<?php include('includes/header-.php'); ?>

<title>E-Hostel Room Complaint System - Statistics and Analysis</title>

<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Statistics and Analysis</h1>
        </div>
        <!-- Page Header Close -->

        <!-- Start::Statistics Row -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h5>Total Complaints</h5>
                        <h2><?php echo $total_complaints; ?></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h5>Resolved Complaints</h5>
                        <h2><?php echo $resolved_complaints; ?></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h5>Pending Complaints</h5>
                        <h2><?php echo $pending_complaints; ?></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h5>Average Resolution Time</h5>
                        <h2><?php echo $avg_resolution_time; ?> hrs</h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- End::Statistics Row -->

        <!-- Start::Charts Row -->
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Complaints by Type</h5>
                        <canvas id="complaintTypeChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Monthly Complaint Trends</h5>
                        <canvas id="monthlyTrendChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <!-- End::Charts Row -->

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Complaints by Type Chart
    const complaintTypeCtx = document.getElementById('complaintTypeChart').getContext('2d');
    const complaintTypeChart = new Chart(complaintTypeCtx, {
        type: 'doughnut',
        data: {
            labels: ['Plumbing', 'Electrical', 'Security', 'Other'],
            datasets: [{
                label: 'Complaint Types',
                data: <?php echo json_encode($complaint_type_data); ?>,
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4CAF50']
            }]
        }
    });

    // Monthly Complaint Trends Chart
    const monthlyTrendCtx = document.getElementById('monthlyTrendChart').getContext('2d');
    const monthlyTrendChart = new Chart(monthlyTrendCtx, {
        type: 'line',
        data: {
            labels: <?php echo json_encode($months); ?>,
            datasets: [{
                label: 'Complaints',
                data: <?php echo json_encode($monthly_trend_data); ?>,
                borderColor: '#36A2EB',
                fill: false
            }]
        }
    });
</script>

<?php include('includes/footer-.php'); ?>
