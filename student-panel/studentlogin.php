<?php
session_start();

// Include the database connection file
include('teahconnect.php');

if (isset($_POST['loginBtn'])) {
    // Sanitize and retrieve user inputs
    $username = filter_var($_POST['username'], FILTER_SANITIZE_STRING);
    $password = $_POST['password'];

    // Create a database connection
    $conn = new mysqli($host, $user, $password, $database, $port);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Prepare the SQL query to fetch the user data based on username
    $sql = "SELECT * FROM Student WHERE Username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if the username exists in the database
    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // Verify the password
        if (password_verify($password, $user['Password'])) {
            // Regenerate session ID
            session_regenerate_id(true);

            // Create session variables
            $_SESSION['user_id'] = $user['Matric_No'];
            $_SESSION['user_name'] = $user['Name'];

            // Redirect to the student dashboard
            header("Location: dashboard.php");
            exit();
        } else {
            $error_message = "Incorrect password!";
        }
    } else {
        $error_message = "No user found with that username!";
    }

    // Close statement and connection
    $stmt->close();
    $conn->close();
}
?>

<!-- Display Error Message -->
<?php if (isset($error_message)) { ?>
    <div class="alert alert-danger text-center">
        <?php echo htmlspecialchars($error_message); ?>
    </div>
<?php } ?>
