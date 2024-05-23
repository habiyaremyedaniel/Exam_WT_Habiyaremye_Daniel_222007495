<?php
//habiyaremye daniel 222007495 april 2024
                // Database connection parameters
require_once "databaseconnection.php";

$sql = "SELECT * FROM scenes";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<title>The Information about scenes</title>";
    echo "<h1>The Information about scenes</h1>";
    echo "<table border='1'>
            <tr>
                <th>sceneid</th>
                <th>scenename</th>
                <th>description</th>
               <th>active</th>
                
            </tr>";

     //habiyaremye daniel 222007495 april 2024

    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["sceneid"] . "</td>";
        echo "<td>" . $row["scenename"] . "</td>";
        echo "<td>" . $row["description"] . "</td>";
        echo "<td>" . $row["active"] . "</td>";
        
       
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "no information found";
}

//habiyaremye daniel 222007495 april 2024

$conn->close();
?>
