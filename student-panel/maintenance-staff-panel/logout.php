<?php
session_start();
session_destroy();
header("Location: maintenanceStaffLogin.php");
exit();
?>