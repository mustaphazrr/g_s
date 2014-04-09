<?php
include('includes/config.php');
$numstag=$_POST['numstag'];
$matr=$_POST['matr'];
$codserv=$_POST['codserv'];
$nomstag=$_POST['nomstag'];
$prenomstag=$_POST['prenomstag'];
$sexe=$_POST['sexe'];

$jdebutstage=$_POST['jdebutstage'];
$mdebutstage=$_POST['mdebutstage'];
$adebutstage=$_POST['adebutstage'];
$debutstage=$adebutstage."/".$mdebutstage."/".$jdebutstage;

$journais=$_POST['journais'];
$moisnais=$_POST['moisnais'];
$anneenais=$_POST['anneenais'];
//$datenais=$_POST['datenais'];
$datenais=$anneenais."/".$moisnais."/".$journais;
//$debutstage=$_POST['debutstage'];

//$finstage=$_POST['finstage'];
$jfinstage=$_POST['jfinstage'];
$mfinstage=$_POST['mfinstage'];
$afinstage=$_POST['afinstage'];
$finstage=$afinstage."/".$mfinstage."/".$jfinstage;
$photo=$_FILES['photo']['name'];

if(empty($_POST['numstag']) || empty($_POST['matr']) || empty($_POST['codserv']) || empty($_POST['nomstag']) || empty($_POST['prenomstag']) || empty($_POST['sexe']) ){
	?><SCRIPT LANGUAGE="JAVASCRIPT"> alert("Vous devez remplir les champs svp!"); </SCRIPT><?php
		echo '<meta http-equiv="refresh" content="0; URL=ajoutstagiaire.php">';//redirection
}else{
	$requete= "select * from stagiaires where numstagiaire='$numstag'";
	$resultat=mysql_query($requete) or die ("echec de l'execution de la requete<br>." .mysql_error());
	if(mysql_num_rows($resultat)!=0){
		$data=mysql_fetch_object($resultat);
		echo '<body onLoad="alert(\'Stagiaire existant!\')">';
		echo '<meta http-equiv="refresh" content="0;URL=ajoutstagiaire.php">';
	}
	else{
	if($_FILES['photo']['error']==0){ 
		copy($_FILES['photo']['tmp_name'],'photos/'.$_FILES['photo']['name'] );
	}
	if($_FILES['photo']['error']==0)
		$requete="INSERT INTO stagiaires(numstagiaire,matricule,codeserv,nom,prenom,sexe,datenais,debutstage,finstage,photo) VALUES('$numstag','$matr','$codserv','$nomstag','$prenomstag','$sexe','$datenais','$debutstage','$finstage','$photo') ";
	else
		$requete="INSERT INTO stagiaires(numstagiaire,matricule,codeserv,nom,prenom,sexe,datenais,debutstage,finstage) VALUES('$numstag','$matr','$codserv','$nomstag','$prenomstag','$sexe','$datenais','$debutstage','$finstage') ";
		$reponse=mysql_query($requete);
		?><SCRIPT LANGUAGE="JAVASCRIPT"> alert("Stagiaire enregistre avec succes!");</SCRIPT><?php
		echo '<meta http-equiv="refresh" content="0; URL=ajoutstagiaire.php">';
		}
}
?>