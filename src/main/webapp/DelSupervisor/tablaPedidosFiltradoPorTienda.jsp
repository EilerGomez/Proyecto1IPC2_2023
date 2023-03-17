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
        <title>Pedidos pendientes</title>
    </head>
    <body style="background: #eff1f7">
        <%
            int tienda = 0;
            try {
                tienda = Integer.parseInt(request.getParameter("tienda"));
                Conexion.traerPedidosPendientesPorTienda(tienda);
            } catch (NumberFormatException e) {
                out.print("Error en el formato del id de la tienda");
            }
        %>
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <br><br><br><br>
                    <h2>Pedidos PENDIENTES de la tienda: <%=tienda%></h2>
                    <form method="get">
                        <table class="table table-dark table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID PEDIDO</th>
                                    <th scope="col">USUARIO</th>
                                    <th scope="col">TIENDA</th>
                                    <th scope="col">TIPO</th>
                                    <th scope="col">FECHA</th>
                                    <th scope="col">ESTADO</th>
                                    <th scope="col">TOTAL DEL PEDIDO</th>
                                    <th scope="col">APROVACIONES</th>
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
                                    <th scope="col"><%=Conexion.rs.getString(4)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(5)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(6)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(7)%></th>
                                    <td>
                                        <a href="aprobarPedidosPendientes.jsp?idPedido=<%=Conexion.rs.getString(1)%>">
                                            <img src="https://img.icons8.com/ultraviolet/35/null/settings.png"/>
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
