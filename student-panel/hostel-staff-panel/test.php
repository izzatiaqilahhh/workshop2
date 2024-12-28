<?php
$connection = pg_connect("host=localhost dbname=hrcs user=postgres password=postgresql");

if (!$connection) {
    echo "Connection successful";
    exit;
    }

    $result = pg_query($connection, 'SELECT * FROM "Hostel_Staff"');
    if (!$result) {
    echo "An error occured.<br>";
    exit;
}

// Paparkan data dalam bentuk jadual HTML
echo "<table border='1'>
<tr>
    <th>ID</th>
    <th>Nama</th>
    <th>Email</th>
    <th>Telefon</th>
</tr>";

while ($row = pg_fetch_assoc($result)) {
    echo "<tr>
        <td>" . htmlspecialchars($row['Staff_ID']) . "</td>
        <td>" . htmlspecialchars($row['Name']) . "</td>
        <td>" . htmlspecialchars($row['Email']) . "</td>
        <td>" . htmlspecialchars($row['Phone_No']) . "</td>
    </tr>";
}

echo "</table>";

// Tutup sambungan pangkalan data
pg_close($connection);
    
?>