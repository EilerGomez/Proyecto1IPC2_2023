<%@page import="SQL.Conexion"%>
<%@page import="Servelets.ServletLogin"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Encriptacion.Encriptacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/estilo.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">
        <title>Login</title>
    </head>
    <body>
        <div id="cuadro">
            <form method="POST" action="ServletLogin">
                <p id="titulo"> INICIAR SESION</p>
                <hr>
                <br/><br/>
                <label id="subtitulo1">ID DE USUARIO</label>     
                <br/><br/>
                <input type="number" name="IDusuario" class="entrada" required="requerido" value="" placeholder="Su id"/>
                <br/><br/>
                <label id="subtitulo2">CONTRASEÑA</label>   
                <br/><br/>
                <input type="password" name="password" class="entrada" required="requerido" placeholder="Su contraseña"/>
                <br/><br/>
                <label id="subtitulo3">AREA A LA QUE PERTENECE</label>   
                <select class="form-select" aria-label="Default select example" id="combo" name="combobox" >
                    <option value="1">Administrador</option>
                    <option value="2">Bodega</option>
                    <option value="3">Tienda</option>
                    <option value="4">Supervisor</option>
                </select>
                <br/><br/>

                <button type="submit" class="btn btn-primary" name="boton" id="boton">Ingresar</button>
            </form>

            <br/>
            <p id="marca">NIKO CODE</p>
        </div>
    </body>

</html>

