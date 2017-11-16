<?php
require_once("global.php");
/**
Report page with hint on netcat listener on port 1234 and insecure fileupload.
Ing. Alexander Poschenreithner
*/

?>

<html>
<head>
    <title>Scions</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1>
    Scions :: Security Report Upload
</h1>

<?php require_once('menue.php');?>

<?php

//var_dump($_FILES);

if (isset($_FILES['file'])) {

    $uploaddir = '/vagrant_data/upload/';
    $uploadfile = $uploaddir . basename($_FILES['file']['name']);
//echo '<pre>';
//var_dump("From: " .$_FILES['file']['tmp_name'] . "    TO:" . $uploadfile);
//var_dump("cp " . $_FILES['file']['tmp_name'] . ' ' . $uploadfile);

    (shell_exec("cp " . $_FILES['file']['tmp_name'] . ' ' . $uploadfile));
    shell_exec('chmod -R 777 /vagrant_data/upload/');
    /*
    if (rename($_FILES['file']['tmp_name'], $uploadfile)) {
    #if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
        echo "Report was successfully uploaded.\n";
    } else {
        echo "Possible file upload attack!\n";
    }*/
}
?>



Upload Security Report

<form enctype="multipart/form-data" action="report.php" method="POST">
    <input type="file" name="file" id="file">
    <input type="submit" value="Upload Report" name="submit">
</form>

<br/>

You can use our new direct network service on port <b>1234</b> as well!
<br/>
<br/>

<div style="text-align: center">


 <table>
     <thead>
        <td>Company</td>
        <td>Assessment state</td>
        <td>Report</td>
     </thead>
     <tr>
         <td>HK InterCorp</td>
         <td>CRITICAL</td>
         <td><a href="/download.php?id=92847">Download</a></td>
     </tr>
     <tr>
         <td>SynTex Ltd.</td>
         <td>SECURE</td>
         <td><a href="/download.php?id=3123">Download</a></td>
     </tr>
     <tr>
         <td>Area 51</td>
         <td>SUFFICIENT</td>
         <td><a href="/download.php?id=995236">Download</a></td>
     </tr>
     <tr>
         <td>VSC Data Engineers</td>
         <td>SECURE</td>
         <td><a href="/download.php?id=93434">Download</a></td>
     </tr>
     <tr>
         <td>WikiLeaks</td>
         <td>SECURE</td>
         <td><a href="/download.php?id=26433215">Download</a></td>
     </tr>
 </table>

</div>
</body>
</html>
