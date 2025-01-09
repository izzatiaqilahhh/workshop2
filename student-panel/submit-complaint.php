<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

// Enable error reporting
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Function to sanitize input data
function sanitizeInput($data) {
    return htmlspecialchars(stripslashes(trim($data)));
}

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if session variables are set
    if (!isset($_SESSION['student']) || !isset($_SESSION['room_id'])) {
        $_SESSION['error'] = "Session variables not set.";
        header("Location: complaint-list.php");
        exit();
    }

    $student_id = $_SESSION['student']; // Assuming student ID is stored in session
    $room_id = $_SESSION['room_id']; // Assuming room ID is stored in session
    $complaint_type = sanitizeInput($_POST['complaint-type']);
    $issue_type = sanitizeInput($_POST['issue-type']);
    $description = sanitizeInput($_POST['complaint-description']);
    $date_created = date('Y-m-d'); // Current date
    $status = 'Pending'; // Default status

    // Handle file upload
    $image_path = null;
    if (!empty($_FILES['complaint-image']['name'])) {
        $target_dir = "uploads/";
        $file_name = basename($_FILES["complaint-image"]["name"]);
        $target_file_path = $target_dir . $file_name;
        $file_type = pathinfo($target_file_path, PATHINFO_EXTENSION);

        // Allow certain file formats
        $allowed_types = array('jpg', 'png', 'jpeg', 'gif');
        if (in_array($file_type, $allowed_types)) {
            // Upload file to server
            if (move_uploaded_file($_FILES["complaint-image"]["tmp_name"], $target_file_path)) {
                $image_path = $target_file_path;
            } else {
                $_SESSION['error'] = "Sorry, there was an error uploading your file.";
                header("Location: complaint-list.php");
                exit();
            }
        } else {
            $_SESSION['error'] = "Sorry, only JPG, JPEG, PNG, & GIF files are allowed.";
            header("Location: complaint-list.php");
            exit();
        }
    }

    // Insert complaint into the database
    try {
        $stmt = $pdo->prepare("INSERT INTO Complaint (Complaint_Type, Complaint_Issue, Description, Image, Status, Date_Created, Student_ID, Room_ID) VALUES (:complaint_type, :complaint_issue, :description, :image, :status, :date_created, :student_id, :room_id)");
        $stmt->bindParam(':complaint_type', $complaint_type);
        $stmt->bindParam(':complaint_issue', $issue_type);
        $stmt->bindParam(':description', $description);
        $stmt->bindParam(':image', $image_path, PDO::PARAM_LOB);
        $stmt->bindParam(':status', $status);
        $stmt->bindParam(':date_created', $date_created);
        $stmt->bindParam(':student_id', $student_id);
        $stmt->bindParam(':room_id', $room_id);
        
        // Execute the query and check if it was successful
        if ($stmt->execute()) {
            $_SESSION['success'] = 'Complaint submitted successfully!';
        } else {
            $_SESSION['error'] = 'Failed to submit complaint.';
        }

        header("Location: complaint-list.php");
        exit();
    } catch (PDOException $e) {
        $_SESSION['error'] = 'Database error: ' . $e->getMessage();
        header("Location: complaint-list.php");
        exit();
    }
} else {
    // Redirect to complaint list page if form is not submitted
    header("Location: complaint-list.php");
    exit();
}
?>