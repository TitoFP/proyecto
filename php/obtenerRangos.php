<?php

require('conexionBD.php');
$consulta = 'SELECT DISTINCT rango
            FROM juez';
$salida = array();
if ($datos = $conexion->query($consulta)) {
    while ($rango = $datos->fetch_object()){
        $salida[] = $rango;
    }
    $datos->close();
}
$conexion->close();
echo json_encode($salida);
?>