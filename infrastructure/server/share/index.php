<?php

/**
Simple Website with some bugs.
Ing. Alexander Poschenreithner
*/

require_once("global.php");

$login_failed = false;
$logged_in = false;
$error_message = "";

if (isset($_POST["logout"]) && $_POST["logout"] == "LOGOUT") {
    //$_SESSION["logged_in"] = false;
} else if (isset($_POST["login"]) && $_POST["login"] == "Login") {
    $sqlquery = 'SELECT * FROM users WHERE username = \'' . $_POST["username"] .
        '\' AND password = \'' . $_POST["password"] . '\'';

    if ($result = $pdo->query($sqlquery)) {
        if ($result->fetchColumn()) {
            $logged_in = true;
        } else {
            $login_failed = true;
        }
    } else {
        $error_message = "SQLite Error: " . $pdo->errorInfo();
        $error_message = $error_message[2];
    }
}

if ($logged_in) {
    // redirect to viewer (with user logged in)
    $_SESSION["logged_in"] = true;
    require_once ("report.php");
    //header('Location: news.php');
    die();
}

?>

<html>
    <head>
        <title>Scions</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="" style="width: 320px;margin-left: auto; margin-right: auto;margin-top: 80px;">
            <h1 style="text-align: center;">
                Scions Verlag
            </h1>
            <br/>
            <div style="text-align: justify">Welcome to [SomeCompanyNameThatDoesntExist]<br><br><b>The #1 choice of IT-Security!</b></div>
            <br/><br/><br/><br/>

            <form method="POST" action="index.php" id="login">
                <label for="username">Mitarbeiter ID: </label>
                <input name="username" id="username" type="text"/>
                <br/><br/>
                <label for="password">Passwort: </label>
                <input name="password" id="password" type="password"/>
                <br/><br/>
                <input class="loginbtn" type="submit" name="login" value="Login"
                       style="height:20px;width:100px;margin: -20px -50px;position:relative;top:50%;left:50%;margin-top: 20px;"/>
            </form>

            <?php if ($login_failed || $error_message != ""): ?>
                <p class="error">
                    Login attempt failed!
                    <?php 
                        if ($error_message != "") {
                            echo "<br/>" . $error_message;
                        } 
                    ?>
                </p>
            <?php endif; ?>
        </div>
    </body>
</html>
