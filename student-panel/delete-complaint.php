<?php
session_start();
include('teahdbconfig.php'); // Include MariaDB config for student verification
include('paanconn.php'); // Include MySQL config for complaint handling


// Check if the user is logged in
if (!isset($_SESSION['student'])) {
    header("Location: studentLogin.php");
    exit();
}

// Fetch student ID using matric number from MariaDB
try {
    $stmt = $pdo->prepare("SELECT student_id FROM student WHERE matric_no = :matric_no");
    $stmt->bindParam(':matric_no', $_SESSION['student']);
    $stmt->execute();
    $student = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$student) {
        $_SESSION['error'] = 'Student not found.';
        header('Location: complaint-list.php');
        exit();
    }

    $student_id = $student['student_id'];
} catch (PDOException $e) {
    $_SESSION['error'] = 'Database error: ' . $e->getMessage();
    header('Location: complaint-list.php');
    exit();
}

if (isset($_GET['complaint_id'])) {
    $complaint_id = $_GET['complaint_id'];

    try {
        // Start a transaction
        $mysql_pdo->beginTransaction();

        // Delete related entries from Complaint_Status in MySQL
        $stmt = $mysql_pdo->prepare("DELETE FROM complaint_status WHERE complaint_id = :complaint_id");
        $stmt->bindParam(':complaint_id', $complaint_id);
        $stmt->execute();

        // Delete the complaint in MySQL
        $stmt = $mysql_pdo->prepare("DELETE FROM complaint WHERE complaint_id = :complaint_id AND student_id = :student_id");
        $stmt->bindParam(':complaint_id', $complaint_id);
        $stmt->bindParam(':student_id', $student_id);
        $stmt->execute();

        // Commit the transaction
        $mysql_pdo->commit();

        $_SESSION['success'] = 'Complaint deleted successfully.';
        header('Location: complaint-list.php');
        exit();
    } catch (PDOException $e) {
        // Rollback the transaction on error
        $mysql_pdo->rollBack();
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