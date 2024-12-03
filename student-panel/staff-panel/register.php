<?php
include('includes/header.php');
?>

<title>E-Hostel Complaint - Repair Company Staff Registration</title>

<div class="container py-5">
    <div class="row justify-content-center align-items-center authentication authentication-basic h-100">
        <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-6 col-sm-8 col-12 my-5">
                <div class="card custom-card ">
                    <div class="card-body p-5">
                        <p class="h5 fw-semibold mb-2 text-center">Register</p>
                        <p class="mb-4 text-muted op-7 fw-normal text-center">Repair Company Staff Registration</p>
                        <div class="row gy-3">
                            <div class="col-xl-12">
                                <label for="signup-fullname" class="form-label text-default">Full Name</label>
                                <input type="text" class="form-control form-control-lg" id="signup-fullname" placeholder="Full Name" name="name">
                            </div>
                            <div class="col-xl-12">
                                <label for="signup-companyname" class="form-label text-default">Company Name</label>
                                <input type="text" class="form-control form-control-lg" id="signup-companyname" placeholder="Staff Number" name="staffno">
                            </div>
                            <div class="col-xl-12">
                                <label for="signup-staffnumber" class="form-label text-default">Staff Number</label>
                                <input type="text" class="form-control form-control-lg" id="signup-staffnumber" placeholder="Staff Number" name="staffno">
                            </div>
                            <div class="col-xl-12">
                                <label for="signup-emailaddress" class="form-label text-default">Email Address</label>
                                <input type="email" class="form-control form-control-lg" id="signup-emailaddress" placeholder="Email Address" name="email">
                            </div>
                            <div class="col-xl-12">
                                <label for="signup-phonenumber" class="form-label text-default">Phone Number</label>
                                <input type="text" class="form-control form-control-lg" id="signup-phonenumber" placeholder="Phone Number" name="phone">
                            </div>
                            <div class="col-xl-12">
                                <label for="signup-specialization" class="form-label text-default">Specialization</label>
                                <input type="text" class="form-control form-control-lg" id="signup-specialization" placeholder="Staff Number" name="staffno">
                            </div>
                            <div class="col-xl-12">
                                <label for="signup-password" class="form-label text-default">Password</label>
                                <div class="input-group">
                                    <input type="password" class="form-control form-control-lg" id="signup-password" placeholder="Password" name="password">
                                    <button class="btn btn-light" onclick="createpassword('signup-password',this)" type="button" id="button-addon2"><i class="ri-eye-off-line align-middle"></i></button>
                                </div>
                            </div>
                            <div class="col-xl-12 mb-2">
                                <label for="signup-confirmpassword" class="form-label text-default">Confirm Password</label>
                                <div class="input-group">
                                    <input type="password" class="form-control form-control-lg" id="signup-confirmpassword" placeholder="Confirm Password" name="cpassword">
                                    <button class="btn btn-light" onclick="createpassword('signup-confirmpassword',this)" type="button" id="button-addon21"><i class="ri-eye-off-line align-middle"></i></button>
                                </div>
                            </div>
                            <div class="col-xl-12 d-grid mt-2">
                                <button type="submit" name="registerBtn" class="btn btn-lg btn-primary-gradient">Register</button>
                            </div>
                        </div>
                        <div class="text-center">
                            <p class="fs-12 text-muted mt-3">Already have an account? <a href="login.php" class="text-primary text-decoration-underline">Log In</a></p>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Show Password JS -->
<script src="assets/js/show-password.js"></script>

<?php include('includes/footer.php'); ?>