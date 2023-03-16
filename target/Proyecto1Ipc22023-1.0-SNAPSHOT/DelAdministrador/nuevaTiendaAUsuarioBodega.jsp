<%-- 
    Document   : nuevaTiendaAUsuarioBodega
    Created on : 6 mar. 2023, 20:52:38
    Author     : HP
--%>

<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Tiendas de Bodegas</title>
    </head>
    <body>
        <%

            String codigo = request.getParameter("codigo");

            Conexion.traerTiendas();


        %>
        <nav class="navbar navbar-light bg-light">
            <form class="d-flex" action="nuevaTiendaAUsuarioBodega.jsp" method="POST">  
                <div class="container-fluid py-3 mb-4 bg-secondary">
                    <select class="form-select" aria-label="Default select example" name="combobox">
                        <option selected>Seleccione la tienda que desee agregar</option>
                        <%                        while (Conexion.rs.next()) {
                        %>
                        <option value="<%=Conexion.rs.getString(1)%>"><%=Conexion.rs.getString(2)%>, <%=Conexion.rs.getString(3)%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="container-fluid">


                    <input type="hidden" name="codigo" value="<%=codigo%>">
                    <input type="hidden" name="nombre" value="<%=request.getParameter("nombre")%>">
                    <button class="btn btn-primary ml-2" type="submit" name="botonAgregarTienda">Agregar tienda</button>


                </div>
            </form>
            <a href="../AreaAdministrador.jsp" class="btn btn-danger" type="submit"> Regresar</a>
        </nav>
        <%
            if (request.getParameter("botonAgregarTienda") != null) {
                String codigoUsuario = request.getParameter("codigo");
                String codigoTienda = request.getParameter("combobox");
                Conexion.guardarTiendadeBodega(Integer.parseInt(codigoUsuario), Integer.parseInt(codigoTienda));
            }


        %>
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <h3>Tiendas que tiene asignadas <%=request.getParameter("nombre")%> trabajador de bodega central</h3>
                    <table class="table table-striped table-hover ">
                        <thead>
                            <tr>
                                <th scope="col"> TIENDA</th>
                                <th scope="col">DIRECCION</th>
                                <th scope="col">TIPO</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Conexion.traerTiendasDeUnUsuario(Integer.parseInt(codigo));
                                while (Conexion.rs.next()) {
                            %>
                            <tr>
                                <th scope="col"><%=Conexion.rs.getString(1)%></th>
                                <th scope="col"><%=Conexion.rs.getString(2)%></th>
                                <th scope="col"><%=Conexion.rs.getString(3)%></th>                               
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </body>
</html>
