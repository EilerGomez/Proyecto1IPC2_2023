<%-- 
    Document   : NuevoPedido
    Created on : 13 mar. 2023, 15:45:34
    Author     : HP
--%>

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
                        String mensaje = request.getParameter("mensaje");
                        int idPedido = Integer.parseInt(request.getParameter("idPedido").toString());
                        double costoTotal = 0;
                        int codigoTienda = Integer.parseInt(sesion.getAttribute("tienda").toString());

                        //falta un combobox para agregar los pedidos, y una tabla donde se muestren los productos del pedido actual
                        Conexion.traerProductosDeTienda(codigoTienda);
                    %>
                    <nav style="text-align: center; margin-left: 70px" >
                        <form class="d-flex" action="editarPedidoRechazado.jsp" method="POST" >
                            <label class="container-fluid">Selecciona el producto que deseas agregarle al pedido</label>
                            <div class="container-fluid py-3 mb-4 bg-secondary">

                                <select class="form-select" aria-label="Default select example" name="combobox">
                                    <%                        while (Conexion.rs.next()) {
                                    %>
                                    <option value="<%=Conexion.rs.getString(1)%>">P.  <%=Conexion.rs.getString(1)%>___      <%=Conexion.rs.getString(2)%>___<%=Conexion.rs.getString(3)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="container">
                                <input type="number" name="cantidad" class="entrada" required="requerido" value="" placeholder="Ingrese la cantidad"/>
                                <input type="hidden" name="idPedido" value="<%=idPedido%>"/>
                                <input type="hidden" name="mensjae" value="<%=mensaje%>"/>
                            </div>

                            <div class="container-fluid">

                                <button class="btn btn-info" type="submit" name="botonAgregarProducto">Agregar Producto</button>


                            </div>
                        </form>
                    </nav>
                    <%
                        if (request.getParameter("botonAgregarProducto") != null) {
                            int idProducto = Integer.parseInt(request.getParameter("combobox"));
                            //Conexion.guardarTiendadeBodega(Integer.parseInt(codigoUsuario), codigoTienda));
                            Conexion.traerProducto(Integer.parseInt(request.getParameter("combobox").toString()));
                            double costoUnitario = 0;
                            while (Conexion.rs.next()) {
                                costoUnitario = Double.parseDouble(Conexion.rs.getString("costo"));
                            }
                            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                            double subtotal = costoUnitario * cantidad;
                            subtotal = Math.round(subtotal * 100.0) / 100.0;
                            Conexion.guardarProductosPedido(idPedido, idProducto, costoUnitario, cantidad, subtotal);

                        }
                        if (request.getParameter("borrar") != null) {
                            System.out.println(request.getParameter("idProducto"));
                            Conexion.eliminarProductoDeListaPedidos(idPedido, Integer.parseInt(request.getParameter("idProducto")));
                        }


                    %>
                    <h3>Motivo de rechazo: <%=mensaje%></h3>
                    <h3>Productos que tiene en la lista el pedido:  <%=idPedido%></h3>
                    <table class="table table-striped table-hover " style=" background: white">
                        <thead>
                            <tr>
                                <th scope="col">ID PRODUCTO</th>
                                <th scope="col">NOMBRE PRODUCTO</th>
                                <th scope="col">COSTO UNITARIO</th>
                                <th scope="col">CANTIDAD</th>
                                <th scope="col">SUBTOTAL</th>
                                <th scope="col">EDITAR</th>
                                <th scope="col">ELIMINAR</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Conexion.traerListaProductosPedido(idPedido);
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
                                    <a href="editarCantidadProductoPedido.jsp?idPedido=<%=idPedido%>&idProducto=<%=Conexion.rs.getString(1)%>&nombre=<%=Conexion.rs.getString(2)%>&cantidad=<%=Conexion.rs.getString(4)%>&costo=<%=Conexion.rs.getString(3)%>">
                                        <img src="https://img.icons8.com/metro/25/null/pencil.png"/>
                                    </a>                                    
                                </td>
                                <td>
                                    <form>
                                        <input type="hidden" name="idPedido" value="<%=idPedido%>"/>
                                        <input type="hidden" name="idProducto" value="<%=Conexion.rs.getString(1)%>"/>
                                        <input type="hidden" name="mensjae" value="<%=mensaje%>"/>
                                        <button type="submit" class="btn" name="borrar"><img src="https://img.icons8.com/metro/25/null/trash.png"/></button>
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                        <h3>El costo total del pedido es: <%=costoTotal%></h3>
                    </table>
                    <form class="d-flex" action="editarPedidoRechazado.jsp" method="POST">  
                        <div>
                            <input type="hidden" name="idPedido" value="<%=idPedido%>"/>
                            <input type="hidden" name="mensjae" value="<%=mensaje%>"/>
                            <button class="btn btn-primary ml-2" type="submit" name="botonAceptarListadoProductos">Guardar y Salir</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%

            if (request.getParameter("botonAceptarListadoProductos") != null) {
                Conexion.actualizarCostoTotalAlPedido(costoTotal, idPedido);
                System.out.println(costoTotal);
                System.out.println(idPedido);
                response.sendRedirect("../AreaTienda.jsp");
            }

        %>

    </body>
</html>
