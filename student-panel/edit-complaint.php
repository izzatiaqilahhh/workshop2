<?php
session_start();
include('teahdbconfig.php');
include('paanconn.php');

// Check if the user is logged in
if (!isset($_SESSION['student'])) {
    header("Location: studentLogin.php");
    exit();
}

// Fetch user-specific data
try {
    $stmt = $pdo->prepare('SELECT * FROM student WHERE matric_no = :matric_no');
    $stmt->bindParam(':matric_no', $_SESSION['student']);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        echo 'User not found';
        exit();
    }

    // Check if complaint_id is provided
    if (!isset($_GET['complaint_id'])) {
        echo 'Complaint ID not provided';
        exit();
    }

    $complaint_id = $_GET['complaint_id'];

    // Fetch complaint data
    $stmt = $mysql_pdo->prepare('SELECT * FROM complaint WHERE complaint_id = :complaint_id AND student_id = :student_id');
    $stmt->bindParam(':complaint_id', $complaint_id, PDO::PARAM_INT);
    $stmt->bindParam(':student_id', $user['Student_ID'], PDO::PARAM_INT);
    $stmt->execute();
    $complaint = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$complaint) {
        echo 'Complaint not found or access denied';
        exit();
    }

    // Update complaint
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $complaintType = $_POST['complaint-type'];
        $issueType = $_POST['issue-type'];
        $description = $_POST['complaint-description'];

        // Handle image upload
        $image = $complaint['image'];
        if (isset($_FILES['complaint-image']) && $_FILES['complaint-image']['error'] == UPLOAD_ERR_OK) {
            $image = file_get_contents($_FILES['complaint-image']['tmp_name']);
        }

        $stmt = $mysql_pdo->prepare('UPDATE complaint SET complaint_type = :complaint_type, complaint_issue = :complaint_issue, description = :description, image = :image WHERE complaint_id = :complaint_id');
        $stmt->bindParam(':complaint_type', $complaintType);
        $stmt->bindParam(':complaint_issue', $issueType);
        $stmt->bindParam(':description', $description);
        $stmt->bindParam(':image', $image, PDO::PARAM_LOB);
        $stmt->bindParam(':complaint_id', $complaint_id, PDO::PARAM_INT);
        $stmt->execute();

        header("Location: complaint-list.php");
        exit();
    }

} catch (PDOException $e) {
    echo 'MySQL database connection failed: ' . htmlspecialchars($e->getMessage());
    exit();
}
?>

<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal" data-theme-mode="light" data-header-styles="light" data-menu-styles="gradient" data-nav-style="menu-hover" data-width="boxed" loader="enable">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>e-HRCS - Edit Complaint</title>
    <link rel="icon" href="images/logo.png" type="image/x-icon">
    <link id="style" href="assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/styles.min.css" rel="stylesheet">
    <link href="assets/css/icons.min.css" rel="stylesheet">
</head>
<body>

    <header class="app-header">
        <div class="main-header-container container-fluid">
            <div class="header-content-left">
                <div class="header-element">
                    <div class="horizontal-logo">
                        <a href="dashboard.php" class="text-black fw-bolder fs-20">E-Hostel Room Complaint System</a>
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
                                <p class="fw-semibold mb-0 lh-1"><?php echo htmlspecialchars($user['Name']); ?></p>
                                <span class="op-7 fw-normal d-block fs-11"><?php echo htmlspecialchars($user['Email']); ?></span>
                            </div>
                        </div>
                    </a>
                    <ul class="main-header-dropdown dropdown-menu pt-0 overflow-hidden header-profile-dropdown dropdown-menu-end" aria-labelledby="mainHeaderProfile">
                        <li><a class="dropdown-item d-flex" href="logout.php"><i class="ti ti-logout fs-18 me-2 op-7"></i>Logout</a></li>
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
                            <li class="breadcrumb-item"><a href="#"></a></li>
                            <li class="breadcrumb-item active" aria-current="page">Edit Complaint</li>
                        </ol>
                    </nav>
                </div>
            </div>

            <div class="row mt-4">
                <div class="d-flex my-3">
                    <a href="complaint-list.php" class="btn btn-primary btn-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle-fill me-2" viewBox="0 0 16 16">
                            <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
                        </svg>
                        Back to Complaints
                    </a>
                </div>
                <div class="col-md-12">
                    <div class="card custom-card">
                        <div class="card-header">
                            <div class="card-title">Edit Complaint</div>
                        </div>
                        <div class="card-body">
                            <form action="" method="POST" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label for="complaint-type">Complaint Type</label>
                                    <select class="form-control" id="complaint-type" name="complaint-type" required onchange="filterIssueType()">
                                        <option value="">Select Complaint Type</option>
                                        <option value="facility" <?= $complaint['complaint_type'] == 'facility' ? 'selected' : '' ?>>Facility Maintenance Issues</option>
                                        <option value="cleanliness" <?= $complaint['complaint_type'] == 'cleanliness' ? 'selected' : '' ?>>Cleanliness and Hygiene Complaints</option>
                                        <option value="security" <?= $complaint['complaint_type'] == 'security' ? 'selected' : '' ?>>Security Issues</option>
                                        <option value="internet" <?= $complaint['complaint_type'] == 'internet' ? 'selected' : '' ?>>Internet Connectivity Issues</option>
                                        <option value="roommate" <?= $complaint['complaint_type'] == 'roommate' ? 'selected' : '' ?>>Roommate or Neighbor Issues</option>
                                        <option value="general" <?= $complaint['complaint_type'] == 'general' ? 'selected' : '' ?>>General Complaints</option>
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

                                    // Prepopulate issue type on page load
                                    document.addEventListener('DOMContentLoaded', function() {
                                        filterIssueType();
                                        document.getElementById("issue-type").value = "<?= htmlspecialchars($complaint['complaint_issue']) ?>";
                                    });
                                </script>
                                <div class="mb-3">
                                    <label for="complaint-description">Complaint Description</label>
                                    <textarea class="form-control" id="complaint-description" name="complaint-description" rows="4" placeholder="Describe your complaint here..." required><?= htmlspecialchars($complaint['description']) ?></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="existing-complaint-image">Existing Image</label>
                                    <?php if ($complaint['image']): ?>
                                        <img src="data:image/jpeg;base64,<?= base64_encode($complaint['image']) ?>" alt="Complaint Image" class="img-fluid mb-3">
                                    <?php else: ?>
                                        <p>No image uploaded.</p>
                                    <?php endif; ?>
                                </div>
                                <div class="mb-3">
                                    <label for="complaint-image">Upload New Image</label>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>