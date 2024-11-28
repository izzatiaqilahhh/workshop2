<?php

require '../config/function.php';

if (isset($_SESSION['auth'])) {
    
    logoutSession();
    redirect('../index.php', 'Successfully logged out.');
}
