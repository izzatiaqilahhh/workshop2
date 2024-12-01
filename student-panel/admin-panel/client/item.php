<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal" data-theme-mode="light" data-header-styles="light" data-menu-styles="dark" data-toggled="close">

<head>

    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> GreSIS - Item Details</title>

    <!-- Favicon -->
    <link rel="icon" href="../assets/images/brand-logos/favicon.ico" type="image/x-icon">

    <!-- Choices JS -->
    <script src="../assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>

    <!-- Main Theme Js -->
    <script src="../assets/js/main.js"></script>

    <!-- Bootstrap Css -->
    <link id="style" href="../assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Style Css -->
    <link href="../assets/css/styles.min.css" rel="stylesheet">

    <!-- Icons Css -->
    <link href="../assets/css/icons.css" rel="stylesheet">

    <!-- Node Waves Css -->
    <link href="../assets/libs/node-waves/waves.min.css" rel="stylesheet">

    <!-- Simplebar Css -->
    <link href="../assets/libs/simplebar/simplebar.min.css" rel="stylesheet">

    <!-- Color Picker Css -->
    <link rel="stylesheet" href="../assets/libs/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="../assets/libs/@simonwep/pickr/themes/nano.min.css">

    <!-- Choices Css -->
    <link rel="stylesheet" href="../assets/libs/choices.js/public/assets/styles/choices.min.css">


    <link rel="stylesheet" href="../assets/libs/swiper/swiper-bundle.min.css">
    <style>
        @media print {

            /* Set the size of the page to mimic a mobile device */
            @page {
                size: portrait;
                margin: 0;
                /* Remove default margins */
            }

            /* Adjust the body to fit the mobile aspect ratio */
            img {
                width: 320px;
                height: auto;
                margin: 0 auto;
                display: block;
            }

            .print-img {
                width: 350px;
                height: auto;
                margin: 0 auto;
                margin-top: 100px;
                display: block;

            }

            /* Ensure all content fits within the mobile dimensions */
            .content {
                width: auto;
                /* Mobile width */
                height: auto;
                box-sizing: border-box;
                padding: 16px;
                border: 1px solid black;
                /* Optional: to visually see the content area */
            }

            .hidden-print {
                display: none !important;
            }
        }
    </style>


</head>

<body>

    <!-- Loader -->
    <div id="loader">
        <img src="../assets/images/media/loader.svg" alt="">
    </div>
    <!-- Loader -->

    <div class="page">

        <!-- app-header -->
        <header class="app-header ">

            <!-- Start::main-header-container -->
            <div class="main-header-container container-fluid">

                <!-- Start::header-content-left -->
                <div class="header-content-left">

                    <!-- Start::header-element -->
                    <div class="header-element">
                        <div class="horizontal-logo">
                            <a href="../../index.php" class="text-black fw-bolder fs-20">
                            GreSIS
                            </a>
                        </div>
                    </div>
                    <!-- End::header-element -->
                </div>


            </div>
            <!-- End::main-header-container -->

        </header>
        <!-- /app-header -->


        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

                <!-- Page Header -->
                <div class="d-md-flex d-block align-items-center justify-content-between mb-3 page-header-breadcrumb  hidden-print py-4 py-md-0">
                    <h1 class="page-title fw-semibold fs-22 mb-3">Item Details</h1>
                    <div class="ms-md-1 ms-0">
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="javascript:void(0);">Item</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Item Details</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!-- Page Header Close -->

                <!-- Start::row-1 -->
                <div class="row">
                    <div class="d-flex justify-content-end my-3 hidden-print">
                        <button class="btn btn-primary btn-sm text-center" onclick="printPage()">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: rgba(255, 255, 255, 1);">
                                <path d="M19 7h-1V2H6v5H5c-1.654 0-3 1.346-3 3v7c0 1.103.897 2 2 2h2v3h12v-3h2c1.103 0 2-.897 2-2v-7c0-1.654-1.346-3-3-3zM8 4h8v3H8V4zm8 16H8v-4h8v4zm4-3h-2v-3H6v3H4v-7c0-.551.449-1 1-1h14c.552 0 1 .449 1 1v7z"></path>
                                <path d="M14 10h4v2h-4z"></path>
                            </svg>
                            Print Details
                        </button>
                    </div>
                    <!-- <button onclick="window.print()">Print this page</button> -->
                    <div class="col-xl-12">
                        <?php
                        include('../config/dbcon.php');
                        if (isset($_GET['id'])) {
                            $item_id = $_GET['id'];
                            $query = "SELECT * FROM item WHERE id = '$item_id'";
                            $query_run = mysqli_query($conn, $query);
                            if (mysqli_num_rows($query_run) > 0) {
                                foreach ($query_run as $row) {
                        ?>

                                    <div class="card custom-card">
                                        <div class="card-body">
                                            <div class="row gx-5">
                                                <div class="col-xxl-3 col-xl-12">
                                                    <div class="row">
                                                        <div class="col-xxl-12 col-xl-6 col-lg-6 col-md-6 col-sm-12 mb-md-5 mb-3">
                                                            <img class="img-fluid" src="../uploads/items/<?= $row['image']; ?>" alt="img">
                                                        </div>
                                                        <div class="col-xxl-12 col-xl-6 col-lg-6 col-md-6 col-sm-12 d-md-block">
                                                            <div>
                                                                <p class="fs-20 fw-semibold mb-3"><?= $row['name'] ?></p>


                                                                <div class="mb-4">
                                                                    <p class="fs-15 fw-semibold mb-1">Description:</p>
                                                                    <p class="text-muted mb-0">
                                                                        <?= $row['description'] ?>

                                                                    </p>
                                                                </div>

                                                                <div class="mb-4">
                                                                    <p class="fs-15 fw-semibold mb-2">Product Details:</p>
                                                                    <div class="row">
                                                                        <div class="col-xl-10">
                                                                            <div class="table-responsive">
                                                                                <table class="table table-bordered text-nowrap">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <th scope="row" class="fw-semibold">
                                                                                                Fabricator
                                                                                            </th>
                                                                                            <td><?= $row['fabricator'] ?></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <th scope="row" class="fw-semibold">
                                                                                                Dimension
                                                                                            </th>
                                                                                            <td>
                                                                                                <?= $row['dimension'] ?>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <th scope="row" class="fw-semibold">
                                                                                                Weight
                                                                                            </th>
                                                                                            <td>
                                                                                                <?= $row['weight'] ?>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <th scope="row" class="fw-semibold">
                                                                                                Green Materials
                                                                                            </th>
                                                                                            <td>
                                                                                                <?= $row['gmaterials'] ?>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <th scope="row" class="fw-semibold">
                                                                                                Percentage Utilization
                                                                                            </th>
                                                                                            <td>
                                                                                                <?= $row['putilization'] ?>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <th scope="row" class="fw-semibold">
                                                                                                Function
                                                                                            </th>
                                                                                            <td>
                                                                                                <?= $row['function'] ?>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <!-- 
                                                                                        <tr>
                                                                                            <th scope="row" class="fw-semibold">
                                                                                                Process
                                                                                            </th>
                                                                                            <td>
                                                                                                <?= $row['process'] ?>
                                                                                            </td>
                                                                                        </tr> -->

                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="mb-4">
                                                                    <p class="fs-15 fw-semibold mb-2">Process:</p>
                                                                    <div class="row">
                                                                        <div class="col-12 mb-3">
                                                                            <img class="img-fluid print-img" src="../uploads/process/<?= $row['process']; ?>" alt="img">

                                                                        </div>

                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                        <?php
                                }
                            }
                        }
                        ?>
                    </div>
                </div>
                <!--End::row-1 -->

            </div>
        </div>
        <!-- End::app-content -->


        <!-- Footer Start -->
        <footer class="footer mt-auto py-3 bg-white text-center hidden-print">
            <div class="container">
                <span class="text-muted">©Copyright <span id="year">2024</span> <a href="javascript:void(0);" class="text-dark fw-semibold">GreSIS</a>,
                    FKP, UTeM </span>
                </span>
            </div>
        </footer>
        <!-- Footer End -->

    </div>





    <!-- Popper JS -->
    <script src="../assets/libs/@popperjs/core/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="../assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Defaultmenu JS -->
    <script src="../assets/js/defaultmenu.min.js"></script>

    <!-- Node Waves JS-->
    <script src="../assets/libs/node-waves/waves.min.js"></script>

    <!-- Sticky JS -->
    <script src="../assets/js/sticky.js"></script>

    <!-- Simplebar JS -->
    <script src="../assets/libs/simplebar/simplebar.min.js"></script>
    <script src="../assets/js/simplebar.js"></script>

    <!-- Color Picker JS -->
    <script src="../assets/libs/@simonwep/pickr/pickr.es5.min.js"></script>



    <!-- Custom-Switcher JS -->
    <script src="../assets/js/custom-switcher.min.js"></script>

    <!-- Swiper JS -->
    <script src="../assets/libs/swiper/swiper-bundle.min.js"></script>

    <!-- Internal Product-Details JS -->
    <script src="../assets/js/product-details.js"></script>

    <!-- Custom JS -->
    <script src="../assets/js/custom.js"></script>

    <script>
        function printPage() {

            window.print();
        }
    </script>

</body>

</html>