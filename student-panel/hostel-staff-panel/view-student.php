<?php
include 'paandbconfig.php';
include 'includes/header-.php';

if (isset($_POST['action']) && $_POST['action'] == 'fetch_student') {

    // Fetch student details based on Student_ID
    if (isset($_POST['id'])) {
        $studentId = $_POST['id'];
        $query = "SELECT * FROM Student WHERE Student_ID = ?";
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
                <h1 class="page-title fw-semibold fs-22 mb-0">Student List</h1>
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
                            <th>Student Email</th>
                            <th>Course</th>
                            <th>Faculty</th>
                           
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        $query = "SELECT * FROM Student"; // Standard SQL for MySQL or MariaDB
                        $result = mysqli_query($conn, $query);

                        if ($result) {
                            while ($row = mysqli_fetch_assoc($result)) {
                                echo "<tr>
                            <td>{$row['Student_ID']}</td>
                            <td>{$row['Matric_No']}</td>
                            <td>{$row['Name']}</td>
                            <td>{$row['Phone_No']}</td>
                            <td>{$row['Email']}</td>
                            <td>{$row['Course']}</td>
                            <td>{$row['Faculty']}</td>
                            </tr>";
                            }
                        } else {
                            echo "<tr><td colspan='7'>No students found.</td></tr>";
                        }
                        ?>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <?php
    include 'includes/footer-.php';
    ?>

</body>

</html>
