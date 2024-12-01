<?php

require '../config/function.php';

$paraResult = checkParamId('id');
if (is_numeric($paraResult)) {
    $adminId = validate($paraResult);

    $admin = getById('admin', $adminId);
    if ($admin['status'] == 200) {
        $adminDeleteRes = deleteQuery('admin', $adminId);
        if ($adminDeleteRes) {
            redirect('view-admin.php', 'Admin successfully deleted.');
        } else {
            redirect('view-admin.php', 'Something went wrong!');
        }
    } else {
        redirect('view-admin.php', $admin['message']);
    }
} else {
    redirect('view.admin.php', $paraResult);
}
