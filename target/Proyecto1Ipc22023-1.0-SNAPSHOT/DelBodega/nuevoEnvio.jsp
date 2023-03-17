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
                        int idPedido = Integer.parseInt(sesion.getAttribute("idPedido").toString());
                        int tienda = Integer.parseInt(sesion.getAttribute("tienda").toString());
                        System.out.println(idEnvio);
                        double costoTotal = 0;
                        //falta un combobox para agregar los pedidos, y una tabla donde se muestren los productos del pedido actual
                        Conexion.traerCatalgosBodega();
                    %>
                    <nav style="text-align: center; margin-left: 70px" >
                        <form class="d-flex" action="">
                            <label class="container-fluid">Selecciona el producto que deseas agregarle al envio <%=idEnvio%></label>
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
                                <input type="number" name="cantidad" class="entrada" required="requerido" value="" placeholder="Ingrese la cantidad" style="width: 260px"/>
                            </div>

                            <div class="container-fluid">

                                <button class="btn btn-info" type="submit" name="botonAgregarProducto">Agregar Producto</button>


                            </div>
                        </form>
                    </nav>
                    <%
                        if (request.getParameter("botonAgregarProducto") != null) {
                            try {
                                int idProducto = Integer.parseInt(request.getParameter("combobox"));
                                int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                                int cantidadExistenciaCatalogo = 0;
                                double costoUnitario = 0;
                                double subTotal = 0;
                                Conexion.traerCatalogoEspecifico(idProducto);
                                while (Conexion.rs.next()) {
                                    cantidadExistenciaCatalogo = Integer.parseInt(Conexion.rs.getString(4));
                                    costoUnitario = Double.parseDouble(Conexion.rs.getString(3));
                                }

                                if (cantidad <= cantidadExistenciaCatalogo) {
                                    Conexion.verificarProductoEnTienda(tienda, idProducto);
                                    while (Conexion.rs.next()) {
                                        subTotal = Math.round((costoUnitario * cantidad) * 100.0) / 100.0;
                                        Conexion.guardarProductosEnvio(idEnvio, idProducto, costoUnitario, cantidad, subTotal);
                                        Conexion.actualizarProductosEnBodega(idProducto, cantidad);
                                        response.sendRedirect("nuevoEnvio.jsp");
                                    }
                                    out.print("<div class=\"alert alert-danger\" role=\"alert\">El producto que intentas enviar no se encuentra dentro del catalogo de la tienda:  " + tienda + " verifica eso</div>");

                                } else {
                                    System.out.println(cantidad);
                                    System.out.println(cantidadExistenciaCatalogo);
                                    out.print("<div class=\"alert alert-danger\" role=\"alert\">La cantidad de producto que has ingresado ha superado el limite de la cantidad que te han enviado</div>");
                                }

                            } catch (NumberFormatException e) {
                                out.print("Formato de numero inválido");
                            }

                        }


                    %>
                    <h3>productos que van dentro del envio <%=idEnvio%> hacia la tienda <%=tienda%></h3>
                    <table class="table table-striped table-hover " style=" background: white">
                        <thead>
                            <tr>
                                <th scope="col">ID PRODUCTO</th>
                                <th scope="col">NOMBRE PRODUCTO</th>
                                <th scope="col">COSTO UNITARIO</th>
                                <th scope="col">CANTIDAD ENVIO</th>
                                <th scope="col">SUBTOTAL</th>
                                <th scope="col">EDITAR</th>

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
                                <td>
                                    <a>
                                        <img src="https://img.icons8.com/metro/25/null/pencil.png"/>
                                    </a>
                                </td>
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                    <h3>El costo total deL ENVIO es: <%=costoTotal%></h3>


                    <br><br>
                    <h3>Productos que tiene en la lista del pedido  <%=idPedido%></h3>
                    <table class="table table-striped table-hover " style=" background: white">
                        <thead>
                            <tr>
                                <th scope="col">ID PRODUCTO</th>
                                <th scope="col">NOMBRE PRODUCTO</th>
                                <th scope="col">COSTO UNITARIO</th>
                                <th scope="col">CANTIDAD PEDIDO</th>
                                <th scope="col">SUBTOTAL</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Conexion.traerListaProductosPedido(idPedido);
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
                    <form class="d-flex">  
                        <div>

                            <button class="btn btn-primary ml-2" type="submit" name="botonAceptarListadoProductos">Guardar y Salir</button>


                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%
            if (request.getParameter("botonAceptarListadoProductos") != null) {
                Conexion.actualizarTotalEnvio(costoTotal, idEnvio);
                Conexion.actualizarEstadoPedido(idPedido, "ENVIADO");
                System.out.println("guardando productos");
                System.out.println(costoTotal + "----" + idEnvio);
                response.sendRedirect("../AreaBodega.jsp");
            }
        %>

    </body>
</html>
