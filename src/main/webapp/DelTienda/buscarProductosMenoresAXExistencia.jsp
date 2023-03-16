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
                    <form class="form-control" action="DelTienda/tablaProductosExistenciasMenoresAX.jsp">
                        <label class="label-success">Ingrese el limite de la existencia</label>
                        <br></br>
                        <input type="number" class="input-group" name="existencia" placeholder="existencia" required="requerido">
                        <br>
                        <p>
                            <button class="btn btn-primary" name="aceptar" type="submit">Aceptar</button>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
