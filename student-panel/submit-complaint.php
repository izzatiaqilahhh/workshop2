<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
include('teahdbconfig.php'); // Include MariaDB config for student verification
include('paanconn.php'); // Include MySQL config for complaint submission

// Check if the user is logged in
if (!isset($_SESSION['student'])) {
    header("Location: studentLogin.php");
    exit();
}

// Fetch student ID using matric number from MariaDB
try {
    $stmt = $pdo->prepare("SELECT student_id, room_id FROM student WHERE matric_no = :matric_no");
    $stmt->bindParam(':matric_no', $_SESSION['student']);
    $stmt->execute();
    $student = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$student) {
        $_SESSION['error'] = 'Student not found.';
        header('Location: complaint-list.php');
        exit();
    }

    $student_id = $student['student_id'];
    $room_id = $student['room_id'];

    // Handle form submission
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        if (isset($_POST['complaint-type'], $_POST['issue-type'], $_POST['complaint-description'])) {
            $complaint_type = $_POST['complaint-type'];
            $issue_type = $_POST['issue-type'];
            $description = $_POST['complaint-description'];
            $date_created = date('Y-m-d');
            $image = null;

            // Handle file upload
            if (isset($_FILES['complaint-image']) && $_FILES['complaint-image']['error'] === UPLOAD_ERR_OK) {
                $file_tmp = $_FILES['complaint-image']['tmp_name'];
                $file_extension = strtolower(pathinfo($_FILES['complaint-image']['name'], PATHINFO_EXTENSION));
                $file_size = $_FILES['complaint-image']['size'];

                // Debugging information
                echo "File Extension: " . $file_extension . "<br>";
                echo "File Size: " . $file_size . "<br>";

                // Validate file type and size (e.g., max 5MB)
                $allowed_extensions = ['jpeg', 'jpg', 'png', 'gif'];
                $max_size = 5 * 1024 * 1024; // 5MB

                if (in_array($file_extension, $allowed_extensions) && $file_size <= $max_size) {
                    $image = file_get_contents($file_tmp);
                } else {
                    $error_msg = 'Invalid file type or size. Allowed types are JPEG, PNG, and GIF, and the maximum size is 5MB.';
                }
            } else {
                // Handle various upload errors
                switch ($_FILES['complaint-image']['error']) {
                    case UPLOAD_ERR_INI_SIZE:
                    case UPLOAD_ERR_FORM_SIZE:
                        $error_msg = 'File size exceeds the maximum allowed size.';
                        break;
                    case UPLOAD_ERR_PARTIAL:
                        $error_msg = 'File was only partially uploaded.';
                        break;
                    case UPLOAD_ERR_NO_FILE:
                        $error_msg = 'No file was uploaded.';
                        break;
                    case UPLOAD_ERR_NO_TMP_DIR:
                        $error_msg = 'Missing a temporary folder.';
                        break;
                    case UPLOAD_ERR_CANT_WRITE:
                        $error_msg = 'Failed to write file to disk.';
                        break;
                    case UPLOAD_ERR_EXTENSION:
                        $error_msg = 'File upload stopped by extension.';
                        break;
                    default:
                        $error_msg = 'Unknown error occurred during file upload.';
                        break;
                }
            }

            if (!isset($error_msg)) {
                try {
                    // Use MySQL connection to insert complaint into the database
                    $stmt = $mysql_pdo->prepare("INSERT INTO complaint (complaint_type, complaint_issue, description, image, date_created, student_id, room_id) VALUES (:complaint_type, :complaint_issue, :description, :image, :date_created, :student_id, :room_id)");
                    $stmt->bindParam(':complaint_type', $complaint_type);
                    $stmt->bindParam(':complaint_issue', $issue_type);
                    $stmt->bindParam(':description', $description);
                    $stmt->bindParam(':image', $image, PDO::PARAM_LOB);
                    $stmt->bindParam(':date_created', $date_created);
                    $stmt->bindParam(':student_id', $student_id);
                    $stmt->bindParam(':room_id', $room_id);
                    $stmt->execute();
                    
                    // Get the last inserted complaint ID
                    $complaint_id = $mysql_pdo->lastInsertId();

                    // Insert initial status into the Complaint_Status table
                    $stmt = $mysql_pdo->prepare("INSERT INTO complaint_status (complaint_id, complaint_status, description) VALUES (:complaint_id, 'pending', NULL)");
                    $stmt->bindParam(':complaint_id', $complaint_id);
                    $stmt->execute();

                    $_SESSION['success'] = 'Complaint submitted successfully.';
                    header('Location: complaint-list.php');
                    exit();
                } catch (PDOException $e) {
                    $_SESSION['error'] = 'Database error: ' . $e->getMessage();
                    header('Location: complaint-list.php');
                    exit();
                }
            } else {
                $_SESSION['error'] = $error_msg;
                header('Location: complaint-list.php');
                exit();
            }
        } else {
            $_SESSION['error'] = 'Missing form fields.';
            header('Location: complaint-list.php');
            exit();
        }
    }
} catch (PDOException $e) {
    $_SESSION['error'] = 'Database error: ' . $e->getMessage();
    header('Location: complaint-list.php');
    exit();
}
?>