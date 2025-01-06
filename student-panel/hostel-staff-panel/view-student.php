<?php
include 'qiladbcon.php';
include 'includes/header-.php';

if (isset($_POST['action']) && $_POST['action'] == 'fetch_student') {

    // Fetch student details based on Student_ID
    if (isset($_POST['id'])) {
        $studentId = $_POST['id'];
        $query = "SELECT * FROM Student WHERE Student_ID= ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("i", $studentId);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $student = $result->fetch_assoc();
            echo json_encode($student);
        } else {
            echo json_encode(['error' => 'No student found.']);
        }
        $stmt->close();
        $conn->close();
    }
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>e-HRCS - Student Management</title>
</head>

<body>

    <!-- Start::app-content -->
    <div class="main-content app-content">
        <div class="container">
            <div class="d-md-flex d-block align-items-center justify-content-between mb-2 my-4 page-header-breadcrumb">
                <h1 class="page-title fw-semibold fs-22 mb-0">Student Management</h1>
                <div class="ms-md-1 ms-0">
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="view-student.php">Student Management</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="row mb-4">
                <table class="table table-bordered display">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Matric Number</th>
                            <th>Student Name</th>
                            <th>Phone Number</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        $no = 1; // Initialize the counter
                        $query = 'SELECT * FROM "Student"'; // Use double quotes if the table name is case-sensitive
                        $result = pg_query($connection, $query);

                        if ($result) {
                            while ($row = pg_fetch_assoc($result)) {
                                echo "<tr>
                            <td>{$no}</td>
                            <td>{$row['Matric_No']}</td>
                            <td>{$row['Name']}</td>
                            <td>{$row['Phone_No']}</td>
                            <td>
                            <button class='btn btn-primary btn-view' data-bs-toggle='modal' data-bs-target='#viewstudentdetails' data-id='{$row['Student_ID']}'>View</button>
                            </td>
                            </tr>";
                                $no++; // Increment the counter
                            }
                        } else {
                            echo "<tr><td colspan='5'>No students found.</td></tr>";
                        }
                        ?>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modal: View Student Details -->
    <div class="modal fade" id="viewstudentdetails" tabindex="-1" aria-labelledby="viewstudentdetailsLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Student Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label>Faculty</label>
                                <input type="text" class="form-control" id="Faculty" readonly>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Course</label>
                                <input type="text" class="form-control" id="Course" readonly>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Year of Study</label>
                                <input type="text" class="form-control" id="Year_Of_Study" readonly>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Gender</label>
                                <input type="text" class="form-control" id="Gender" readonly>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Room Number</label>
                                <input type="text" class="form-control" id="Room_ID" readonly>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <?php
    include 'includes/footer-.php';
    ?>

</body>

</html>