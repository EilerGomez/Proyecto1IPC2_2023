<%-- 
    Document   : descripcionPedido
    Created on : 14 mar. 2023, 01:15:37
    Author     : HP
--%>

<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Descripcion del Envio</title>
    </head>
    <body style="margin-top: 90px; background: #fee9e9">
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <table class="table table-striped table-hover " style=" background: white">
                        <thead>
                            <tr>
                                <th scope="col">ID PRODUCTO</th>
                                <th scope="col">NOMBRE PRODUCTO</th>
                                <th scope="col">COSTO UNITARIO</th>
                                <th scope="col">CANTIDAD</th>
                                <th scope="col">SUBTOTAL</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int idEnvio = Integer.parseInt(request.getParameter("idEnvio"));
                                int tienda = Integer.parseInt(request.getParameter("tienda"));
                                String desde = request.getParameter("desde");
                                String hasta = request.getParameter("hasta");
                                Conexion.traerListaProductosEnvio(idEnvio);
                                double costoTotal = 0;
                                while (Conexion.rs.next()) {
                                    costoTotal = costoTotal + Double.parseDouble(Conexion.rs.getString(5));
                                    costoTotal = Math.round(costoTotal * 100.0) / 100.0;
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
                        <h3>Productos que contiene el envio <%=idEnvio%> realizado a la tienda: <%=request.getParameter("tienda")%></h3>
                        <h3>El costo total del envio es: <%=costoTotal%></h3>
                    </table>
                </div>
            </div>
            <a type="submit" class="btn btn-danger" href="enviosPorTiendaYFecha.jsp?desde=<%=desde%>&hasta=<%=hasta%>&tienda=<%=tienda%>">Regresar</a>
        </div>
    </body>
</html>
