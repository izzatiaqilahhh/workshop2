<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

// Check if the user is logged in
if (!isset($_SESSION['student'])) {
    header("Location: login.php");
    exit();
}

// Enable error reporting for debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Fetch student ID using matric number
try {
    $stmt = $pdo->prepare("SELECT Student_ID FROM student WHERE Matric_No = :Matric_No");
    $stmt->bindParam(':Matric_No', $_SESSION['student']);
    $stmt->execute();
    $student = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$student) {
        $_SESSION['error'] = 'Student not found.';
        header('Location: complaint-list.php');
        exit();
    }

    $student_id = $student['Student_ID'];
} catch (PDOException $e) {
    $_SESSION['error'] = 'Database error: ' . $e->getMessage();
    header('Location: complaint-list.php');
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve form data
    $complaint_type = $_POST['complaint-type'];
    $issue_type = $_POST['issue-type'];
    $description = $_POST['complaint-description'];
    $date_created = date('Y-m-d');
    $image = null;

    // Handle file upload
    if (isset($_FILES['complaint-image']) && $_FILES['complaint-image']['error'] === UPLOAD_ERR_OK) {
        $file_tmp = $_FILES['complaint-image']['tmp_name'];
        $file_type = $_FILES['complaint-image']['type'];
        $file_size = $_FILES['complaint-image']['size'];

        // Validate file type and size (e.g., max 5MB)
        if (in_array($file_type, ['image/jpeg', 'image/png', 'image/gif']) && $file_size <= 5 * 1024 * 1024) {
            $image = file_get_contents($file_tmp);
        } else {
            $_SESSION['error'] = 'Invalid file type or size.';
            header('Location: complaint-list.php');
            exit();
        }
    }

    // Insert the new complaint into the database
    try {
        $pdo->beginTransaction();

        // Insert into Complaint table
        $stmt = $pdo->prepare("INSERT INTO Complaint (Complaint_Type, Complaint_Issue, Description, Image, Date_Created, Student_ID, Room_ID) VALUES (:Complaint_Type, :Complaint_Issue, :Description, :Image, :Date_Created, :Student_ID, :Room_ID)");
        $stmt->bindParam(':Complaint_Type', $complaint_type);
        $stmt->bindParam(':Complaint_Issue', $issue_type);
        $stmt->bindParam(':Description', $description);
        $stmt->bindParam(':Image', $image, PDO::PARAM_LOB);
        $stmt->bindParam(':Date_Created', $date_created);
        $stmt->bindParam(':Student_ID', $student_id);
        $stmt->bindParam(':Room_ID', $student_id); // Assuming Room_ID is same as Student_ID for simplicity
        $stmt->execute();

        // Get the last inserted Complaint_ID
        $complaint_id = $pdo->lastInsertId();

        // Insert initial status into Complaint_Status table
        $stmt = $pdo->prepare("INSERT INTO Complaint_Status (Complaint_Status, Description, Complaint_ID) VALUES ('Pending', '', :Complaint_ID)");
        $stmt->bindParam(':Complaint_ID', $complaint_id);
        $stmt->execute();

        $pdo->commit();

        $_SESSION['success'] = 'Complaint submitted successfully.';
        header('Location: complaint-list.php');
        exit();
    } catch (PDOException $e) {
        $pdo->rollBack();
        $_SESSION['error'] = 'Database error: ' . $e->getMessage();
        header('Location: complaint-list.php');
        exit();
    }
} else {
    $_SESSION['error'] = 'Invalid request method.';
    header('Location: complaint-list.php');
    exit();
}
?>