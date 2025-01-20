<?php
// Include database configuration
include 'qiladbcon.php';

$worker_query = "SELECT \"worker_id\", \"Name\", \"specialization\" FROM \"maintenance_worker\"";
$worker_result = $pdo->query($worker_query);

$options = "<option value=''>Select Maintenance Worker</option>";
while ($worker = $worker_result->fetch(PDO::FETCH_ASSOC)) {
    $options .= "<option value='" . htmlspecialchars($worker['worker_id']) . "'>" . htmlspecialchars($worker['Name']) . " - " . htmlspecialchars($worker['specialization']) . "</option>";
}

echo $options;
?>
