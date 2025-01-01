<?php
include 'paandbconfig.php';

if (isset($_POST['action']) && $_POST['action'] == 'fetch_student') {
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
} else {
    echo json_encode(['error' => 'Invalid action']);
}
?>
