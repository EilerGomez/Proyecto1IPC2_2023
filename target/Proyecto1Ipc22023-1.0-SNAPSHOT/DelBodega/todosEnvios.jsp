<%-- 
    Document   : tablaPedidos
    Created on : 13 mar. 2023, 23:57:42
    Author     : HP
--%>

<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        %>
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <h2>Pedidos solicitados de las tiendas</h2>
                    <form method="get">
                        <table class="table table-dark table-striped" style="background: #bce8f1">
                            <thead>
                                <tr>
                                    <th scope="col">ID ENVIO</th>
                                    <th scope="col">USUARIO BODEGA</th>
                                    <th scope="col">TIENDA</th>
                                    <th scope="col">DIRECCION</th>
                                    <th scope="col">FECHA SALIDA</th>
                                    <th scope="col">FECHA RECIBIDA</th>
                                    <th scope="col">ESTADO</th>
                                    <th scope="col">TOTAL DEL ENVIO</th>
                                    <th scope="col">VER</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    Conexion.traerEnviosHechosPorUsuarioBodega(Integer.parseInt(request.getSession().getAttribute("id").toString()));
                                    while (Conexion.rs.next()) {
                                %>
                                <tr>
                                    <th scope="col"><%=Conexion.rs.getString(1)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(2)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(3)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(4)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(5)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(6)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(7)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(8)%></th>
                                    <td>
                                        <a href="DelBodega/descripcionEnvio.jsp?idEnvio=<%=Conexion.rs.getString(1)%>&tienda=<%=Conexion.rs.getString(3)%>">
                                           <img src="https://img.icons8.com/ios-filled/25/null/visible--v1.png"/>
                                        </a>
                                    </td>
                                </tr>

                                <%
                                    }
                                %>

                            </tbody>
                        </table>
                    </form>

                </div>
            </div>
        </div>
    </body>
</html>

