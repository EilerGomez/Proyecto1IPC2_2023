<%-- 
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
            HttpSession sesion = request.getSession();
        %>
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <h2>Devoluciones activas o por solucionar</h2>
                    <form method="get">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID DEVOLUCION</th>
                                    <th scope="col">USUARIO</th>
                                    <th scope="col">TIENDA</th>
                                    <th scope="col">FECHA</th>
                                    <th scope="col">ESTADO</th>
                                    <th scope="col">TOTAL</th>
                                    <th scope="col">SOLUCIONAR</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    Conexion.traerDevolucionesActivas(Integer.parseInt(sesion.getAttribute("id").toString()));
                                    while (Conexion.rs.next()) {
                                %>
                                <tr>
                                    <th scope="col"><%=Conexion.rs.getString(1)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(2)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(3)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(4)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(5)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(6)%></th>
                                    <td>
                                        <a href="DelBodega/solucionarDevolucion.jsp?idDevolucion=<%=Conexion.rs.getString(1)%>&tienda=<%=Conexion.rs.getString(3)%>">
                                            <img src="https://img.icons8.com/emoji/25/null/light-bulb-emoji.png"/>
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

