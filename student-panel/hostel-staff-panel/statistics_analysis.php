<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Include database connection file
include 'paandbconfig.php'; // Replace with your actual database connection file name

// Fetch total complaints
$total_complaints_query = "SELECT COUNT(*) AS total FROM Complaint";
$result_total_complaints = $conn->query($total_complaints_query);
$total_complaints = $result_total_complaints->fetch_assoc()['total'];

// Fetch resolved complaints
$resolved_complaints_query = "SELECT COUNT(*) AS resolved FROM Complaint WHERE status = 'Resolved'";
$result_resolved_complaints = $conn->query($resolved_complaints_query);
$resolved_complaints = $result_resolved_complaints->fetch_assoc()['resolved'];

// Fetch pending complaints
$pending_complaints_query = "SELECT COUNT(*) AS pending FROM Complaint WHERE status = 'Pending'";
$result_pending_complaints = $conn->query($pending_complaints_query);
$pending_complaints = $result_pending_complaints->fetch_assoc()['pending'];

// Fetch in-progress complaints
$progress_complaints_query = "SELECT COUNT(*) AS progress FROM Complaint WHERE status = 'In progress'";
$result_progress_complaints = $conn->query($progress_complaints_query);
$progress_complaints = $result_progress_complaints->fetch_assoc()['progress'];

// Complaints resolved within 24 hours
$resolved_within_24hrs_query = "SELECT COUNT(*) AS count FROM Complaint WHERE TIMESTAMPDIFF(HOUR, Date_Created, Date_Resolved) <= 24 AND status = 'Resolved'";
$result_resolved_within_24hrs = $conn->query($resolved_within_24hrs_query);
$resolved_within_24hrs = $result_resolved_within_24hrs->fetch_assoc()['count'];

// Most common complaint type
$top_complaint_type_query = "SELECT Complaint_Type, COUNT(*) AS count FROM Complaint GROUP BY Complaint_Type ORDER BY count DESC LIMIT 1";
$result_top_complaint_type = $conn->query($top_complaint_type_query);
$top_complaint_type_row = $result_top_complaint_type->fetch_assoc();
$top_complaint_type = $top_complaint_type_row['Complaint_Type'];
$top_complaint_count = $top_complaint_type_row['count'];

// Complaints filed in the current month
$current_month_complaints_query = "SELECT COUNT(*) AS count FROM Complaint WHERE MONTH(Date_Created) = MONTH(CURRENT_DATE()) AND YEAR(Date_Created) = YEAR(CURRENT_DATE())";
$result_current_month_complaints = $conn->query($current_month_complaints_query);
$current_month_complaints = $result_current_month_complaints->fetch_assoc()['count'];

// Pending complaints older than a week
$pending_older_than_week_query = "SELECT COUNT(*) AS count FROM Complaint WHERE status = 'Pending' AND TIMESTAMPDIFF(DAY, Date_Created, CURRENT_DATE()) > 7";
$result_pending_older_than_week = $conn->query($pending_older_than_week_query);
$pending_older_than_week = $result_pending_older_than_week->fetch_assoc()['count'];

// Complaints by type
$complaints_by_type_query = "SELECT Complaint_Type, COUNT(*) AS count FROM Complaint GROUP BY Complaint_Type";
$result_complaints_by_type = $conn->query($complaints_by_type_query);
$complaints_by_type = [];
while ($row = $result_complaints_by_type->fetch_assoc()) {
    $complaints_by_type[] = $row;
}
?>

<!-- HTML structure for your page -->
<?php include('includes/repairstaff_header.php'); ?>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

<?php include('includes/repairstaff_footer.php'); ?>
