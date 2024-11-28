<?php include('includes/header.php'); ?>

<title>GreSIS - Update Item</title>

<!-- Start::app-content -->
<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between my-4  page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-18 mb-0">Edit Item</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="view-item.php">Item Management</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Edit Item</li>

                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header Close -->

        <!-- Start::row-1 -->
        <div class="row">
            <?= alertMessage(); ?>
            <div class="d-flex my-3">
                <a href="view-item.php" class="btn btn-primary btn-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle-fill me-2" viewBox="0 0 16 16">
                        <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0m3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z" />
                    </svg>
                    Back
                </a>
            </div>

            <div class="card custom-card">
                <div class="card-header">
                    <div class="card-title">
                        Item Details
                    </div>
                </div>
                <div class="card-body">
                    <form action="code.php" method="POST" enctype="multipart/form-data">

                        <?php
                        $paramResult = checkParamId('id');
                        if (!is_numeric($paramResult)) {
                            echo '<h5>' . $paramResult . '</h5>';
                            return false;
                        }
                        $item = getById('item', checkParamId('id'));
                        if ($item['status'] == 200) {
                        ?>

                            <input type="hidden" name="itemId" value="<?= $item['data']['id']; ?>" required>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Item Name</label>
                                        <input type="text" name="name" value="<?= $item['data']['name']; ?>" required class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Fabricator</label>
                                        <input type="text" name="fabricator" value="<?= $item['data']['fabricator']; ?>" required class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Dimension</label>
                                        <input type="text" name="dimension" value="<?= $item['data']['dimension']; ?>" required class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Weight</label>
                                        <input type="text" name="weight" value="<?= $item['data']['weight']; ?>" required class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Green Materials</label>
                                        <input type="text" name="gmaterials" value="<?= $item['data']['gmaterials']; ?>" required class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Percentage Utilization</label>
                                        <input type="text" name="putilization" value="<?= $item['data']['putilization']; ?>" required class="form-control">
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Function</label>
                                        <input type="text" name="function" value="<?= $item['data']['function']; ?>" required class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Description</label>
                                        <input type="text" name="description" value="<?= $item['data']['description']; ?>" required class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Process</label>
                                        <input type="file" name="image-process"  class="form-control file-picker-process">
                                        <input type="hidden" name="images-process" class="form-control hidden-curr-process">
                                        <img src="<?= '../uploads/process/' . $item['data']['process'] ?>" class="img-thumbnail" alt="Img" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Image</label>
                                        <input type="file" name="image" class="form-control file-picker">
                                        <input type="hidden" name="images" class="form-control hidden-curr">
                                        <img src="<?= '../uploads/items/' . $item['data']['image'] ?>" class="img-thumbnail" alt="Img" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>QR Code</label>
                                        <input type="text" name="qrcode" value="<?= $item['data']['qrcode']; ?>" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <button type="submit" name="editItem" class="btn btn-primary">Save Changes</button>
                                </div>
                            </div>

                        <?php
                        } else {
                            echo '<h5>' . $item['message'] . '</h5>';
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

<script src="../assets/js/jquery-3.7.1.min.js"></script>
<script>
    $(document).ready(function() {
        $('.file-picker').on('change', function() {
            $('.hidden-curr').val($('.file-picker').val());
        });
        $('.file-picker-process').on('change', function() {
            $('.hidden-curr-process').val($('.file-picker-process').val());
        });
    });
</script>
<?php include('includes/footer.php'); ?>