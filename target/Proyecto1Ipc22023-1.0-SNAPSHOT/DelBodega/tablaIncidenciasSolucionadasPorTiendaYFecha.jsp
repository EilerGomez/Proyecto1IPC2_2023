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
                    <h2>Incidencias solucionadas</h2>
                    <form method="get">
                        <div style="text-align: right"><a type="submit" class="btn btn-danger" href="../AreaBodega.jsp">Regresar</a></div>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID INCIDENCIA</th>
                                    <th scope="col">USUARIO TIENDA</th>
                                    <th scope="col">TIENDA</th>
                                    <th scope="col">FECHA</th>
                                    <th scope="col">ESTADO</th>
                                    <th scope="col">SOLUCION</th>
                                    <th scope="col">VER</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    int usuario = (Integer.parseInt(sesion.getAttribute("id").toString()));
                                    int tienda = Integer.parseInt(request.getParameter("tienda"));
                                    String desde = (request.getParameter("desde"));
                                    String hasta = (request.getParameter("hasta"));
                                    Conexion.traerIncidenciasSolucionadasPorTiendaYFecha(usuario, tienda, desde, hasta);
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
                                        <a href="reportesDescripcionIncidenciaXTYF.jsp?idIncidencia=<%=Conexion.rs.getString(1)%>&desde=<%=desde%>&hasta=<%=hasta%>&tienda=<%=tienda%>">
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

