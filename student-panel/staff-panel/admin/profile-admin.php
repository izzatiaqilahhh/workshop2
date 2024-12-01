<?php include('includes/header.php'); ?>


<title>GreSIS - My Profile</title>

<!-- Start::app-content -->
<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between my-4  page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-22 mb-0">Profile</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="#"><?= $_SESSION['loggedInAdmin']['name'] ?></a></li>
                        <li class="breadcrumb-item active" aria-current="page">Profile</li>

                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header Close -->

        <!-- Start::row-1 -->
        <div class="row">
            <?= alertMessage(); ?>
            <div class="card custom-card">
                <div class="card-header">
                    <div class="card-title">
                        My Details
                    </div>
                </div>
                <div class="card-body">
                    <form action="code.php" method="POST">

                        <?php
                        $paramResult = checkParamId('id');
                        if (!is_numeric($paramResult)) {
                            echo '<h5>' . $paramResult . '</h5>';
                            return false;
                        }
                        $admin = getById('admin', checkParamId('id'));
                        if ($admin['status'] == 200) {
                        ?>

                            <input type="hidden" name="adminId" value="<?= $admin['data']['id']; ?>" required>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Staff Name</label>
                                        <input type="text" name="name" value="<?= $admin['data']['name']; ?>" required class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Staff Number</label>
                                        <input type="text" name="staffno" value="<?= $admin['data']['staffno']; ?>" required class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Email Address</label>
                                        <input type="email" name="email" value="<?= $admin['data']['email']; ?>" required class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Phone Number</label>
                                        <input type="text" name="phone" value="<?= $admin['data']['phone']; ?>" required class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Password</label>
                                        <input type="password" name="password" required class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Confirm Password</label>
                                        <input type="password" name="cpassword" required class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <button type="submit" name="editProfile" class="btn btn-primary">Save Changes</button>
                                    </div>
                                </div>
                            </div>

                        <?php
                        } else {
                            echo '<h5>' . $admin['message'] . '</h5>';
                        }
                        ?>

                    </form>

                </div>
            </div>
        </div>
        <!--End::row-1 -->

    </div>
</div>
<!-- End::app-content -->


<?php include('includes/footer.php'); ?>