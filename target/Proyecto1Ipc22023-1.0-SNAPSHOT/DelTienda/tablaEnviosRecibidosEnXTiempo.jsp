
<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Envios</title>
    </head>
    <body style="margin-top: 90px; background: #c2edfd">
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <a type="submit" class="btn btn-danger" href="../AreaTienda.jsp">Regresar</a>
                    <table class="table table-striped table-hover " style=" background: white">
                        <thead>
                            <tr>
                                <th scope="col">ID ENVIO</th>
                                <th scope="col">USUARIO</th>
                                <th scope="col">TIENDA</th>
                                <th scope="col">FECHA SALIDA</th>
                                <th scope="col">ESTADO RECIBIDA</th>
                                <th scope="col">$TOTAL ENVIO</th>
                                <th scope="col">ESTADO</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String desde = request.getParameter("desde");
                                String hasta = request.getParameter("hasta");
                                int usuario = Integer.parseInt(request.getSession().getAttribute("id").toString());
                                int cantidadIncidencias = 0;
                                int cantidadDevoluciones = 0;
                                Conexion.traerCantidadIncidenciasEnXTiempo(desde, hasta, usuario, true);
                                while (Conexion.rs.next()) {
                                    cantidadIncidencias = Integer.parseInt(Conexion.rs.getString(1));
                                }
                                Conexion.traerCantidadIncidenciasEnXTiempo(desde, hasta, usuario, false);
                                while (Conexion.rs.next()) {
                                    cantidadDevoluciones = Integer.parseInt(Conexion.rs.getString(1));
                                }
                                Conexion.traerEnviosRecibidosEnIntervaloTiempo(desde, hasta, usuario);
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
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                        <h3>Cantidad de incidencias desde <%=desde%> hasta <%=hasta%> es de: <%=cantidadIncidencias%></h3>
                        <h3>Cantidad de devoluciones desde <%=desde%> hasta <%=hasta%> es de: <%=cantidadDevoluciones%></h3>
                        <h3>Envios recibidos desde <%=desde%>, hasta <%=hasta%></h3>
                    </table>
                </div>
            </div>

        </div>
    </body>
</html>
