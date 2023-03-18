
<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Descripcion de la incidencia</title>
    </head>
    <body style="margin-top: 90px; background: #fee9e9">
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <form action="" method="POST">
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Elija una opcion para la devolucion</label>
                        </div>
                        <button class="btn btn-primary" name="aceptar">Aceptar</button>
                        <button class="btn btn-primary" name="rechazar">Rechazar</button>
                    </form>
                    <div style="text-align: right">
                        <a type="submit" class="btn btn-danger" href="../AreaBodega.jsp">Regresar</a>
                    </div>
                    <table class="table table-striped table-hover " style=" background: white">
                        <thead>
                            <tr>
                                <th scope="col">ID PRODUCTO</th>
                                <th scope="col">NOMBRE PRODUCTO</th>
                                <th scope="col">CANTIDAD AFECTADA</th>
                                <th scope="col">MOTIVO INCIDENCIA</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int idDevolucion = Integer.parseInt(request.getParameter("idDevolucion"));
                                Conexion.traerProductosDeDevolucion(idDevolucion);
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
                        <%
                            //solucionar incidencia
                            if (request.getParameter("aceptar") != null) {
                            //cambiar el estado de la devolucion, guardar productos si son dañados o equivocados
                                Conexion.actualizarEstadoDeIncidencia(idIncidencia, request.getParameter("solucion"));
                                response.sendRedirect("../AreaBodega.jsp");
                            }
                        %>

                        <h3>Productos que contiene la incidencia <%=idIncidencia%></h3>
                    </table>
                </div>
            </div>

        </div>
    </body>
</html>
