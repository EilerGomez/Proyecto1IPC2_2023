
<%@page import="java.sql.*"%>
<%@page import="SQL.Conexion"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabla SQL</title>
    </head>
    <body>
        <%
             Conexion.traerTiendas();
        %>
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <form method="get">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">TIENDA</th>
                                    <th scope="col">DIRECCION</th>
                                    <th scope="col">TIPO</th>
                                    <th scope="col">ASIGNAR USUARIO</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    while (Conexion.rs.next()) {
                                        

                                %>
                                <tr>
                                    <th scope="col"><%=Conexion.rs.getString(1)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(2)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(3)%></th>
                                    <td>
                                        <a href="DelAdministrador/nuevoUsuarioATienda.jsp?codigo=<%=Conexion.rs.getString(1)%>&direccion=<%=Conexion.rs.getString(2)%>">
                                            <img src="https://img.icons8.com/metro/26/null/plus-2-math.png"/>

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
