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
                                <label>Ingrese el rango para especificar los pedidos</label>
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
                                <input type="hidden" name="iterador" value="3"/>
                                <input type="hidden" name="estado" value="1"/>
                                <input type="hidden" name="tienda" value="1"/>
                                <button class="btn btn-primary" type="submit">Buscar</button>
                            </form>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </body>
</html>
