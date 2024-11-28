<?php include('includes/header.php'); ?>

<title>GreSIS - Add Item</title>

<!-- Start::app-content -->
<div class="main-content app-content">
    <div class="container">

        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between my-4  page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-18 mb-0">Add Item</h1>
            <div class="ms-md-1 ms-0">
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="view-item.php">Item Management</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Add Item</li>

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
                        <div class="row">

                            <?php
                            $idrand = rand(100, 1000000);
                            ?>

                            <input type="hidden" name="id" value="<?= $idrand ?>">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Item Name</label>
                                    <input type="text" name="name" required class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Fabricator</label>
                                    <input type="text" name="fabricator" required class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Dimension</label>
                                    <input type="text" name="dimension" required class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Weight</label>
                                    <input type="text" name="weight" required class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Green Materials</label>
                                    <input type="text" name="gmaterials" required class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Percentage Utilization</label>
                                    <input type="text" name="putilization" required class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Process</label>
                                    <!-- <input type="text" name="process" required class="form-control"> -->
                                    <input type="file" name="image-process" required class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Function</label>
                                    <input type="text" name="function" required class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Description</label>
                                    <input type="text" name="description" required class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Image</label>
                                    <input type="file" name="image" required class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">

                                <!-- <label for="">QR Code</label> -->
                                <input type="hidden" id="url" name="qrcode" value="http://localhost:3000/website/admin-panel/client/item.php?id=<?= $idrand ?>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <button type="submit" name="addItem" class="btn btn-primary">Add Item</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <!--End::row-1 -->

    </div>
</div>
<!-- End::app-content -->





<script>
    // $(document).ready(function(){

    //     var url = $('#url').val();
    //     // alert(url);

    //     const image = document.querySelector("img"),
    //     button = document.querySelector("button"),
    //     api = `https://api.qrserver.com/v1/`,
    //     api2 = `create-qr-code/?size=150x150&data=`;

    //     // button.addEventListener("click", () => {
    //         image.src = `${api}${api2}${url}`;
    //     // });
    // });
</script>

<?php include('includes/footer.php'); ?>