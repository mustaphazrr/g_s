<?php
$hostname='localhost';
$user='root';
$password='';
$dbase='dbstagiaires';
$connexion = mysql_connect($hostname, $user, $password) or die ('impossible de se connecter a mysql');
$db = mysql_select_db($dbase, $connexion);
$titre= 'Gestion des stagiaires';
?>
