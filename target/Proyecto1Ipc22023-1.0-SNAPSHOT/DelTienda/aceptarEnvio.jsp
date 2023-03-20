<%-- 
    Document   : descripcionPedido
    Created on : 14 mar. 2023, 01:15:37
    Author     : HP
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
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
                    <form action="" method="POST">
                        <button class="btn btn-primary" name="confirmar">Marcar como completado</button>
                    </form>

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
                                HttpSession sesion = request.getSession();
                                int idEnvio = Integer.parseInt(request.getParameter("idEnvio"));
                                int idPedido = Integer.parseInt(request.getParameter("idPedido"));
                                System.out.println(idPedido + ": pedido del envio");
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
                        <%
                            if (request.getParameter("confirmar") != null) {
                                Conexion.traerListaProductosEnvio(idEnvio);
                                ResultSet tablaviene = Conexion.rs;
                                while (tablaviene.next()) {
                                    Conexion.traerCatalogoDeTienda(Integer.parseInt(sesion.getAttribute("tienda").toString()), Integer.parseInt(tablaviene.getString(1)));
                                    while (Conexion.rs.next()) {
                                        int nuevaCantidad = Integer.parseInt(Conexion.rs.getString(3)) + Integer.parseInt(tablaviene.getString(4));
                                        Conexion.actualizarCantidadCatalogoEnTienda(Integer.parseInt(sesion.getAttribute("tienda").toString()), Integer.parseInt(tablaviene.getString(1)), nuevaCantidad);
                                    }
                                }
                                Calendar calendario = new GregorianCalendar();
                                String fecha = "";
                                String año = String.valueOf(calendario.get(Calendar.YEAR));
                                String mes = String.valueOf(calendario.get(Calendar.MONTH) + 1);
                                String dia = String.valueOf(calendario.get(Calendar.DAY_OF_MONTH));
                                fecha = año + "-" + mes + "-" + dia;
                                System.out.println(fecha);
                                Conexion.actualizarEstadoEnvio(idEnvio, "RECIBIDO", fecha);
                                Conexion.actualizarEstadoPedido(idPedido, "COMPLETADO");
                                response.sendRedirect("../AreaTienda.jsp");
                            }
                        %>
                        <h3>Productos que contiene el envio <%=idEnvio%></h3>
                        <h3>El costo total del envio es: <%=costoTotal%></h3>
                    </table>
                </div>
            </div>
            <a type="submit" class="btn btn-danger" href="../AreaTienda.jsp">Regresar</a>
        </div>
    </body>
</html>
