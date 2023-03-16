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

                        ResultSet rs = Conexion.traerIdUltimoRegistroPedidos(Integer.parseInt(sesion.getAttribute("id").toString()));
                        int idPedido = 0;
                        while (rs.next()) {
                            idPedido = rs.getInt(1);
                        }
                        double costoTotal = 0;
                        int codigoTienda = Integer.parseInt(sesion.getAttribute("tienda").toString());

            //falta un combobox para agregar los pedidos, y una tabla donde se muestren los productos del pedido actual
                        Conexion.traerProductosDeTienda(codigoTienda);
                    %>
                    <nav style="text-align: center; margin-left: 70px" >
                        <form class="d-flex" action="NuevoPedido.jsp" method="POST" >
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


                    %>

                    <h3>Productos que tiene en la lista el pedido:  <%=idPedido%></h3>
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
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                        <h3>El costo total del pedido es: <%=costoTotal%></h3>
                    </table>
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
                Conexion.actualizarCostoTotalAlPedido(costoTotal, idPedido);
                System.out.println(costoTotal);
                System.out.println(idPedido);
                response.sendRedirect("../AreaTienda.jsp");
            }
        %>

    </body>
</html>
