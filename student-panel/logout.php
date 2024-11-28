<?php

require 'admin-panel/config/function.php';

if (isset($_SESSION['name'])) {
    session_start(); //to ensure you are using same session
    session_destroy(); //destroy the session
    redirect('login.php', 'Successfully logged out.');
}
