<?php
session_start();
include('teahdbconfig.php'); // Include your database configuration file

// Check if the user is logged in
if (!isset($_SESSION['student'])) {
    header("Location: studentLogin.php");
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

// Fetch complaint details for editing
if (isset($_GET['complaint_id'])) {
    try {
        $complaint_id = $_GET['complaint_id'];
        $stmt = $pdo->prepare("SELECT * FROM Complaint WHERE Complaint_ID = :Complaint_ID AND Student_ID = :Student_ID");
        $stmt->bindParam(':Complaint_ID', $complaint_id);
        $stmt->bindParam(':Student_ID', $student_id);
        $stmt->execute();
        $complaint = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$complaint) {
            $_SESSION['error'] = 'Complaint not found.';
            header('Location: complaint-list.php');
            exit();
        }
    } catch (PDOException $e) {
        $_SESSION['error'] = 'Database error: ' . $e->getMessage();
        header('Location: complaint-list.php');
        exit();
    }
} else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Update complaint details
    $complaint_id = $_POST['complaint-id'];
    $complaint_type = $_POST['complaint-type'];
    $issue_type = $_POST['issue-type'];
    $description = $_POST['complaint-description'];
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
            header('Location: edit-complaint.php?complaint_id=' . $complaint_id);
            exit();
        }
    }

    try {
        $stmt = $pdo->prepare("UPDATE Complaint SET Complaint_Type = :Complaint_Type, Complaint_Issue = :Complaint_Issue, Description = :Description, Image = :Image WHERE Complaint_ID = :Complaint_ID AND Student_ID = :Student_ID");
        $stmt->bindParam(':Complaint_Type', $complaint_type);
        $stmt->bindParam(':Complaint_Issue', $issue_type);
        $stmt->bindParam(':Description', $description);
        $stmt->bindParam(':Image', $image, PDO::PARAM_LOB);
        $stmt->bindParam(':Complaint_ID', $complaint_id);
        $stmt->bindParam(':Student_ID', $student_id);
        $stmt->execute();

        $_SESSION['success'] = 'Complaint updated successfully.';
        header('Location: complaint-list.php');
        exit();
    } catch (PDOException $e) {
        $_SESSION['error'] = 'Database error: ' . $e->getMessage();
        header('Location: edit-complaint.php?complaint_id=' . $complaint_id);
        exit();
    }
} else {
    $_SESSION['error'] = 'Invalid request method.';
    header('Location: complaint-list.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Edit Complaint</title>
    <link rel="icon" href="images/logo.png" type="image/x-icon">
    <link id="style" href="hostel-staff-panel/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="hostel-staff-panel/assets/css/styles.min.css" rel="stylesheet">
    <link href="hostel-staff-panel/assets/css/icons.min.css" rel="stylesheet">
</head>
<body>
    <header class="app-header">
        <div class="main-header-container container-fluid">
            <div class="header-content-left">
                <div class="header-element">
                    <div class="horizontal-logo">
                        <a href="complaint-list.php" class="text-black fw-bolder fs-20">E-Hostel Room Complaint System</a>
                    </div>
                </div>
            </div>
            <div class="header-content-right">
                <div class="header-element">
                    <a href="#" class="header-link dropdown-toggle" id="mainHeaderProfile" data-bs-toggle="dropdown" aria-expanded="false">
                        <div class="d-flex align-items-center">
                            <div class="me-sm-2 me-0">
                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" style="fill: rgba(10, 10, 0, 1);">
                                    <path d="M12 2C6.579 2 2 6.579 2 12s4.579 10 10 10 10-4.579 10-10S17.421 2 12 2zm0 5c1.727 0 3 1.272 3 3s-1.273 3-3 3c-1.726 0-3-1.272-3-3s1.274-3 3-3zm-5.106 9.772c.897-1.32 2.393-2.2 4.106-2.2h2c1.714 0 3.209.88 4.106 2.2C15.828 18.14 14.015 19 12 19s-3.828-.86-5.106-2.228z"></path>
                                </svg>
                            </div>
                            <div class="d-sm-block d-none">
                                <p class="fw-semibold mb-0 lh-1"></p>
                                <span class="op-7 fw-normal d-block fs-11"></span>
                            </div>
                        </div>
                    </a>
                    <ul class="dropdown-menu pt-0 overflow-hidden header-profile-dropdown dropdown-menu-end" aria-labelledby="mainHeaderProfile">
                        <li><a class="dropdown-item d-flex" href="#"><i class="ti ti-logout fs-18 me-2 op-7"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    <div class="main-content app-content">
        <div class="container-fluid">
            <div class="d-md-flex d-block align-items-center justify-content-between page-header-breadcrumb py-sm-4 py-md-0">
                <h1 class="page-title fw-semibold fs-18 mb-0">Edit Complaint</h1>
                <div class="ms-md-1 ms-0">
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="complaint-list.php">My Complaints</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Edit Complaint</li>
                        </ol>
                    </nav>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="card custom-card">
                        <div class="card-header">
                            <div class="card-title">Edit Complaint</div>
                        </div>
                        <div class="card-body">
                            <form action="edit-complaint.php" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="complaint-id" value="<?= htmlspecialchars($complaint['Complaint_ID']) ?>">

                                <div class="mb-3">
                                    <label for="complaint-type">Complaint Type</label>
                                    <select class="form-control" id="complaint-type" name="complaint-type" required onchange="filterIssueType()">
                                        <option value="">Select Complaint Type</option>
                                        <option value="facility" <?= $complaint['Complaint_Type'] == 'facility' ? 'selected' : '' ?>>Facility Maintenance Issues</option>
                                        <option value="cleanliness" <?= $complaint['Complaint_Type'] == 'cleanliness' ? 'selected' : '' ?>>Cleanliness and Hygiene Complaints</option>
                                        <option value="security" <?= $complaint['Complaint_Type'] == 'security' ? 'selected' : '' ?>>Security Issues</option>
                                        <option value="internet" <?= $complaint['Complaint_Type'] == 'internet' ? 'selected' : '' ?>>Internet Connectivity Issues</option>
                                        <option value="roommate" <?= $complaint['Complaint_Type'] == 'roommate' ? 'selected' : '' ?>>Roommate or Neighbor Issues</option>
                                        <option value="general" <?= $complaint['Complaint_Type'] == 'general' ? 'selected' : '' ?>>General Complaints</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="issue-type">Issue Type</label>
                                    <select class="form-control" id="issue-type" name="issue-type" required>
                                        <option value="">Select Issue Type</option>
                                    </select>
                                </div>
                                <script>
                                    const issues = {
                                        facility: ["Plumbing", "Electrical", "Air Conditioning", "Furniture", "Broken Doors/Windows", "Others (Describe on Complaint Description field)"],
                                        cleanliness: ["Dirty Rooms", "Overflowing Trash Bins", "Pest Infestation", "Dirty Bathrooms", "Others (Describe on Complaint Description field)"],
                                        security: ["Broken Locks", "Unauthorized Access", "Theft", "Others (Describe on Complaint Description field)"],
                                        internet: ["Slow Wi-Fi", "No Connection", "Others (Describe on Complaint Description field)"],
                                        roommate: ["Noise Disturbances", "Conflicts", "Smoking or Prohibited Activities", "Others (Describe on Complaint Description field)"],
                                        general: ["Unresponsive Management", "Delayed Issue Resolution", "Others (Describe on Complaint Description field)"]
                                    };

                                    function filterIssueType() {
                                        const complaintType = document.getElementById("complaint-type").value;
                                        const issueType = document.getElementById("issue-type");
                                        issueType.innerHTML = '<option value="">Select Issue Type</option>';
                                        if (issues[complaintType]) {
                                            issues[complaintType].forEach(issue => {
                                                const option = document.createElement("option");
                                                option.value = issue.toLowerCase().replace(/\s+/g, "-");
                                                option.textContent = issue;
                                                issueType.appendChild(option);
                                            });
                                        }
                                    }

                                    // Pre-fill issue type
                                    document.addEventListener('DOMContentLoaded', function () {
                                        filterIssueType();
                                        document.getElementById("issue-type").value = "<?= strtolower(str_replace(' ', '-', $complaint['Complaint_Issue'])) ?>";
                                    });
                                </script>
                                <div class="mb-3">
                                    <label for="complaint-description">Complaint Description</label>
                                    <textarea class="form-control" id="complaint-description" name="complaint-description" rows="4" placeholder="Describe your complaint here..." required><?= htmlspecialchars($complaint['Description']) ?></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="complaint-image">Upload Image</label>
                                    <input type="file" class="form-control" id="complaint-image" name="complaint-image" accept="image/*">
                                </div>
                                <div class="mb-3">
                                    <button type="submit" class="btn btn-primary">Update Complaint</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="hostel-staff-panel/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>