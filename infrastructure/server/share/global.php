<?php

/**
SQLite include
Ing. Alexander Poschenreithner
*/

session_start();

try
{
	$pdo = new PDO("sqlite:data/database.sqlite3");

	//Check connection details and dummy SQL
	//$result = $pdo->query("SELECT * FROM users;");
	//var_dump($result->fetchAll());
}
catch (PDOException $e)
{
	die("Connection failed: " . $e->getMessage());
}
