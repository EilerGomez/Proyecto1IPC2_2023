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
                                <label id="subtitulo3">ESTADO DEL PEDIDO</label>   
                                <select aria-label="Default select example" id="combo" name="estado" >
                                    <option value="RECHAZADO">RECHAZADO</option>
                                    <option value="PENDIENTE">PENDIENTE</option>
                                    <option value="SOLICITADO">SOLICITADO</option>
                                    <option value="ENVIADO">ENVIADO</option>
                                    <option value="COMPLETADO">COMPLETADO</option>
                                </select>
                                <br><br>
                                <label>Ingrese el rango para especificar los pedidos</label>
                                <br>
                                <label>Ingrese la fecha DE:
                                    <input type="date" name="desde" required pattern="\d{4}-\d{2}-\d{2}" />
                                    <span class="validity"></span>
                                </label>
                                <br>
                                <label>Ingrese la fecha HASTA:
                                    <input type="date" name="hasta" required pattern="\d{4}-\d{2}-\d{2}" />
                                    <span class="validity"></span>
                                </label>
                                <br></br>
                                <label>Ingrese el id de la tienda</label>
                                <input class="form-control me-2" type="number" placeholder="Ingrese el codigo de la tienda" aria-label="Search" name="tienda" required="requerido">
                                <br><br>
                                <input type="hidden" name="iterador" value="4"/>
                                <button class="btn btn-primary" type="submit">Buscar</button>
                            </form>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </body>
</html>
