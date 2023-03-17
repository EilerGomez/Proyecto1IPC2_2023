<%-- 
    Document   : buscarPedidoPorTienda
    Created on : 16 mar. 2023, 16:40:23
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
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <nav class="navbar navbar-light bg-light">
                        <div class="container-fluid">
                            <form class="d-flex" action="DelSupervisor/pedidosPorFiltracion.jsp">
                                <input class="form-control me-2" type="number" placeholder="Ingrese el codigo de la tienda" aria-label="Search" name="tienda" required="requerido">
                                <input type="hidden" name="iterador" value="1"/>
                                <input type="hidden" name="estado" value="1"/>
                                <input type="hidden" name="desde" value="1"/>
                                <input type="hidden" name="hasta" value="1"/>
                                <br>
                                <button class="btn btn-primary" type="submit">Buscar</button>
                            </form>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </body>
</html>
