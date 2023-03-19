
<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Productos</title>
    </head>
    <body style="margin-top: 90px; background: #c2edfd">
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <a type="submit" class="btn btn-danger" href="../AreaTienda.jsp">Regresar</a>
                    <table class="table table-striped table-hover " style=" background: white">
                        <thead>
                            <tr>
                                <th scope="col">ID PRODUCTO</th>
                                <th scope="col">NOMBRE PRODUCTO</th>
                                <th scope="col">COSTO UNITARIO</th>
                                <th scope="col">EXISTENCIAS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int existencia = Integer.parseInt(request.getParameter("existencia"));
                                Conexion.traerProductosMenoresAExistencia(existencia, Integer.parseInt(request.getSession().getAttribute("tienda").toString()));
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
                        <h3>Productos con existencias menores a <%=existencia%></h3>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
