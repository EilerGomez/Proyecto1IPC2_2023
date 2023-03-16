<%-- 
    Document   : LogOut
    Created on : 24 feb. 2023, 05:12:14
    Author     : HP
--%>

<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           HttpSession sesion = request.getSession();
           sesion.invalidate();
           response.sendRedirect("index.jsp");
           Conexion.cerrarConexion();
        %>
    </body>
</html>