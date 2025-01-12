<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

// Check if the user is logged in
if (!isset($_SESSION['student'])) {
    header("Location: login.php");
    exit();
}

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        // Fetch student ID using the matric number stored in the session
        $stmt = $pdo->prepare("SELECT Student_ID FROM student WHERE Matric_No = :Matric_No");
        $stmt->bindParam(':Matric_No', $_SESSION['student']);
        $stmt->execute();
        $student = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$student) {
            throw new Exception("Student not found. Please ensure you are logged in correctly.");
        }

        $student_id = $student['Student_ID'];

        // Retrieve form inputs
        $complaint_type = $_POST['complaint-type'];
        $issue_type = $_POST['issue-type'];
        $description = $_POST['complaint-description'];
        $image = null;

        // Handle image upload
        if (!empty($_FILES['complaint-image']['name'])) {
            $image_name = $_FILES['complaint-image']['name'];
            $image_tmp_name = $_FILES['complaint-image']['tmp_name'];
            $image_size = $_FILES['complaint-image']['size'];
            $image_error = $_FILES['complaint-image']['error'];
            $upload_dir = 'uploads/complaints/';

            // Check for upload errors
            if ($image_error !== 0) {
                throw new Exception("Error uploading the image.");
            }

            // Validate image size (e.g., max 2MB)
            if ($image_size > 2 * 1024 * 1024) {
                throw new Exception("Image size exceeds 2MB limit.");
            }

            // Generate a unique filename and move the file to the upload directory
            $image_ext = pathinfo($image_name, PATHINFO_EXTENSION);
            $allowed_extensions = ['jpg', 'jpeg', 'png', 'gif'];
            if (!in_array(strtolower($image_ext), $allowed_extensions)) {
                throw new Exception("Invalid image format. Allowed formats: JPG, JPEG, PNG, GIF.");
            }

            $unique_image_name = uniqid('complaint_', true) . '.' . $image_ext;
            $image_path = $upload_dir . $unique_image_name;

            if (!move_uploaded_file($image_tmp_name, $image_path)) {
                throw new Exception("Failed to upload the image.");
            }

            $image = $image_path;
        }

        // Insert the complaint into the database
        $stmt = $pdo->prepare("
            INSERT INTO Complaint (Student_ID, Complaint_Type, Complaint_Issue, Description, Image, Date_Created, Status)
            VALUES (:Student_ID, :Complaint_Type, :Complaint_Issue, :Description, :Image, NOW(), 'Pending')
        ");
        $stmt->bindParam(':Student_ID', $student_id);
        $stmt->bindParam(':Complaint_Type', $complaint_type);
        $stmt->bindParam(':Complaint_Issue', $issue_type);
        $stmt->bindParam(':Description', $description);
        $stmt->bindParam(':Image', $image);

        if ($stmt->execute()) {
            $_SESSION['success'] = "Complaint submitted successfully.";
        } else {
            throw new Exception("Failed to submit the complaint.");
        }
    } catch (Exception $e) {
        $_SESSION['error'] = $e->getMessage();
    }

    // Redirect back to the complaint list page
    header("Location: complaint-list.php");
    exit();
} else {
    $_SESSION['error'] = "Invalid request.";
    header("Location: complaint-list.php");
    exit();
}
?>
