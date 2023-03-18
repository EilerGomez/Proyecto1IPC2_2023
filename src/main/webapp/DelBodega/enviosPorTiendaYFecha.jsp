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
        %>
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <h2>Envios hechos a la tienda: <%=request.getParameter("tienda")%></h2>
                    <div style="text-align: right">
                        <a type="submit" class="btn btn-danger" href="../AreaBodega.jsp">Regresar</a>

                    </div>
                    <br>
                    <form method="get">
                        <table class="table table-dark table-striped" style="background: #bce8f1">
                            <thead>
                                <tr>
                                    <th scope="col">ID ENVIO</th>
                                    <th scope="col">USUARIO BODEGA</th>
                                    <th scope="col">TIENDA</th>
                                    <th scope="col">FECHA SALIDA</th>
                                    <th scope="col">ESTADO</th>
                                    <th scope="col">TOTAL DEL ENVIO</th>
                                    <th scope="col">VER</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    int usuarioBodegas = Integer.parseInt(request.getSession().getAttribute("id").toString());
                                    int tienda = Integer.parseInt(request.getParameter("tienda"));
                                    String desde = request.getParameter("desde");
                                    String hasta = request.getParameter("hasta");
                                    System.out.println(usuarioBodegas + "_" + tienda + "_" + desde + "_" + hasta);
                                    Conexion.traerPedidosDadoTiendaYRangoFecha(usuarioBodegas, desde, hasta, tienda);
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
                                        <a href="reportesDescripcionEnvio.jsp?desde=<%=desde%>&hasta=<%=hasta%>&tienda=<%=tienda%>&idEnvio=<%=Conexion.rs.getString(1)%>">
                                            <img src="https://img.icons8.com/color/25/null/ophthalmology.png"/>
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

