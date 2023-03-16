<%-- 
    Document   : 5TiendasConMayorPedidos
    Created on : 3 mar. 2023, 21:09:26
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row mt-2">
                <div class="col-sm">
                    <form class="form-control" action="DelAdministrador/tabla5UsuariosConMasPedidos.jsp">
                        <label>Ingrese el rango para buscar los usuarios</label>
                        <br></br>
                        <label>Ingrese la fecha DE:
                            <input type="date" name="desde" required pattern="\d{4}-\d{2}-\d{2}" />
                            <span class="validity"></span>
                        </label>
                        <br></br>
                        <label>Ingrese la fecha HASTA:
                            <input type="date" name="hasta" required pattern="\d{4}-\d{2}-\d{2}" />
                            <span class="validity"></span>
                        </label>
                        <br></br>
                        <p>
                            <button class="btn btn-primary" name="aceptar" type="submit">Aceptar</button>
                        </p>
                    </form>
                </div>
            </div>
        </div>


    </body>
</html>
