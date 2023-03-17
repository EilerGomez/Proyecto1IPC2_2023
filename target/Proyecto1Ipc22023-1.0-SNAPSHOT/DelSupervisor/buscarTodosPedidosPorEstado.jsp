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
                                <br>
                                <select class="form-select form-select-lg mb-3"  aria-label="Default select example" id="combo" name="estado">
                                    <option value="RECHAZADO">RECHAZADO</option>
                                    <option value="PENDIENTE">PENDIENTE</option>
                                    <option value="SOLICITADO">SOLICITADO</option>
                                    <option value="ENVIADO">ENVIADO</option>
                                    <option value="COMPLETADO">COMPLETADO</option>
                                </select>
                                <br><br>
                                <input type="hidden" name="iterador" value="2"/>
                                <input type="hidden" name="tienda" value="1"/>
                                <input type="hidden" name="desde" value="1"/>
                                <input type="hidden" name="hasta" value="1"/>
                                <button class="btn btn-primary" type="submit">Buscar</button>
                            </form>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </body>
</html>
