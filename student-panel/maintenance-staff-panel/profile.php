<?php include('includes/header.php'); ?>

<title>E-Hostel Room Complaint - My Profile</title>

<!-- App Content -->
<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between my-4  page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Profile</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item active" aria-current="page">Profile</li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="d-flex my-3">
            <a href="dashboard.php" class="btn btn-primary btn-sm">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle-fill me-2" viewBox="0 0 16 16">
                    <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
                </svg>
                Back to Dashboard
            </a>
        </div>

        <!-- Row 1 -->
        <div class="row">
            <div class="card custom-card">
                <div class="card-header">
                    <div class="card-title">
                        My Details
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label>Staff Name</label>
                                <input type="text" name="name" placeholder="Staff Name" required class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label>Staff Number</label>
                                <input type="text" name="staffno" placeholder="Staff Number" required class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label>Email Address</label>
                                <input type="email" name="email" placeholder="Email Address" required class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label>Phone Number</label>
                                <input type="text" name="phone" placeholder="Phone Number" required class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label>Specialization</label>
                                <input type="text" name="specialization" placeholder="Specialization" required class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label>Position</label>
                                <input type="text" name="position" placeholder="Position" required class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label>Company Name</label>
                                <input type="text" name="name" placeholder="Company Name" required class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label>Company Number</label>
                                <input type="text" name="companyno" placeholder="Company Number" required class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label>Company Office Number</label>
                                <input type="text" name="officeno" placeholder="Company Office Number" required class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label>Field</label>
                                <input type="text" name="field" placeholder="Field" required class="form-control">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <button type="submit" name="editProfile" class="btn btn-primary">Save Changes</button>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Row 2 -->
        <div class="row">
            <div class="card custom-card">
                <div class="card-header">
                    <div class="card-title">
                        Change Password
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label>Password</label>
                                <input type="password" name="password" placeholder="Password" required class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label>Retype Password</label>
                                <input type="password" name="cpassword" placeholder="Retype Password" required class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <button type="submit" name="editProfile1" class="btn btn-primary">Save Changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include('includes/footer.php'); ?>