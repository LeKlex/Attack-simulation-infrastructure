<?php
require_once("global.php");
/**
Member overview - bad implemented SQL handling -> used for SQL Injections
Furthermore the HTML comment shows some hints on how data is handeled in the DB
Ing. Alexander Poschenreithner
*/


?>

<html>
<head>
    <title>[SomeCompanyNameThatDoesntExist] :: Members</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1>
    [SomeCompanyNameThatDoesntExist] :: Members
</h1>

<!--
To the developer:
Should the data sets really be deleted ?!
I think it's better to just give them a status like 'active', 'removed' or 'deleted' ... as you like!
I'll leave it that way and show it to you next week!

PS: Oh well, before I forget, I need to turn on the SQL error output for debugging purposes to improve the filter, but do not worry
   what should possibly go wrong by just filtering data?! In addition, our forum members dont have much knowledge about PCs anyway haha xD
-->

<?php require_once('menue.php');?>


<?php
if (isset($_SESSION["logged_in"]) && $_SESSION["logged_in"]):
    ?>

    <br/>
    <div id="filter">
        <form action="viewer.php" method="POST">
            <input type="text" name="filterText" value="" placeholder="Nick Name"/>
            <input type="submit" value="Filtern"/>
        </form>
    </div>
    <?php
endif;
?>



    <?php


    if (!isset($_SESSION["logged_in"]) || !$_SESSION["logged_in"]) {
        echo '<table id="personsTab"><tr><td style="color: red">You are not logged in!<br/>' .
                'Informations only visible for logged in users: <a href="index.php" style="color: greenyellow;">Login</a></td></tr>';
    } else {
        $error_message = "";

        $filterText = "%";
        if (isset($_POST["filterText"])) {
            $filterText = $_POST["filterText"];
        }


        //Load Statistics
        $result = $pdo->query("SELECT COUNT(*) FROM persons WHERE status LIKE 'active';");
        $usersActive = (int) $result->fetchColumn();

        $result = $pdo->query("SELECT COUNT(*) FROM persons WHERE status LIKE 'deleted';");
        $usersDeleted = (int) $result->fetchColumn();



        // Performing SQL query
        //Injection like: SELECT * FROM persons WHERE (status LIKE 'active' AND nickname LIKE '%%' OR status like 'deleted'); --%' )
        $query = "SELECT * FROM persons WHERE (status LIKE 'active' AND nickname LIKE '%$filterText%' )";
        //var_dump($query);
        $sth = $pdo->prepare($query);

        if ($sth) {
            $sth->execute();
            $isEmpty = true;

            echo "<table id=\"personsTab\"><tr><th>Id</th><th>IP</th><th>Nickname</th><th>Name</th><th># Posts</th><th>Status</th></tr>";

            // print persons
            $rowClass = "odd";
            while ($row = $sth->fetch(PDO::FETCH_NUM)) {
                $isEmpty = false;

                echo "\t<tr class='$rowClass personsLabels'>\n";
                echo "\t\t<td>" . $row[0] . "</td>\n";
                echo "\t\t<td><strong>" . $row[1] . "</strong></td>\n";
                echo "\t\t<td>" . $row[2] . "</td>\n";
                echo "\t\t<td>" . $row[3] . "</td>\n";
                echo "\t\t<td>" . $row[4] . "</td>\n";
                echo "\t\t<td>" . $row[5] . "</td>\n";
                echo "\t</tr>\n";

                if ($rowClass == "odd") {
                    $rowClass = "even";
                } else {
                    $rowClass = "odd";
                }
            }

            // message for empty result set
            if ($isEmpty) {
                echo "Keine Personen gefunden :(<br/><br/>";

            }
        } else {
            $failedStatement = "Failed to prepare statement: <br/>$query";
            $error_message = "SQLite Error: " . $pdo->errorInfo()[2];
            echo "<p class='error'>$error_message<br/><br/>$failedStatement</p>";
        }

        echo "</table>";

        echo "<br/><div style='text-align: center; font-size: x-small'><b>".$usersActive." active</b> (".$usersDeleted." deleted) <b>Users</b></div>";
    }
    ?>

</body>
</html>
