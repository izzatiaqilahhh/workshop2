<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

// Function to sanitize input data
function sanitizeInput($data) {
    return htmlspecialchars(stripslashes(trim($data)));
}

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $studentId = $_SESSION['student']; // Assuming student ID is stored in session
    $complaintType = sanitizeInput($_POST['complaint-type']);
    $issueType = sanitizeInput($_POST['issue-type']);
    $description = sanitizeInput($_POST['complaint-description']);
    $dateCreated = date('Y-m-d'); // Current date
    $status = 'Pending'; // Default status

    // Handle file upload
    $imagePath = null;
    if (!empty($_FILES['complaint-image']['name'])) {
        $targetDir = "uploads/";
        $fileName = basename($_FILES["complaint-image"]["name"]);
        $targetFilePath = $targetDir . $fileName;
        $fileType = pathinfo($targetFilePath, PATHINFO_EXTENSION);

        // Allow certain file formats
        $allowedTypes = array('jpg', 'png', 'jpeg', 'gif');
        if (in_array($fileType, $allowedTypes)) {
            // Upload file to server
            if (move_uploaded_file($_FILES["complaint-image"]["tmp_name"], $targetFilePath)) {
                $imagePath = $targetFilePath;
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
        $stmt = $pdo->prepare("INSERT INTO Complaint (Complaint_Type, Complaint_Issue, Description, Image, Status, Date_Created, Student_ID, Room_ID) VALUES (:Complaint_Type, :Complaint_Issue, :Description, :Image, :Status, :Date_Created, :Student_ID, :Room_ID)");
        $stmt->bindParam(':Complaint_Type', $complaintType);
        $stmt->bindParam(':Complaint_Issue', $issueType);
        $stmt->bindParam(':Description', $description);
        $stmt->bindParam(':Image', $imagePath, PDO::PARAM_LOB);
        $stmt->bindParam(':Status', $status);
        $stmt->bindParam(':Date_Created', $dateCreated);
        $stmt->bindParam(':Student_ID', $studentId);
        $stmt->bindParam(':Room_ID', $_SESSION['room_id']); // Assuming room ID is stored in session
        $stmt->execute();

        $_SESSION['success'] = 'Complaint submitted successfully!';
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