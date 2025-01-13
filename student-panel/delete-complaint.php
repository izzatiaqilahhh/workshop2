<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

// Check if the user is logged in
if (!isset($_SESSION['student'])) {
    header("Location: login.php");
    exit();
}

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

if (isset($_GET['complaint_id'])) {
    $complaint_id = $_GET['complaint_id'];

    try {
        // Start a transaction
        $pdo->beginTransaction();

        // Delete related entries from Complaint_Status
        $stmt = $pdo->prepare("DELETE FROM Complaint_Status WHERE Complaint_ID = :Complaint_ID");
        $stmt->bindParam(':Complaint_ID', $complaint_id);
        $stmt->execute();

        // Delete the complaint
        $stmt = $pdo->prepare("DELETE FROM Complaint WHERE Complaint_ID = :Complaint_ID AND Student_ID = :Student_ID");
        $stmt->bindParam(':Complaint_ID', $complaint_id);
        $stmt->bindParam(':Student_ID', $student_id);
        $stmt->execute();

        // Commit the transaction
        $pdo->commit();

        $_SESSION['success'] = 'Complaint deleted successfully.';
        header('Location: complaint-list.php');
        exit();
    } catch (PDOException $e) {
        // Rollback the transaction on error
        $pdo->rollBack();
        $_SESSION['error'] = 'Database error: ' . $e->getMessage();
        header('Location: complaint-list.php');
        exit();
    }
} else {
    $_SESSION['error'] = 'Invalid request.';
    header('Location: complaint-list.php');
    exit();
}
?>