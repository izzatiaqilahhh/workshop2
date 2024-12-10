<?php

require 'admin-panel/config/function.php';

if (isset($_SESSION['name'])) {
    session_start();
    session_destroy();
    // redirect('login.php', 'Successfully logged out.'); //
}
