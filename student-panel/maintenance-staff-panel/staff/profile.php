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