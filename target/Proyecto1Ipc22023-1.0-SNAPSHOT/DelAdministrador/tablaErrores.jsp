


<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Tabla</title>
    </head>
    <body>

        <div class="container ">            
            <div class="row mt-2">
                <div class="col-sm">
                    <form method="get">
                        <table class="table table-dark">
                            <br></br>
                            <div>

                                <div class="alert alert-danger" role="alert">
                                    <h3>Listado de Errores de carga de archivos</h3>
                                </div>
                                <br>
                                <a type="submit" class="btn btn-primary" href="../AreaAdministrador.jsp">ACEPTAR Y REGRESAR</a>

                            </div>
                            <br>

                            <thead>
                                <tr>
                                    <th scope="col">NUMERO</th>
                                    <th scope="col">DESCRIPCION</th>
                                </tr>
                            </thead>
                            <tbody>                                
                                <%
                                    int numero = 0;
                                    for (String error : Conexion.errores) {
                                        numero++;
                                %>
                                <tr>
                                    <th scope="col"><%=numero%></th>
                                    <th scope="col"><%=error%></th>
                                </tr>

                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                        <br></br>

                    </form>

                </div>
            </div>
        </div>

    </body>
</html>
