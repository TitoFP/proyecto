<?php 
  //Inicializamos valores para conectar a la base de datos.
  $servidor = "mysql-proyecto-proydaw.k.aivencloud.com";
  $usuario = "avnadmin";
  $pass = "AVNS_Lot6ecpKcA78c0n6zca";
  $basededatos = "campeonato";
  $puerto = "23398";
  $conexion = new mysqli($servidor, $usuario, $pass, $basededatos, $puerto);
  if($conexion->connect_error) {
    die("Conexión fallida" . $conexion->connect_error);
  }
  $conexion->query("SET NAMES 'utf8'");
?>


