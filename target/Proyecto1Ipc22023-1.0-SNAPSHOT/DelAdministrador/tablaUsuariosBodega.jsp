
<%@page import="java.sql.*"%>
<%@page import="SQL.Conexion"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabla SQL</title>
    </head>
    <body>
        <%
            ResultSet resultado = Conexion.traerUsuarioBodega();
        %>
        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <form method="get">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">NOMBRE</th>
                                    <th scope="col">NOMBRE DE USUARIO</th>
                                    <th scope="col">CORREO</th>
                                    <th scope="col">AREA</th>
                                    <th scope="col">ESTADO</th>
                                    <th scope="col">VER</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    while (Conexion.rs.next()) {
                                        String estado = "inactivo";
                                        if (resultado.getString("activo").equals("1")) {
                                            estado = "activo";
                                        }
                                        String area = null;
                                        int numArea = Integer.parseInt(resultado.getString("area"));
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
                                    <td>
                                        <a href="DelAdministrador/nuevaTiendaAUsuarioBodega.jsp?codigo=<%=Conexion.rs.getString(1)%>&nombre=<%=Conexion.rs.getString(2)%>">
                                            <img src="https://img.icons8.com/metro/26/null/visible.png"/>

                                        </a>
                                    </td>
                                </tr>

                                <%
                                    }
                                %>

                            </tbody>
                        </table>
                    </form>

                </div>
            </div>
        </div>

    </body>
</html>
