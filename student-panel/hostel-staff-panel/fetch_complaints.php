<?php
include 'qiladbcon.php';

$type = $_GET['type'] ?? '';
$query = '';

switch ($type) {
    case 'total':
        $query = "SELECT * FROM complaint";
        break;
    case 'resolved':
        $query = "SELECT * FROM complaint WHERE status = 'Resolved' AND date_resolved IS NOT NULL";
        break;
    case 'assigned':
        $query = "SELECT * FROM complaint WHERE status = 'Assigned' AND date_resolved IS NULL";
        break;
    case 'in_progress':
        $query = "SELECT * FROM complaint WHERE status = 'In progress' AND date_resolved IS NULL";
        break;
    default:
        echo '<p class="text-danger">Invalid complaint type.</p>';
        exit;
}

$result = $pdo->query($query);

if ($result->rowCount() > 0) {
    echo '<table class="table table-bordered">';
    echo '<thead><tr><th>ID</th><th>Type</th><th>Issue</th><th>Description</th><th>Status</th></tr></thead>';
    echo '<tbody>';
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr>
                <td>{$row['complaint_id']}</td>
                <td>{$row['complaint_type']}</td>
                <td>{$row['complaint_issue']}</td>
                <td>{$row['description']}</td>
                <td>{$row['status']}</td>
              </tr>";
    }
    echo '</tbody></table>';
} else {
    echo '<p>No complaints found.</p>';
}
?>
