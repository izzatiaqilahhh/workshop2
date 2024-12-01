<?php

if (isset($_SESSION['auth'], $_SESSION['loggedInAdminRole'], $_SESSION['loggedInAdmin']['email'])) {
    $role = validate($_SESSION['loggedInAdminRole']);
    $email = validate($_SESSION['loggedInAdmin']['email']);

    $query = "SELECT * FROM admin WHERE email='$email' AND role='$role' LIMIT 1";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        // User is authenticated and has the correct role
        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);

        // Perform actions specific to admin access

    } else {
        // Access denied: Logout the user
        logoutSession();
        redirect('../login.php', 'Access denied!');
    }
} else {
    // Not authenticated: Redirect to login
    redirect('../login.php', 'Login to continue.');
}
