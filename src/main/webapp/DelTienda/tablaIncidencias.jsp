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
                    <h2>Incidencias hechas por la tienda <%=sesion.getAttribute("tienda")%> y por el usuario: <%=sesion.getAttribute("user")%></h2>
                    <form method="get">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID INCIDENCIA</th>
                                    <th scope="col">USUARIO</th>
                                    <th scope="col">TIENDA</th>
                                    <th scope="col">FECHA</th>
                                    <th scope="col">ESTADO</th>
                                    <th scope="col">SOLUCION</th>
                                    <th scope="col">ID ENVIO</th>
                                    <th scope="col">VER</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    Conexion.traerIncidencias(Integer.parseInt(sesion.getAttribute("id").toString()));
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
                                    <td>
                                        <a href="DelTienda/descripcionIncidencia.jsp?idIncidencia=<%=Conexion.rs.getString(1)%>">
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

