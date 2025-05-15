<?php

require __DIR__ . '/conexionBD.php';

$consulta = "SELECT nombre, apellido1, apellido2 FROM juez WHERE rango LIKE '" . $_GET['rango']."'";

$salida = array();
if ($datos = $conexion->query($consulta)) {
    while ($juez = $datos->fetch_object()){
        $salida[] = $juez;
    }
    $datos->close();
}
$conexion->close();
echo json_encode($salida);
?>