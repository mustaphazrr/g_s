<?php
require 'includes/config.php';
$numstagiaire=$_GET['suppstag'];
$supProfile=mysql_query("DELETE FROM stagiaires WHERE numstagiaire='$numstagiaire'");
header ('location: liste_stagiaire.php');// redirection
?>