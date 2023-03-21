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
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <h2>Catalogo GENERAL de la bodega central</h2>
                    <form method="get">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID PRODUCTO</th>
                                    <th scope="col">NOMBRE PRODUCTO</th>
                                    <th scope="col">COSTO</th>
                                    <th scope="col">EXISTENCIAS</th>
                                    <th scope="col">PRECIO</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    Conexion.traerCatalgosBodega();
                                    while (Conexion.rs.next()) {
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
                        </table>
                    </form>

                </div>
            </div>
        </div>
    </body>
</html>
