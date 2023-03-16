<%-- 
    Document   : Tables
    Created on : 20 feb. 2023, 10:31:33
    Author     : HP
--%>

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
                                    <th scope="col">ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <jsp:include page="../ServletTablaUsuarios"/>
                            </tbody>
                        </table>
                    </form>

                </div>
            </div>
        </div>

    </body>
</html>
