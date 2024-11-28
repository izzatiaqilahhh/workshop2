<?php
require '../config/function.php';

if (isset($_POST['addAdmin'])) {
    $staffno = validate($_POST['staffno']);
    $name = validate($_POST['name']);
    $email = validate($_POST['email']);
    $phone = validate($_POST['phone']);
    $password = validate($_POST['password']);
    $password_two = validate($_POST['cpassword']);
   
    

    if ($staffno != '' || $name != '' || $email != '' || $phone != '' || $password != '' || $password_two != '') {

        if($password==$password_two)
        {
            $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

            $query = "INSERT INTO admin (staffno, name, email, phone, password)
            VALUES ('$staffno', '$name', '$email', '$phone', ' $hashedPassword')";

            $result = mysqli_query($conn, $query);

            if ($result) {
                redirect('view-admin.php', 'Admin successfully added.');
            } else {
                redirect('add-admin.php', 'Something went wrong!');
            }

        }else{
            redirect('add-admin.php', 'Password does not match!, Please try again.');
        }

        
    } else {
        redirect('add-admin.php', 'Please fill in all the input fields.');
    }
}

if (isset($_POST['editAdmin'])) {
    $staffno = validate($_POST['staffno']); 
    $name = validate($_POST['name']);
    $email = validate($_POST['email']);
    $phone = validate($_POST['phone']);
    $password = validate($_POST['password']);
    $password_two = validate($_POST['cpassword']);

    $adminId = validate($_POST['adminId']);

    $admin = getById('admin', $adminId);
    
    if ($admin['status'] != 200) {
        redirect('edit-admin.php?id=' . $adminId, 'No such ID found!');
    }
    if($password == ''||$password_two == '')
    {
        redirect('edit-admin.php?id=' . $adminId, 'Please fill in all the input fields, the password must be updated as well.');
    }

    if ($staffno != '' || $name != '' || $email != '' || $phone != '' || $password != '' || $password_two != '') {

        $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

        $query = "UPDATE admin SET staffno='$staffno', name='$name', email='$email', phone='$phone', password='$hashedPassword' WHERE id='$adminId'";

        $result = mysqli_query($conn, $query);

        if ($result) {
            redirect('view-admin.php', 'Admin information successfully edited.');
        } else {
            redirect('edit-admin.php', 'Something went wrong!');
        }
    } else {
        redirect('edit-admin.php', 'Please fill in all the input fields.');
    }
}

if (isset($_POST['editProfile'])) {
    $staffno = validate($_POST['staffno']);
    $name = validate($_POST['name']);
    $email = validate($_POST['email']);
    $phone = validate($_POST['phone']);
    $password = validate($_POST['password']);
    $password_two = validate($_POST['cpassword']);

    $adminId = validate($_POST['adminId']);

    $admin = getById('admin', $adminId);
    if ($admin['status'] != 200) {
        redirect('edit-admin.php?id=' . $adminId, 'No such ID found!');
    }

    if ($staffno != '' || $name != '' || $email != '' || $phone != '' || $password != '' || $password_two != '') {

        $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

        $query = "UPDATE admin SET staffno='$staffno', name='$name', email='$email', phone='$phone', password='$hashedPassword' WHERE id='$adminId'";

        $result = mysqli_query($conn, $query);

        if ($result) {
            redirect('profile-admin.php?id='.$_SESSION['loggedInAdmin']['id'], 'Admin information successfully edited.');
        } else {
            redirect('profile-admin.php?id='.$_SESSION['loggedInAdmin']['id'], 'Something went wrong!');
        }
    } else {
        redirect('profile-admin.php?id='.$_SESSION['loggedInAdmin']['id'], 'Please fill in all the input fields.');
    }
}

if (isset($_POST['editUserProfile'])) {
    $name = validate($_POST['name']);
    $email = validate($_POST['email']);
    $phone = validate($_POST['phone']);
    $password = validate($_POST['password']);
    $password_two = validate($_POST['cpassword']);

    $userId = validate($_POST['userId']);

    $user = getById('users', $userId);
    if ($user['status'] != 200) {
        redirect('../../user-profile.php?id=' . $userId, 'User Not found!, Please Try Again !');
    }

    if($password != $password_two)
    {
        redirect('../../user-profile.php?id=' . $userId, 'Password does not match !, Please try again.');
    }

    if($password == ''||$password_two == '')
    {
        redirect('../../user-profile.php?id=' . $_SESSION['user_id'], 'Please fill in all the input fields, the password must be updated as well.');
    }

    if ($name != '' || $email != '' || $phone != '' || $password != '' || $password_two != '') {

        $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

        $query = "UPDATE users SET name='$name', email='$email', phone='$phone', password='$hashedPassword' WHERE id='$userId'";

        $result = mysqli_query($conn, $query);

        if ($result) {

            redirect('../../user-homepage.php', 'Your profile successfully updated !');

        } else {
            redirect('../../user-profile.php?id=' . $_SESSION['user_id'], 'Something went wrong!');

        }
    } else {
        redirect('../../user-profile.php?id=' . $_SESSION['user_id'], 'Please fill in all the input fields !');

    }
}

if (isset($_POST['addItem'])) {
    $idItem = validate($_POST['id']);
    $name = validate($_POST['name']);
    $fabricator = validate($_POST['fabricator']);
    $dimension = validate($_POST['dimension']);
    $weight = validate($_POST['weight']);
    $gmaterials = validate($_POST['gmaterials']);
    $putilization = validate($_POST['putilization']);
    $process = validate($_POST['process']);
    $function = validate($_POST['function']);
    $description = validate($_POST['description']);

    if ($_FILES['image']['size'] > 0) {
        $image = $_FILES['image']['name'];

        $imgFileTypes = strtolower(pathinfo($image, PATHINFO_EXTENSION));
        if ($imgFileTypes != 'jpg' && $imgFileTypes != 'jpeg' && $imgFileTypes != 'png') {
            redirect('view-item.php', 'Sorry, only JPG, JPEG and PNG files are allowed!');
        }

        $path = "../uploads/items/";
        $imgExt = pathinfo($image, PATHINFO_EXTENSION);
        $filename = time() . '.' . $imgExt;

        $finalImage = $filename;
    } else {
        $finalImage = NULL;
    }

    if ($_FILES['image-process']['size'] > 0) {
        $imageprocess = $_FILES['image-process']['name'];

        $imgFileTypes = strtolower(pathinfo($imageprocess, PATHINFO_EXTENSION));
        if ($imgFileTypes != 'jpg' && $imgFileTypes != 'jpeg' && $imgFileTypes != 'png') {
            redirect('view-item.php', 'Sorry, only JPG, JPEG and PNG files are allowed!');
        }

        $pathprocess = "../uploads/process/";
        $imgExtprocess = pathinfo($imageprocess, PATHINFO_EXTENSION);
        $filenameprocess = time().'-process' . '.' . $imgExtprocess;

        $finalImageprocess = $filenameprocess;
    } else {
        $finalImageprocess = NULL;
    }

    $qrcode = validate($_POST['qrcode']);

    $query = "INSERT INTO item (id,name, fabricator, dimension, weight, gmaterials, putilization, process, function, description, image, qrcode)
    VALUES ('$idItem','$name', '$fabricator', '$dimension', '$weight', '$gmaterials', '$putilization', '$filenameprocess ', '$function', '$description', '$filename', '$qrcode')";


    $result = mysqli_query($conn, $query);
    if ($result) {

        if ($_FILES['image']['size'] > 0) {
            move_uploaded_file($_FILES['image']['tmp_name'], $path . $filename);
        }
        if ($_FILES['image-process']['size'] > 0) {
            move_uploaded_file($_FILES['image-process']['tmp_name'], $pathprocess . $filenameprocess);
        }
        redirect('view-item.php', 'Item successfully added.');
    } else {
        redirect('add-item.php', 'Something went wrong!');
    }
}

if (isset($_POST['editItem'])) {
    $name = validate($_POST['name']);
    $fabricator = validate($_POST['fabricator']);
    $dimension = validate($_POST['dimension']);
    $weight = validate($_POST['weight']);
    $gmaterials = validate($_POST['gmaterials']);
    $putilization = validate($_POST['putilization']);
    $function = validate($_POST['function']);
    $description = validate($_POST['description']);
    $image = validate($_POST['image']);
    $images = validate($_POST['images']);
    $imageprocess = validate($_POST['image-process']);
    $imagesprocess = validate($_POST['images-process']);
    $qrcode = validate($_POST['qrcode']);

    $itemId = validate($_POST['itemId']);
    $item = getById('item', $itemId);
    if ($_FILES['image']['size'] > 0) {
        $image = $_FILES['image']['name'];

        $imgFileTypes = strtolower(pathinfo($image, PATHINFO_EXTENSION));
        if ($imgFileTypes != 'jpg' && $imgFileTypes != 'jpeg' && $imgFileTypes != 'png') {
            redirect('view-item.php', 'Sorry, only JPG, JPEG and PNG files are allowed!');
        }

        $path = "../uploads/items/";
        $imgExt = pathinfo($image, PATHINFO_EXTENSION);
        $filename = time() . '.' . $imgExt;

        $finalImage = $filename;
    } else {
        $finalImage = NULL;
    }
    if ($_FILES['image-process']['size'] > 0) {
        $imageprocess = $_FILES['image-process']['name'];

        $imgFileTypes = strtolower(pathinfo($imageprocess, PATHINFO_EXTENSION));
        if ($imgFileTypes != 'jpg' && $imgFileTypes != 'jpeg' && $imgFileTypes != 'png') {
            redirect('view-item.php', 'Sorry, only JPG, JPEG and PNG files are allowed!');
        }

        $pathprocess = "../uploads/process/";
        $imgExtprocess = pathinfo($imageprocess, PATHINFO_EXTENSION);
        $filenameprocess = time().'-process' . '.' . $imgExtprocess;

        $finalImageprocess = $filenameprocess;
    } else {
        $finalImageprocess = NULL;
    }
    if ($item['status'] != 200) {
        redirect('edit-item.php?id=' . $itemId, 'No such ID found!');
    }

    if ($name != '' || $fabricator != '' || $dimension != '' || $weight != '' || $gmaterials != '' || $putilization != ''|| $function != '' || $description != '' || $qrcode != '') {
        if ($images != '') {
            $query = "UPDATE item SET name='$name', fabricator='$fabricator', dimension='$dimension', weight='$weight', gmaterials='$gmaterials', putilization='$putilization', function='$function', description='$description', image='$filename', qrcode='$qrcode' WHERE id='$itemId'";
        } 
        else if ($imagesprocess != '') {
            $query = "UPDATE item SET name='$name', fabricator='$fabricator', dimension='$dimension', weight='$weight', gmaterials='$gmaterials', putilization='$putilization', process='$filenameprocess', function='$function', description='$description', qrcode='$qrcode' WHERE id='$itemId'";
        }
        else if($imagesprocess != '' && $imagesprocess != '')
        {
            $query = "UPDATE item SET name='$name', fabricator='$fabricator', dimension='$dimension', weight='$weight', gmaterials='$gmaterials', putilization='$putilization', process='$filenameprocess', function='$function', description='$description', image='$filename', qrcode='$qrcode' WHERE id='$itemId'";
        }
        else {
            $query = "UPDATE item SET name='$name', fabricator='$fabricator', dimension='$dimension', weight='$weight', gmaterials='$gmaterials', putilization='$putilization', function='$function', description='$description', qrcode='$qrcode' WHERE id='$itemId'";
        }

        $result = mysqli_query($conn, $query);

        if ($result) {
            if ($_FILES['image']['size'] > 0) {
                move_uploaded_file($_FILES['image']['tmp_name'], $path . $filename);
            }
            if ($_FILES['image-process']['size'] > 0) {
                move_uploaded_file($_FILES['image-process']['tmp_name'], $pathprocess . $filenameprocess);
            }
            redirect('view-item.php', 'Item information successfully edited.');
        } else {
            redirect('edit-item.php', 'Something went wrong!');
        }
    } else {
        redirect('edit-item.php', 'Please fill in all the input fields.');
    }
}
