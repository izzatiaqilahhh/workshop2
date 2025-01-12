<?php

include 'qiladbcon.php';
include 'includes/header-.php';

// Check if the 'fetch_student' action is triggered
if (isset($_POST['action']) && $_POST['action'] == 'fetch_student') {

    // Fetch student details based on Student_ID
    if (isset($_POST['id'])) {
        $studentId = $_POST['id'];

        // Prepare and execute the query
        $query = "SELECT * FROM student WHERE student_id = $1";
        $result = pg_query_params($conn, $query, array($studentId));

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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                            <th>Student Email</th>
                            <th>Phone Number</th>
                            <th>Room Number</th>
                            <th>Course</th>
                            <th>Faculty</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // SQL query to fetch student details with room number
                        $query = "
                            SELECT s.student_id, s.matric_no, s.name, s.phone_no, s.email, s.course, s.faculty, r.room_no
                            FROM student s
                            JOIN room r ON s.room_id = r.room_id
                        ";
                        $result = pg_query($connection, $query);

                        if ($result && pg_num_rows($result) > 0) {
                            $counter = 1; // Initialize counter
                            while ($row = pg_fetch_assoc($result)) {
                                // Display each student's data with the counter
                                echo "<tr>
                                    <td>{$counter}</td> <!-- Display row number -->
                                    <td>{$row['matric_no']}</td>
                                    <td>{$row['name']}</td>
                                    <td>{$row['email']}</td>
                                    <td>{$row['phone_no']}</td>
                                    <td>{$row['room_no']}</td>
                                    <td>{$row['course']}</td>
                                    <td>{$row['faculty']}</td>
                                </tr>";
                                $counter++; // Increment counter for next row
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