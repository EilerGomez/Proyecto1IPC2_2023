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

        <title>Usuarios en Tiendas</title>
    </head>
    <body>
        <%

            String codigo = request.getParameter("codigo");

            Conexion.traerUsuarioTienda();


        %>
        <nav class="navbar navbar-light bg-light">
            <form class="d-flex" action="nuevoUsuarioATienda.jsp" method="POST">  
                <div class="container-fluid py-3 mb-4 bg-secondary">
                    <select class="form-select" aria-label="Default select example" name="combobox">
                        <option selected>Seleccione el usuario para la tienda</option>
                        <%                        while (Conexion.rs.next()) {
                        %>
                        <option value="<%=Conexion.rs.getString(1)%>"><%=Conexion.rs.getString(1)%>--><%=Conexion.rs.getString(2)%>, <%=Conexion.rs.getString(3)%>, <%=Conexion.rs.getString(4)%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="container-fluid">


                    <input type="hidden" name="codigo" value="<%=codigo%>">
                    <input type="hidden" name="nombre" value="<%=request.getParameter("direccion")%>">
                    <button class="btn btn-primary ml-2" type="submit" name="botonAgregarTienda">Agregar usuario</button>


                </div>
            </form>
            <a href="../AreaAdministrador.jsp" class="btn btn-danger" type="submit"> Regresar</a>
        </nav>
        <%
            if (request.getParameter("botonAgregarTienda") != null) {
                String codigoTienda = request.getParameter("codigo");
                String codigoUsuario = request.getParameter("combobox");
                Conexion.guardarUsuarioTienda(Integer.parseInt(codigoUsuario), Integer.parseInt(codigoTienda));
            }


        %>
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <h3>Usuarios que tiene asignados la tienda ubucada en <%=request.getParameter("direccion")%></h3>
                    <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">NOMBRE</th>
                                    <th scope="col">NOMBRE DE USUARIO</th>
                                    <th scope="col">CORREO</th>
                                    <th scope="col">AREA</th>
                                    <th scope="col">ESTADO</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Conexion.traerUsuariosDeUnaTienda(Integer.parseInt(codigo));
                                    while (Conexion.rs.next()) {
                                        String estado = "inactivo";
                                        if (Conexion.rs.getString("activo").equals("1")) {
                                            estado = "activo";
                                        }
                                        String area = null;
                                        int numArea = Integer.parseInt(Conexion.rs.getString("area"));
                                        switch (numArea) {
                                            case 1:
                                                area = "Administracion";
                                                break;
                                            case 2:
                                                area = "Bodega";
                                                break;
                                            case 3:
                                                area = "Tienda";
                                                break;
                                            case 4:
                                                area = "Supervisor";
                                                break;
                                            default:
                                                break;

                                        }

                                %>
                                <tr>
                                    <th scope="col"><%=Conexion.rs.getString(1)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(2)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(3)%></th>
                                    <th scope="col"><%=Conexion.rs.getString(4)%></th>
                                    <th scope="col"><%=area%></th>
                                    <th scope="col"><%=estado%></th>

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
