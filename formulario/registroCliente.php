<?php 
    include('../conexion/conexion.php');
    include('../modelos/clientesModelos.php');
?>
<?php
$obj = new Cliente();
if($_POST){
    $obj->documentoCliente = $_POST['documentoCliente'];
    $obj->codigoDocumento = $_POST['codigoDocumento'];
    $obj->nombreCliente = $_POST['nombreCliente'];
    $obj->apellidoCliente = $_POST['apellidoCliente'];
    $obj->telefonoCliente1 = $_POST['telefonoCliente1'];
    $obj->telefonoCliente2 = $_POST['telefonoCliente2'];
    $obj->ciudadCliente = $_POST['telefonoCliente'];
    $obj->correoCliente = $_POST['correoCliente'];
    $obj->contraseñaCliente = $_POST['contraseñaCliente'];
    $obj->confirmarcontraseñaCliente = $_POST['contraseñaCliente'];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes</title>
</head>
<body>
    <center>
    <form action="" name="cliente" id="cliente" method="POST">
        <h2>Registro Cliente</h2>
        <p><strong>El siguiente formulario es necesario diligenciar para el uso optimo de nuestros servicios agradecemos su comprension.</strong></p>
        <table border="1">
            <tr>
                <td>Numero Documento</td>
                <td><input type="text" name="documentoCliente" id="documentoCliente" placeholder="Digite el Documento del Cliente"  size="30"></td>
            
                <td>Seleccione el Documento</td>
                <td><input type="text" name="codigoDocumento" id="codigoDocumento"  size="45"></td>
            </tr>
            <tr>
                <td>Nombre</td>
                <td><input type="text" name="nombreCliente" id="nombreCliente" placeholder="Digite el Nombre del Cliente"  size="45"></td>
            
                <td>Apellido</td>
                <td><input type="text" name="apellidoCliente" id="apellidoCliente" placeholder="Digite el Apellido del Cliente"  size="45"></td>
            </tr>
            <tr>
                <td>Telefono1</td>
                <td><input type="text" name="telefonoCliente1" id="telefonoCliente1" placeholder="Digite el Telefono del Cliente"  size="45"></td>
            
                <td>Telefono2</td>
                <td><input type="text" name="telefonoCliente2" id="telefonoCliente2" placeholder="Digite el Telefono del Cliente"  size="45"></td>
            </tr>
                <td>ciudadCliente</td>
                <td><input type="text" name="ciudadCliente" id="ciudadCliente" placeholder="Digite el Nombre de la Ciudad"  size="45"></td>
            
                <td>Correo Electronico</td>
                <td><input type="text" name="correoCliente" id="correoCliente" placeholder="Digite el Correo del Cliente"  size="45"></td>
            </tr>            
            <tr>
                <td>contraseña</td>
                <td><input type="number" name="contraseñaCliente" id="contraseñaCliente" placeholder="Digite el Numero de Contraseña"  size="45"></td>
            
                <td>Confirmar contraseña</td>
                <td><input type="number" name="confirmarcontraseñaCliente" id="confirmarcontraseñaCliente" placeholder="Confirme el Numero de Contraseña"  size="45"></td>
            </tr>
            <tr>

            <tr>
                <td colspan="4">
                    <center>
                        <button name="agregar" type="submit"> Guardar</button>
                        <a href="clientes.php">
                            <button name="salir" type="button">Salir</button>
                        </a>
                    </center>
                </td>
            </tr>

        </table>
        

    </form>
    </center>    
    
</body>
</html>