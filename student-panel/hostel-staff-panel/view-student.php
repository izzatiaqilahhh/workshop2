<?php
include 'qiladbcon.php';
include 'includes/header-.php';

if (isset($_POST['action']) && $_POST['action'] == 'fetch_student') {

    // Fetch student details based on Student_ID
    if (isset($_POST['id'])) {
        $studentId = $_POST['id'];
        $query = "SELECT * FROM Student WHERE Student_ID = $1";
        $result = pg_query_params($connection, $query, array($studentId));

        if ($result && pg_num_rows($result) > 0) {
            $student = pg_fetch_assoc($result);
            echo json_encode($student);
        } else {
            echo json_encode(['error' => 'No student found.']);
        }
        exit;
    }
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
                <h1 class="page-title">Student List</h1>
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
                            <th>Room No</th>
                            <th>Course</th>
                            <th>Faculty</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        $query = 'SELECT S.*, R."Room_No" 
                        FROM "Student" S
                        JOIN "Room" R ON S."Room_ID" = R."Room_ID"';
                        $result = pg_query($connection, $query);

                        if ($result) {
                            while ($row = pg_fetch_assoc($result)) {
                                echo "<tr>
                                    <td>{$row['Student_ID']}</td>
                                    <td>{$row['Matric_No']}</td>
                                    <td>{$row['Name']}</td>
                                    <td>{$row['Phone_No']}</td>
                                    <td>{$row['Email']}</td>
                                    <td>{$row['Room_No']}</td>
                                    <td>{$row['Course']}</td>
                                    <td>{$row['Faculty']}</td>
                                </tr>";
                            }
                        } else {
                            echo "<tr><td colspan='8' class='text-center'>No students found.</td></tr>";
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