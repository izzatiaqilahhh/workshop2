<?php
function getUserProfile($pdo, $matric_no) {
    $stmt = $pdo->prepare('SELECT * FROM student WHERE Matric_No = :Matric_No');
    $stmt->bindParam(':Matric_No', $matric_no);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

function getUserComplaint($pdo, $matric_no) {
    $stmt = $pdo->prepare('SELECT * FROM complaint WHERE Matric_No = :Matric_No');
    $stmt->bindParam(':Matric_No', $matric_no);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>