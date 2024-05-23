<?php
//habiyaremye daniel 222007495 april 2024
                // Database connection parameters
require_once "databaseconnection.php";

$sql = "SELECT * FROM events";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<title>The Information about events</title>";
    echo "<h1>The Information about events</h1>";
    echo "<table border='1'>
            <tr>
                <th>eventid</th>
                <th>eventtype</th>
               <th>description</th>
                
            </tr>";

     //habiyaremye daniel 222007495 april 2024

    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["eventid"] . "</td>";
        echo "<td>" . $row["eventtype"] . "</td>";
        echo "<td>" . $row["description"] . "</td>";
        
       
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "no information found";
}

//habiyaremye daniel 222007495 april 2024

$conn->close();
?>
