
<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Incidencias</title>
    </head>
    <body style="margin-top: 90px; background: #c2edfd">
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <a type="submit" class="btn btn-danger" href="../AreaTienda.jsp">Regresar</a>
                    <table class="table table-striped table-hover " style=" background: white">
                        <thead>
                            <tr>
                                <th scope="col">ID INCIDENCIA</th>
                                <th scope="col">USUARIO</th>
                                <th scope="col">TIENDA</th>
                                <th scope="col">FECHA GENERADA</th>
                                <th scope="col">ESTADO</th>
                                <th scope="col">SOLUCION</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String desde = request.getParameter("desde");
                                String hasta = request.getParameter("hasta");
                                String estado = request.getParameter("combobox");
                                int usuario = Integer.parseInt(request.getSession().getAttribute("id").toString());

                                Conexion.traerIncidenciasXTiempoYEstado(desde, hasta, estado, usuario);
                                while (Conexion.rs.next()) {
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
                        <h3>Incidencias generadas desde <%=desde%>, hasta <%=hasta%></h3>
                    </table>
                </div>
            </div>

        </div>
    </body>
</html>
