<?php 
include('includes/header-.php'); // Include the header file
include('paandbconfig.php');     // Include the database configuration file

// Fetch data from the Complaint_Status table
$query = "  SELECT CS.*, C.Complaint_Type, W.Name, M.Company_Name
            FROM Complaint_Status CS
            JOIN Complaint C
            ON CS.Complaint_ID = C.Complaint_ID
            JOIN Complaint_Assignment CA
            ON C.Complaint_ID = CA.Complaint_Id
            JOIN Maintenance_Worker W
            ON CA.Worker_Id = W.Worker_Id
            JOIN Maintenance_Company M
            ON W.Company_Id = M.Company_Id; ";
$result = mysqli_query($conn, $query); // Assuming $conn is your database connection variable
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
                        <th>Status ID</th>
                        <th>Complaint ID</th>
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
                    if (mysqli_num_rows($result) > 0) {
                        $counter = 1; // Initialize row counter
                        while ($row = mysqli_fetch_assoc($result)) {
                            $statusClass = '';
                            if (strcasecmp($row['Complaint_Status'], 'In Progress') === 0) {
                                $statusClass = 'text-warning fw-bold'; // Highlight with yellow color
                            } elseif (strcasecmp($row['Complaint_Status'], 'Resolved') === 0) {
                                $statusClass = 'text-success fw-bold'; // Highlight with green color
                            }   
                            echo "<tr>";
                            echo "<td>" . $counter . "</td>";
                            echo "<td>" . htmlspecialchars($row['Status_ID']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['Complaint_ID']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['Complaint_Type']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['Name']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['Company_Name']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['Description']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['Date_Update_Status']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['Complaint_Status']) . "</td>";
                           "    </tr>";
                            $counter++;
                        }
                    } else {
                        echo "<tr><td colspan='7' class='text-center'>No records found</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<?php 
include('includes/footer-.php'); // Include the footer file
?>
