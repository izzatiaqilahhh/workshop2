<?php
include 'qiladbcon.php';

try {
    $query = "SELECT name, specialization FROM maintenance_worker";
    $result = $pdo->query($query);

    while ($worker = $result->fetch(PDO::FETCH_ASSOC)) {
        echo '<option value="' . htmlspecialchars($worker['name']) . '">'
            . htmlspecialchars($worker['name']) . ' (' . htmlspecialchars($worker['specialization']) . ')'
            . '</option>';
    }
<<<<<<< HEAD
} catch (PDOException $e) {
    echo '<option value="">Error loading workers</option>';
}
?>
=======
}
>>>>>>> 9393cbee (update code)
