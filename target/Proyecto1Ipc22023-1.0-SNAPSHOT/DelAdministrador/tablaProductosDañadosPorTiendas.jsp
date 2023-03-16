<%-- 
    Document   : Tables
    Created on : 20 feb. 2023, 10:31:33
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<%@page import="SQL.Conexion"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Tabla</title>
    </head>
    <body>
        <%
            String fechaDesde = request.getParameter("desde");
            String fechaHasta = request.getParameter("hasta");
            if (request.getParameter("aceptar") != null) {
                System.out.println(fechaDesde + ", " + fechaHasta);
                Conexion.traerProductoDañadoPorTiendas(fechaDesde, fechaHasta);
            }
            double total = 0;
        %>

        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <form method="get">
                        <table class="table table-striped" style="background: #d2d9da">
                            <br></br>
                            <div>
                                <label style="background: #69e2fb;">Listado los pedidos dañados por tiendas del <%=fechaDesde%> hasta <%=fechaHasta%></label>

                            </div>
                            <br></br>

                            <thead>
                                <tr>
                                    <th scope="col">ID PRODUCTO</th>
                                    <th scope="col">NOMBRE PRODUCTO</th>
                                    <th scope="col">MOTIVO</th>
                                    <th scope="col">TIENDA</th>
                                    <th scope="col">DIRECCION</th>
                                    <th scope="col">COSTO</th>
                                </tr>
                            </thead>
                            <tbody>                                
                                <%
                                    while (Conexion.rs.next()) {

                                        total = total + Double.parseDouble(Conexion.rs.getString(6));
                                %>
                                <tr>
                                    <th scope="col"><%=Conexion.rs.getString(1)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(2)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(3)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(4)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(5)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(6)%></th>
                                </tr>

                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                        <br></br>
                        <div>
                            <label>El costo total por los productos dañados es: <%=total%></label>
                        </div>
                        <br></br>
                        <a type="submit" class="btn btn-primary" href="../AreaAdministrador.jsp">Regresar</a>
                    </form>

                </div>
            </div>
        </div>

    </body>
</html>
