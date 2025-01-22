<?php

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'qiladbcon.php';

// Fetch total complaints
$total_complaints_query = "SELECT COUNT(*) AS total FROM complaint";
$result_total_complaints = $pdo->query($total_complaints_query);
$total_complaints = $result_total_complaints->fetch(PDO::FETCH_ASSOC)['total'];

// Fetch resolved complaints
$resolved_complaints_query = "
    SELECT COUNT(*) AS resolved 
    FROM complaint_status cs
    JOIN complaint c
    ON cs.complaint_id = c.complaint_id
    WHERE cs.complaint_status = 'Resolved'
    AND c.date_resolved IS NOT NULL";
$result_resolved_complaints = $pdo->query($resolved_complaints_query);
$resolved_complaints = $result_resolved_complaints->fetch(PDO::FETCH_ASSOC)['resolved'];

// Fetch assigned complaints
$pending_complaints_query = "
    SELECT COUNT(*) AS assigned
    FROM complaint_status cs
    JOIN complaint c
    ON cs.complaint_id = c.complaint_id
    WHERE cs.complaint_status = 'Assigned'
    AND c.date_resolved IS NULL";
$result_pending_complaints = $pdo->query($pending_complaints_query);
$pending_complaints = $result_pending_complaints->fetch(PDO::FETCH_ASSOC)['assigned'];

// Fetch in-progress complaints
$progress_complaints_query = "
    SELECT COUNT(*) AS progress 
    FROM complaint_status cs
    JOIN complaint c
    ON cs.complaint_id = c.complaint_id
    WHERE cs.complaint_status = 'In progress'
    AND c.date_resolved IS NULL";
$result_progress_complaints = $pdo->query($progress_complaints_query);
$progress_complaints = $result_progress_complaints->fetch(PDO::FETCH_ASSOC)['progress'];

// Complaints resolved within 24 hours
$resolved_within_24hrs_query = "
    SELECT COUNT(*) AS count 
    FROM complaint c 
    JOIN complaint_status cs ON c.complaint_id = cs.complaint_id 
    WHERE EXTRACT(EPOCH FROM (cs.date_update_status - c.date_created))/3600 <= 24 
    AND cs.complaint_status = 'Resolved'";
$result_resolved_within_24hrs = $pdo->query($resolved_within_24hrs_query);
$resolved_within_24hrs = $result_resolved_within_24hrs->fetch(PDO::FETCH_ASSOC)['count'];

// Most common complaint type
$top_complaint_type_query = "
    SELECT complaint_type, COUNT(*) AS count 
    FROM complaint 
    GROUP BY complaint_type 
    ORDER BY count DESC 
    LIMIT 1";
$result_top_complaint_type = $pdo->query($top_complaint_type_query);
$top_complaint_type_row = $result_top_complaint_type->fetch(PDO::FETCH_ASSOC);
$top_complaint_type = $top_complaint_type_row['complaint_type'];
$top_complaint_count = $top_complaint_type_row['count'];

// Complaints filed in the current month
$current_month_complaints_query = "
    SELECT COUNT(*) AS count 
    FROM complaint 
    WHERE EXTRACT(MONTH FROM date_created) = EXTRACT(MONTH FROM CURRENT_DATE) 
    AND EXTRACT(YEAR FROM date_created) = EXTRACT(YEAR FROM CURRENT_DATE)";
$result_current_month_complaints = $pdo->query($current_month_complaints_query);
$current_month_complaints = $result_current_month_complaints->fetch(PDO::FETCH_ASSOC)['count'];

// Pending complaints older than a week
$pending_older_than_week_query = "
    SELECT COUNT(*) AS count 
    FROM complaint c
    JOIN complaint_status cs ON c.complaint_id = cs.complaint_id
    WHERE cs.complaint_status = 'Pending' 
    AND AGE(CURRENT_DATE, c.date_created) > INTERVAL '7 days'";
$result_pending_older_than_week = $pdo->query($pending_older_than_week_query);
$pending_older_than_week = $result_pending_older_than_week->fetch(PDO::FETCH_ASSOC)['count'];

// Complaints by type
$complaints_by_type_query = "
    SELECT complaint_type, COUNT(*) AS count 
    FROM complaint 
    GROUP BY complaint_type";
$result_complaints_by_type = $pdo->query($complaints_by_type_query);
$complaints_by_type = [];
while ($row = $result_complaints_by_type->fetch(PDO::FETCH_ASSOC)) {
    $complaints_by_type[] = $row;
}
?>

<!-- HTML structure for your page -->
<?php include('includes/header-.php'); ?>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<title>e-HRCS - Statistics and Analysis</title>

<div class="main-content app-content">
    <div class="container">
        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Statistics and Analysis</h1>
        </div>
        <!-- Page Header Close -->

        <!-- Row 1 -->
        <div class="row print">
            <div class="d-flex justify-content-end my-3 hidden-print">
                <button class="btn btn-primary btn-sm text-center me-2" onclick="printPage()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" style="fill: rgba(255, 255, 255, 1);">
                        <path d="M19 7h-1V2H6v5H5c-1.654 0-3 1.346-3 3v7c0 1.103.897 2 2 2h2v3h12v-3h2c1.103 0 2-.897 2-2v-7c0-1.654-1.346-3-3-3zM8 4h8v3H8V4zm8 16H8v-4h8v4zm4-3h-2v-3H6v3H4v-7c0-.551.449-1 1-1h14c.552 0 1 .449 1 1v7z"></path>
                        <path d="M14 10h4v2h-4z"></path>
                    </svg>
                    Print
                </button>
                <form method="POST" action="recover.php" class="d-inline-block">
                    <button type="submit" class="btn btn-warning btn-sm text-center">
                        <i class="bx bx-refresh side-menu__icon"></i> Recover Database
                    </button>
                </form>
            </div>
        </div>

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
                        <h5>Assigned Complaints</h5>
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
                                        <td><?php echo $complaint['complaint_type']; ?></td>
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
    </div>

    <script>
        // Prepare data for the chart
        const complaintLabels = <?php echo json_encode(array_column($complaints_by_type, 'complaint_type')); ?>;
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

    <!-- Complaints Resolved within 24 hours -->
    <div class="row mb-4">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Complaints Resolved within 24 Hours</h5>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Category</th>
                                <th>Number of Complaints</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $resolved_within_24hrs_query = "
                                SELECT C.complaint_type, COUNT(*) AS count
                                FROM complaint C
                                JOIN complaint_status CS
                                ON C.complaint_id = CS.complaint_id
                                WHERE EXTRACT(EPOCH FROM (CS.date_update_status - C.date_created))/3600 <= 24
                                AND CS.complaint_status = 'Resolved'
                                GROUP BY C.complaint_type
                            ";
                            $result_resolved_within_24hrs = $pdo->query($resolved_within_24hrs_query);

                            // Display resolved complaints by category
                            while ($row = $result_resolved_within_24hrs->fetch(PDO::FETCH_ASSOC)) {
                                echo "<tr>
                                        <td>{$row['complaint_type']}</td>
                                        <td>{$row['count']}</td>
                                      </tr>";
                            }

                            // Calculate total resolved complaints
                            $total_resolved_query = "
                                SELECT COUNT(*) AS total
                                FROM complaint C
                                JOIN complaint_status CS
                                ON C.complaint_id = CS.complaint_id
                                WHERE EXTRACT(EPOCH FROM (CS.date_update_status - C.date_created))/3600 <= 24
                                AND CS.complaint_status = 'Resolved'
                            ";
                            $total_resolved_result = $pdo->query($total_resolved_query);
                            $total_resolved = $total_resolved_result->fetch(PDO::FETCH_ASSOC)['total'];
                            ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td><strong>Total Complaints Resolved within 24 Hours</strong></td>
                                <td><strong><?php echo $total_resolved; ?></strong></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Trend Analysis Section -->
    <div class="row mb-4">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Trend Analysis: Complaints Over Time</h5>
                    <canvas id="trendChart" style="max-width: 100%; height: 400px;"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript to Render the Trend Chart -->
<script>
    // Fetch trend data and render the chart
    fetch('fetchtrenddata.php')
        .then(response => response.json())
        .then(data => {
            const ctx = document.getElementById('trendChart').getContext('2d');
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: data.dates,
                    datasets: [{
                        label: 'Number of Complaints',
                        data: data.counts,
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 2,
                        fill: false
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Date'
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Number of Complaints'
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    return `Complaints: ${context.raw}`;
                                }
                            }
                        }
                    }
                }
            });
        })
        .catch(error => console.error('Error fetching trend data:', error));
</script>

<!-- Print Page JavaScript Function -->
<script>
    function printPage() {
        window.print();
    }
</script>

<?php include('includes/footer-.php'); ?>