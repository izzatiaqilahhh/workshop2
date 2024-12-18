<?php
session_start();

// Include the database connection file
include('teahconnect.php');

// Debugging: Check if form is submitted
if (isset($_POST['loginBtn'])) {
    echo "Form is being submitted!<br>";

    // Get the submitted form data
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Create a database connection
    $conn = new mysqli($host, $user, $password, $database, $port);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Debugging: Check if the connection was successful
    echo "Connected to the database!<br>";

    // Prepare the SQL query to fetch the user data based on username
    $sql = "SELECT * FROM Student WHERE Username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();

    // Debugging: Check if SQL executed correctly
    if ($stmt) {
        echo "SQL executed successfully!<br>";
    } else {
        echo "SQL error: " . $conn->error . "<br>";
    }

    $result = $stmt->get_result();

    // Check if the username exists in the database
    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // Verify the password
        if (password_verify($password, $user['Password'])) {
            // Password is correct, create session and redirect to dashboard
            $_SESSION['user_id'] = $user['Matric_No'];
            $_SESSION['user_name'] = $user['Name'];

            // Redirect to the student dashboard
            header("Location: dashboard.php");
            exit();
        } else {
            // Incorrect password
            $error_message = "Incorrect password!";
        }
    } else {
        // Username not found
        $error_message = "No user found with that username!";
    }

    // Close the connection
    $conn->close();
}
?>

<!-- Display Error Message -->
<?php if (isset($error_message)) { ?>
    <div class="alert alert-danger">
        <?php echo $error_message; ?>
    </div>
<?php } ?>
