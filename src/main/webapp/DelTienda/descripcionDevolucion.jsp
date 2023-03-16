
<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Descripcion de la devolucion</title>
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
                                <th scope="col">CANTIDAD AFECTADA</th>
                                <th scope="col">COSTO UNITARIO</th>
                                <th scope="col">MOTIVO</th>
                                <th scope="col">SUBTOTAL</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int idDevolucion = Integer.parseInt(request.getParameter("idDevolucion"));
                                Conexion.traerProductosDeDevolucion(idDevolucion);
                                double total=0;
                                while (Conexion.rs.next()) {
                                total = total + Double.parseDouble(Conexion.rs.getString(6));
                                    total = Math.round(total * 100.0) / 100.0;
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

                        <h3>Productos que contiene la incidencia <%=idDevolucion%></h3>
                        <h3>El total de la devolucion es: <%=total%></h3>
                    </table>
                </div>
            </div>
            <a type="submit" class="btn btn-danger" href="../AreaTienda.jsp">Regresar</a>
        </div>
    </body>
</html>
