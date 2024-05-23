<?php
//habiyaremye daniel 222007495 april 2024
                // Database connection parameters
require_once "databaseconnection.php";
$sql = "SELECT * FROM notifications";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<title>The Information about notifications</title>";
    echo "<h1>The Information about notifications</h1>";
    echo "<table border='1'>
            <tr>
                <th>notificationid</th>
                <th>userid</th>
                <th>message</th>
               <th>value</th>
                
            </tr>";

     //habiyaremye daniel 222007495 april 2024

    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["notificationid"] . "</td>";
        echo "<td>" . $row["userid"] . "</td>";
        echo "<td>" . $row["message"] . "</td>";
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
