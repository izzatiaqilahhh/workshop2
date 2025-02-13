<?php
include('paandbconfig.php');
include('includes/header-.php');

// Fetch data from the Complaint_Status table using MySQLi
$query = "
    SELECT cs.*, c.complaint_type, r.room_no, w.name, m.company_name
    FROM complaint_status cs
    JOIN complaint c ON cs.complaint_id = c.complaint_id
    JOIN room r ON c.room_id = r.room_id
    JOIN complaint_assignment ca ON c.complaint_id = ca.complaint_id
    JOIN maintenance_worker w ON ca.worker_id = w.worker_id
    JOIN maintenance_company m ON w.company_id = m.company_id;
";

try {
    $result = $mysqli->query($query); // Using MySQLi query
} catch (mysqli_sql_exception $e) {
    echo 'Query failed: ' . $e->getMessage();
    exit;
}
?>

<title>e-HRCS - Assigned Complaint Management</title>

<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Assigned Complaint Management</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="assigned-complaint.php">Assigned Complaint Management</a></li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Table -->
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Room Number</th>
                        <th>Complaint Type</th>
                        <th>Assigned To</th>
                        <th>Company</th>
                        <th>Description</th>
                        <th>Date Update Status</th>
                        <th>Complaint Status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Check if there are records
                    if ($result->num_rows > 0) {
                        $counter = 1; // Initialize row counter
                        while ($row = $result->fetch_assoc()) {
                            $statusClass = '';
                            if (strcasecmp($row['complaint_status'], 'In Progress') === 0) {
                                $statusClass = 'text-warning fw-bold'; // Highlight with yellow color
                            } elseif (strcasecmp($row['complaint_status'], 'Resolved') === 0) {
                                $statusClass = 'text-success fw-bold'; // Highlight with green color
                            }
                            echo "<tr>";
                            echo "<td>" . $counter . "</td>";
                            echo "<td>" . htmlspecialchars($row['room_no']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['complaint_type']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['name']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['company_name']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['description']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['date_update_status']) . "</td>";
                            echo "<td class='" . $statusClass . "'>" . htmlspecialchars($row['complaint_status']) . "</td>";
                            echo "</tr>";
                            $counter++;
                        }
                    } else {
                        echo "<tr><td colspan='8' class='text-center'>No records found</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        let table = new DataTable('.table', {
            dom: 'Bfrtip', // To specify where the buttons should be placed
            buttons: [ 
                {
                    extend: 'excelHtml5', // Export to Excel
                    title: 'Data Export'
                },
                {
                    extend: 'pdfHtml5', // Export to PDF
                    title: 'Data Export'
                },
                {
                    extend: 'print', // Print data
                    title: 'Data Export'
                }
            ]
        });
    });
</script>

<?php
include('includes/footer-.php'); // Include the footer file
?>
