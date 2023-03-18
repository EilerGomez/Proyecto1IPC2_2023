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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
        %>
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <h2>Incidencias activas o por solucionar</h2>
                    <div style="text-align: right">
                        <a type="submit" class="btn btn-danger" href="../AreaBodega.jsp">Regresar</a>
                    </div>
                    <form method="get">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID INCIDENCIA</th>
                                    <th scope="col">USUARIO</th>
                                    <th scope="col">TIENDA</th>
                                    <th scope="col">FECHA</th>
                                    <th scope="col">ESTADO</th>
                                    <th scope="col">SOLUCIONAR</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    try {
                                        int tienda = Integer.parseInt(request.getParameter("tienda"));
                                        Conexion.traerIncidenciasActivasPorTienda(Integer.parseInt(sesion.getAttribute("id").toString()), tienda);
                                    } catch (NumberFormatException e) {
                                        out.print("Formato de numero invalido");
                                    }

                                    while (Conexion.rs.next()) {
                                %>
                                <tr>
                                    <th scope="col"><%=Conexion.rs.getString(1)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(2)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(3)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(4)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(5)%></th>
                                    <td>
                                        <a href="solucionarIncidencias.jsp?idIncidencia=<%=Conexion.rs.getString(1)%>">
                                            <img src="https://img.icons8.com/office/25/null/light-automation.png"/>
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

