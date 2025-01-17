<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

if (!isset($_SESSION['maintenance_staff'])) {
    header('HTTP/1.1 401 Unauthorized');
    echo json_encode(['error' => 'Unauthorized']);
    exit();
}

try {
    // Fetch new complaints
    $stmt = $pdo->prepare('SELECT Complaint_ID, Complaint_Type, Complaint_Issue, Description, Date_Created FROM Complaint WHERE Date_Resolved IS NULL ORDER BY Date_Created DESC');
    $stmt->execute();
    $complaints = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Return complaints as JSON
    echo json_encode($complaints);
} catch (PDOException $e) {
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(['error' => 'Database connection failed: ' . $e->getMessage()]);
    exit();
}
?>