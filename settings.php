<?php
//habiyaremye daniel 222007495 april 2024
require_once "databaseconnection.php";
$sql = "SELECT * FROM settings";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<title>The Information about settings</title>";
    echo "<h1>The Information about settings</h1>";
    echo "<table border='1'>
            <tr>
                <th>settingid</th>
                <th>settingname</th>
               <th>value</th>
                
            </tr>";

     //habiyaremye daniel 222007495 april 2024

    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["settingid"] . "</td>";
        echo "<td>" . $row["settingname"] . "</td>";
        echo "<td>" . $row["value"] . "</td>";
        
       
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "no information found";
}

//habiyaremye daniel 222007495 april 2024

$conn->close();
?>
