<?php
/**
Menue for the website
Ing. Alexander Poschenreithner
*/
?>

<hr>
<ul style="text-align: center;">
    <li><a style="color:greenyellow;" href="report.php">SR Upload</a></li>
    <li><a style="color:greenyellow;" href="forum.php">Forum</a></li>
    <li><a style="color:greenyellow;" href="viewer.php">Employees</a></li>
</ul>

<?php if (isset($_SESSION["logged_in"]) && $_SESSION["logged_in"]): ?>
<div id="logout">
    <form action="index.php" method="POST">
        <input type="submit" value="Logout"/>
        <input type="hidden" name="logout" value="LOGOUT"/>
    </form>
</div>
<?php endif; ?>

<hr>