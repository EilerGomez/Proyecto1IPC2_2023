
<%@page import="java.sql.ResultSet"%>
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
                                <th scope="col">INCIDENCIAS ACTIVAS</th>
                                <th scope="col">DEVOLUCIONES ACTIVAS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String desde = request.getParameter("desde");
                                String hasta = request.getParameter("hasta");
                                int tienda = Integer.parseInt(request.getSession().getAttribute("tienda").toString());
                                int cantidadIncidencias = 0;
                                int cantidadDevoluciones = 0;

                                Conexion.traerEnviosRecibidosEnIntervaloTiempo(desde, hasta, tienda);
                                ResultSet envios = Conexion.rs;
                                while (envios.next()) {
                                    Conexion.traerCantidadIncidenciasODevolucionesActivasDeEnvio(envios.getInt(1), true);
                                    while (Conexion.rs.next()) {
                                        cantidadIncidencias = Conexion.rs.getInt(1);
                                    }
                                    Conexion.traerCantidadIncidenciasODevolucionesActivasDeEnvio(envios.getInt(1), false);
                                    while (Conexion.rs.next()) {
                                        cantidadDevoluciones = Conexion.rs.getInt(1);
                                    }
                            %>
                            <tr>
                                <th scope="col"><%=envios.getString(1)%></th>
                                <th scope="col"><%=envios.getString(2)%></th>
                                <th scope="col"><%=envios.getString(3)%></th>  
                                <th scope="col"><%=envios.getString(4)%></th>
                                <th scope="col"><%=envios.getString(5)%></th>
                                <th scope="col"><%=envios.getString(6)%></th>
                                <th scope="col"><%=envios.getString(7)%></th>
                                <th scope="col"><%=cantidadIncidencias%></th>
                                <th scope="col"><%= cantidadDevoluciones%></th>

                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                        <h3>Envios recibidos desde <%=desde%>, hasta <%=hasta%></h3>
                    </table>
                </div>
            </div>

        </div>
    </body>
</html>
