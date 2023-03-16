<%-- 
    Document   : NuevoPedido
    Created on : 13 mar. 2023, 15:45:34
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

        <title>JSP Page</title>
    </head>
    <body style="margin-top: 100px; background: #c8eefd">
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <%

                        HttpSession sesion = request.getSession();
                        int idEnvio = Integer.parseInt(sesion.getAttribute("idEnvio").toString());
                        int idIncidencia = Integer.parseInt(sesion.getAttribute("idIncidencia").toString());
                     

                        double costoTotal = 0;
                        //falta un combobox para agregar los pedidos, y una tabla donde se muestren los productos del pedido actual
                        Conexion.traerListaProductosEnvio(idEnvio);
                    %>
                    <nav style="text-align: center; margin-left: 70px" >
                        <form class="d-flex" action="">
                            <label class="container-fluid">Selecciona el producto que deseas agregarle a la incidencia <%=idIncidencia%></label>
                            <div class="container-fluid py-3 mb-4 bg-secondary">

                                <select class="form-select" aria-label="Default select example" name="combobox">
                                    <%
                                        while (Conexion.rs.next()) {
                                    %>
                                    <option value="<%=Conexion.rs.getString(1)%>">P.  <%=Conexion.rs.getString(1)%>___      <%=Conexion.rs.getString(2)%>___    cantidad:<%=Conexion.rs.getString(4)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="container" style="text-align: left">
                                <input type="hidden" name="idEnvio" value="<%=idEnvio%>">
                                <input type="hidden" name="idIncidencia" value="<%=idIncidencia%>">
                                <input type="number" name="cantidad" class="entrada" required="requerido" value="" placeholder="Ingrese la cantidad" style="width: 260px"/>
                                <select class="form-select" aria-label="Default select example" name="motivo">                                    
                                    <option value="PRODUCTO EQUIVOCADO">producto equivocado</option>
                                    <option value="PRODUCTO DAÑADO">producto dañado</option>
                                    <option value="PRODUCTO NO SOLICITADO">producto no solicitado</option>
                                    <option value="FALTANTE DE PRODUCTO">faltante de producto</option>
                                    <option value="SOBRANTE DE PRODUCTO">sobrante de producto</option>
                                </select>
                            </div>

                            <div class="container-fluid">

                                <button class="btn btn-info" type="submit" name="botonAgregarProducto">Agregar Producto</button>


                            </div>
                        </form>
                    </nav>
                    <%
                        if (request.getParameter("botonAgregarProducto") != null) {
                            /* int idProducto = Integer.parseInt(request.getParameter("combobox"));
                            //Conexion.guardarTiendadeBodega(Integer.parseInt(codigoUsuario), codigoTienda));
                            Conexion.traerProducto(Integer.parseInt(request.getParameter("combobox").toString()));
                            double costoUnitario = 0;
                            while (Conexion.rs.next()) {
                                costoUnitario = Double.parseDouble(Conexion.rs.getString("costo"));
                            }
                            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                            double subtotal = costoUnitario * cantidad;
                            subtotal = Math.round(subtotal * 100.0) / 100.0;
                            Conexion.guardarProductosPedido(idPedido, idProducto, costoUnitario, cantidad, subtotal);*/
                            try {
                                int idProducto = Integer.parseInt(request.getParameter("combobox"));
                                int cantidadaAfectada = Integer.parseInt(request.getParameter("cantidad"));
                                String motivo = request.getParameter("motivo");
                                int cantidadEnviada = 0;
                                Conexion.traerListaProductosEnvioUsuario(idEnvio, idProducto);
                                while (Conexion.rs.next()) {
                                    System.out.println(idEnvio);
                                    System.out.println(idProducto);
                                    cantidadEnviada = Integer.parseInt(Conexion.rs.getString(4));
                                }
                                if (cantidadaAfectada <= cantidadEnviada) {
                                    Conexion.guardarListaProductosIncidencia(idIncidencia, idProducto, cantidadaAfectada, motivo);
                                } else {
                                    System.out.println(cantidadaAfectada);
                                    System.out.println(cantidadEnviada);
                                    out.print("<div class=\"alert alert-danger\" role=\"alert\">La cantidad de producto que has ingresado ha superado el limite de la cantidad que te han enviado</div>");
                                }

                            } catch (NumberFormatException e) {
                                out.print("Formato de cantidad inválido");
                            }

                        }


                    %>
                    <h3>productos que van dentro de la incidencia</h3>
                    <table class="table table-striped table-hover " style=" background: white">
                        <thead>
                            <tr>
                                <th scope="col">ID PRODUCTO</th>
                                <th scope="col">NOMBRE PRODUCTO</th>
                                <th scope="col">CANTIDAD</th>
                                <th scope="col">MOTIVO</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%                                Conexion.traerProductosDeIncidencia(idIncidencia);
                                while (Conexion.rs.next()) {
                            %>
                            <tr>
                                <th scope="col"><%=Conexion.rs.getString(1)%></th>
                                <th scope="col"><%=Conexion.rs.getString(2)%></th>
                                <th scope="col"><%=Conexion.rs.getString(3)%></th>
                                <th scope="col"><%=Conexion.rs.getString(4)%></th> 
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                    <br><br>
                    <h3>Productos que tiene en la lista el envio:  <%=idEnvio%></h3>
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
                                Conexion.traerListaProductosEnvio(idEnvio);
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

                    </table>
                    <h3>El costo total del envio es: <%=costoTotal%></h3>
                    <form class="d-flex" action="NuevoPedido.jsp" method="POST">  
                        <div>

                            <button class="btn btn-primary ml-2" type="submit" name="botonAceptarListadoProductos">Guardar y Salir</button>


                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%

            if (request.getParameter("botonAceptarListadoProductos") != null) {
                response.sendRedirect("../AreaTienda.jsp");
            }
        %>

    </body>
</html>
