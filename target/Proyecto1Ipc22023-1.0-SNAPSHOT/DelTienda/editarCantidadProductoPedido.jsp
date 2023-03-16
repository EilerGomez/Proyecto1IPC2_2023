<%-- 
    Document   : editarCantidadProductoPedido
    Created on : 14 mar. 2023, 12:49:20
    Author     : HP
--%>

<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body style="margin-top: 150px">
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <%
                        int idPedido = Integer.parseInt(request.getParameter("idPedido").toString());
                        int idProducto = Integer.parseInt(request.getParameter("idProducto").toString());
                        double costo = Double.parseDouble(request.getParameter("costo"));
                        String nombre = request.getParameter("nombre");
                        int cantidad = 0;
                        try {
                            cantidad = Integer.parseInt(request.getParameter("cantidad").toString());
                        } catch (NumberFormatException e) {
                            out.print("Entrada no valida, la cantidad debe ser un numero");
                        }
                    %>

                    <form action="editarPedidoRechazado.jsp" method="POST">
                        <input type="hidden" name="idPedido" value="<%=idPedido%>"/>
                        <button type="submit" class="btn btn-danger">Regresar</button>
                    </form>
                    <form action="editarCantidadProductoPedido.jsp" method="get">
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Cantidad de producto: <%=nombre%></label>
                            <input type="number" class="form-control" id="exampleInputPassword1" name="cantidad" value="<%=cantidad%>">
                            <input type="hidden" name="idPedido" value="<%=idPedido%>"/>
                            <input type="hidden" name="idProducto" value="<%=idProducto%>"/>
                            <input type="hidden" name="nombre" value="<%=nombre%>"/>
                            <input type="hidden" name="costo" value="<%=costo%>"/>
                        </div>
                        <button type="submit" class="btn btn-primary" name="guardar">Guardar</button>                        
                    </form>
                </div>
            </div>
        </div>
    </body>
    <%
        if (request.getParameter("guardar") != null) {
            Conexion.actualizarCantidadProductoPedido(idPedido, idProducto, cantidad, costo);
        }
    %>

</html>
