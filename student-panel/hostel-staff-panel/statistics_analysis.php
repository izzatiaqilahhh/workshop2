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
        <!-- Start::Statistics Row -->
<div class="row mb-4">
    <div class="col-md-3">
        <div class="card text-center">
            <div class="card-body" style="background-color: #b3cde3; color: #fff;">
                <h5>Total Complaints</h5>
                <h2><?php echo $total_complaints; ?></h2>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card text-center">
            <div class="card-body" style="background-color: #ccebc5; color: #fff;">
                <h5>Resolved Complaints</h5>
                <h2><?php echo $resolved_complaints; ?></h2>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card text-center">
            <div class="card-body" style="background-color: #fbb4ae; color: #fff;">
                <h5>Pending Complaints</h5>
                <h2><?php echo $pending_complaints; ?></h2>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card text-center">
            <div class="card-body" style="background-color: #fed9a6; color: #fff;">
                <h5>In Progress Complaints</h5>
                <h2><?php echo $progress_complaints; ?></h2>
            </div>
        </div>
    </div>
</div>


        <!-- Complaints by Category Table -->
        <div class="row mb-4">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Complaints by Category</h5>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Category</th>
                                    <th>Number of Complaints</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($complaints_by_type as $complaint) { ?>
                                    <tr>
                                        <td><?php echo $complaint['Complaint_Type']; ?></td>
                                        <td><?php echo $complaint['count']; ?></td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Complaints by Category Pie Chart -->
        <div class="row mb-4">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Complaints by Category (Pie Chart)</h5>
                        <canvas id="complaintsChart" style="max-width: 500px; max-height: 500px; margin: auto;"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Prepare data for the chart
            const complaintLabels = <?php echo json_encode(array_column($complaints_by_type, 'Complaint_Type')); ?>;
            const complaintCounts = <?php echo json_encode(array_column($complaints_by_type, 'count')); ?>;

            // Render the pie chart using Chart.js
            const ctx = document.getElementById('complaintsChart').getContext('2d');
            const complaintsChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: complaintLabels,
                    datasets: [{
                        data: complaintCounts,
                        backgroundColor: [
                            '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40'
                        ],
                        hoverBackgroundColor: [
                            '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40'
                        ]
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    let value = context.raw;
                                    let label = context.label || '';
                                    return `${label}: ${value} complaints`;
                                }
                            }
                        }
                    }
                }
            });
        </script>
    </div>
</div>

<?php include('includes/footer-.php'); ?>
