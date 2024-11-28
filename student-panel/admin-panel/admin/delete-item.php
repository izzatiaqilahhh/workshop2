<?php

require '../config/function.php';

$paraResult = checkParamId('id');
if (is_numeric($paraResult)) {
    $itemId = validate($paraResult);

    $item = getById('item', $itemId);
    if ($item['status'] == 200) {
        $itemDeleteRes = deleteQuery('item', $itemId);
        if ($itemDeleteRes) {
            redirect('view-item.php', 'Item successfully deleted.');
        } else {
            redirect('view-item.php', 'Something went wrong!');
        }
    } else {
        redirect('view-item.php', $admin['message']);
    }
} else {
    redirect('view.item.php', $paraResult);
}
