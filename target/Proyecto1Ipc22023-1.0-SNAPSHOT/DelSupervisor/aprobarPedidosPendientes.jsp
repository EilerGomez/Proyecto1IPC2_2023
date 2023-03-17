<%-- 
    Document   : descripcionPedido
    Created on : 14 mar. 2023, 01:15:37
    Author     : HP
--%>

<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Descripcion del pedido</title>
    </head>
    <body style="margin-top: 90px; background: #fee9e9">
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <div class="row">
                        <li><a href="#" id="AprobarPedido" type="submit" class="btn btn-primary">
                                <img src="https://img.icons8.com/office/30/null/ok--v1.png"/>
                                Aprobar Pedido
                            </a>
                            <a href="#" id="RechazarPedido" type="submit" class="btn btn-danger">
                                <img src="https://img.icons8.com/office/30/null/cancel.png"/>
                                Rechazar Pedido
                            </a>
                        </li>

                    </div>
                    <div style="text-align: right">
                         <a type="submit" class="btn btn-danger" href="../AreaSupervisor.jsp">Regresar</a>
                    </div>
                    <fieldset>
                        <div  id="Contenido">

                            <script type="text/javascript" src="JS/botonesAprobacionPedidos.js"></script>

                        </div>
                    </fieldset>
                    <br><br>
                    <table class="table table-striped table-hover " style=" background: white">
                        <thead>
                            <tr>
                                <th scope="col">ID PRODUCTO</th>
                                <th scope="col">NOMBRE PRODUCTO</th>
                                <th scope="col">COSTO UNITARIO</th>
                                <th scope="col">CANTIDAD</th>
                                <th scope="col">SUBTOTAL</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int idPedido = Integer.parseInt(request.getParameter("idPedido"));
                                request.getSession().setAttribute("idPedido", idPedido);
                                Conexion.traerListaProductosPedido(idPedido);
                                double costoTotal = 0;
                                while (Conexion.rs.next()) {
                                    costoTotal = costoTotal + Double.parseDouble(Conexion.rs.getString(5));
                                    costoTotal = Math.round(costoTotal * 100.0) / 100.0;
                            %>
                            <tr>
                                <th scope="col"><%=Conexion.rs.getString(1)%></th>
                                <th scope="col"><%=Conexion.rs.getString(2)%></th>
                                <th scope="col"><%=Conexion.rs.getString(3)%></th>  
                                <th scope="col"><%=Conexion.rs.getString(4)%></th>  
                                <th scope="col"><%=Conexion.rs.getString(5)%></th>  
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                        <h3>Productos que contiene el pedido: <%=idPedido%></h3>
                        <h3>El costo total del pedido es: <%=costoTotal%></h3>
                    </table>

                </div>
            </div>

        </div>
    </body>
</html>
