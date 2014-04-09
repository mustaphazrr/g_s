<?php
session_start ();
$loginOK=false;
include('includes/config.php');
$login = trim($_POST['user']);
$password = trim($_POST['pwd']); 
 
if (empty($_POST['user']) || empty($_POST['pwd'])) { 
echo'<body onLoad="alert(\'Vous devez verifier le formulaire authentification...\')">';
echo '<meta http-equiv="refresh" content="0;URL=index.php">';
}else{
$query = "SELECT iduser,nomuser,prenom,login,password FROM utilisateur where login='$login' and password='$password'";
$results = mysql_query($query) or die ("echec de l'exécution de la requête<br>."  . mysql_error());
   if(mysql_num_rows($results) > 0){
   $data = mysql_fetch_object($results);
   $loginOK=true;
   }else{echo'<body onLoad="alert(\'Ce utilisateur est non reconu dans le systeme...\')">';
   echo '<meta http-equiv="refresh" content="0;URL=index.php">';
   }
}
if($loginOK){
   $_SESSION['iduser']=$data->iduser;
   $_SESSION['nomuser']=$data->nomuser;
   $_SESSION['prenom']=$data->prenom;
   $_SESSION['login']=$data->login;
   $_SESSION['password']=$data->password;
   echo '<meta http-equiv="refresh" content="0;URL=gestion.php">';
}else{
echo'Une erreur est survenue lors de ouverture de la session essayer de nouveau';
}
?>