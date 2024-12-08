<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal" data-theme-mode="light" data-header-styles="light" data-menu-styles="gradient" data-nav-style="menu-hover" data-width="boxed" loader="enable">

<head>

    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>E-Hostel Room Complaint System - My Complaints</title>
    <link rel="icon" href="images/logo.png" type="images/x-icon">

    <!-- Bootstrap CSS -->
    <link id="style" href="admin-panel/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Style CSS -->
    <link href="admin-panel/assets/css/styles.min.css" rel="stylesheet">

    <!-- Icons CSS -->
    <link href="admin-panel/assets/css/icons.min.css" rel="stylesheet">

</head>

<body>

    <!-- App Header -->
    <header class="app-header">
        <div class="main-header-container container-fluid">
            <div class="header-content-left">
                <div class="header-element">
                    <div class="horizontal-logo">
                        <a href="user-homepage.php" class="text-black fw-bolder fs-20">E-Hostel Room Complaint System</a>
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
                                <p class="fw-semibold mb-0 lh-1">Nur Izzati Aqilah Binti Rahmad</p>
                                <span class="op-7 fw-normal d-block fs-11">B032320078@student.utem.edu.my</span>
                            </div>
                        </div>
                    </a>
                    <ul class="main-header-dropdown dropdown-menu pt-0 overflow-hidden header-profile-dropdown dropdown-menu-end" aria-labelledby="mainHeaderProfile">
                        <li><a class="dropdown-item d-flex" href="#"><i class="ti ti-logout fs-18 me-2 op-7"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!-- App Header -->

    <!-- App Content -->
    <div class="main-content app-content">
        <div class="container-fluid">

            <!-- Page Header -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-header-breadcrumb py-sm-4 py-md-0">
                <h1 class="page-title fw-semibold fs-18 mb-0">My Complaints</h1>
                <div class="ms-md-1 ms-0">
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="#">Nur Izzati Aqilah Binti Rahmad</a></li>
                            <li class="breadcrumb-item active" aria-current="page">My Complaints</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!-- Page Header -->

            <!-- Complaint Form Section -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="card custom-card">
                        <div class="card-header">
                            <div class="card-title">Submit New Complaint</div>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="mb-3">
                                    <label for="complaint-type">Complaint Type</label>
                                    <select class="form-control" id="complaint-type" required onchange="filterIssueType()">
                                        <option value="">Select Complaint Type</option>
                                        <option value="facility">Facility Maintenance Issues</option>
                                        <option value="cleanliness">Cleanliness and Hygiene Complaints</option>
                                        <option value="security">Security Issues</option>
                                        <option value="internet">Internet Connectivity Issues</option>
                                        <option value="roommate">Roommate or Neighbor Issues</option>
                                        <option value="general">General Complaints</option>
                                    </select>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="issue-type">Issue Type</label>
                                    <select class="form-control" id="issue-type" required>
                                        <option value="">Select Issue Type</option>
                                    </select>
                                </div>
                                
                                <script>
                                
                                // Define issues related to each category
                                const issues = {
                                    facility: ["Plumbing", "Electrical", "Air Conditioning", "Furniture", "Broken Doors/Windows", "Others (Describe on Complaint Description field)"],
                                    cleanliness: ["Dirty Rooms", "Overflowing Trash Bins", "Pest Infestation", "Dirty Bathrooms", "Others (Describe on Complaint Description field)"],
                                    security: ["Broken Locks", "Unauthorized Access", "Theft", "Others (Describe on Complaint Description field)"],
                                    internet: ["Slow Wi-Fi", "No Connection", "Others (Describe on Complaint Description field)"],
                                    roommate: ["Noise Disturbances", "Conflicts", "Smoking or Prohibited Activities", "Others (Describe on Complaint Description field)"],
                                    general: ["Unresponsive Management", "Delayed Issue Resolution", "Others (Describe on Complaint Description field)"]
                                };
                                
                                // Filter issues based on the selected complaint type
                                function filterIssueType() {
                                    const complaintType = document.getElementById("complaint-type").value;
                                    const issueType = document.getElementById("issue-type");
                                    
                                    // Clear existing options
                                    issueType.innerHTML = '<option value="">Select Issue Type</option>';
                                    
                                    // Add options specific to the selected complaint type
                                    if (issues[complaintType]) {
                                        issues[complaintType].forEach(issue => {
                                            const option = document.createElement("option");
                                            option.value = issue.toLowerCase().replace(/\s+/g, "-");
                                            option.textContent = issue;
                                            issueType.appendChild(option);
                                        });
                                    }
                                    }
                                    </script>
                                    
                                    <div class="mb-3">
                                        <label for="complaint-description">Complaint Description</label>
                                        <textarea class="form-control" id="complaint-description" rows="4" placeholder="Describe your complaint here..." required></textarea>
                                    </div>
                                    
                                    <!-- Image Upload Field -->
                                     <div class="mb-3">
                                        <label for="complaint-image">Upload Image</label>
                                        <input type="file" class="form-control" id="complaint-image" name="complaint-image" accept="image/*">
                                    </div>
                                    
                                    <div class="mb-3">
                                        <button type="submit" class="btn btn-primary">Submit Complaint</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Complaint Form Section -->
                 
                <!-- Complaints Table Section -->
                 <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card custom-card">
                            <div class="card-header">
                                <div class="card-title">My Existing Complaints</div>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Complaint ID</th>
                                            <th>Complaint Type</th>
                                            <th>Issue Type</th>
                                            <th>Description</th>
                                            <th>Date Filled</th>
                                            <th>Last Updated</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>123456</td>
                                            <td>Room Issues</td>
                                            <td>Plumbing</td>
                                            <td>Leaking tap in bathroom</td>
                                            <td>2024-04-15</td>
                                            <td>2024-04-16</td>
                                            <td>Pending</td>
                                            <td>
                                                <a href="#" class="btn btn-info btn-sm">View</a>
                                                <a href="#" class="btn btn-warning btn-sm">Edit</a>
                                                <a href="#" class="btn btn-danger btn-sm">Delete</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Complaints Table Section -->
                 
                <!-- Complaints Table Section -->
                 <div class="col-md-12">
                    <div class="card custom-card">
                        <div class="card-header">
                            <div class="card-title">Complaint Issue History</div>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Complaint Type</th>
                                        <th>Complaint ID</th>
                                        <th>Issue Type</th>
                                        <th>Description</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>123456</td>
                                        <td>Room Issues</td>
                                        <td>Plumbing</td>
                                        <td>Leaking tap in the bathroom</td>
                                        <td>Resolved</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Complaints Table Section -->

            </div>

        </div>
    </div>
    <!-- App Content -->

    <!-- Bootstrap JS -->
    <script src="admin-panel/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
