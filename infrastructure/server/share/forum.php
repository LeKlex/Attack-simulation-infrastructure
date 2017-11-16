<?php
require_once("global.php");

/**
Simple under construction forum with some "developer" comments
Ing. Alexander Poschenreithner
*/


?>

<html>
    <head>
        <title>[SomeCompanyNameThatDoesntExist] :: Forum</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>
            [SomeCompanyNameThatDoesntExist] :: Forum
        </h1>

        <?php require_once('menue.php');?>

        <?php
            if (!isset($_SESSION["logged_in"]) || !$_SESSION["logged_in"]) {
                echo '<table id="personsTab"><tr><td style="color: red">You are not logged in!<br/>' .
                'Informations only visible for logged in users: <a href="index.php" style="color: greenyellow;">Login</a></td></tr>';
                die();
            }
        ?>
<!--
    * We should reorganice our marketplace! Just like... an online auctoin platform?! I think that would be great :)
    * Our forum should also be mucked out. All the old posts and offers only fill up the DB!
    * Peter said we need a new page layout... what for?! Nobody likes this Web 2.0 nonsense anyway...
-->

        <br/>
        <br/>
        <br/>
        <div style="text-align: center">
           <b style="font-size: large">SORRY!</b>
            <br/>
            <br/>
            <img src="website_under_construction.png">
        </div>
    </body>
</html>
