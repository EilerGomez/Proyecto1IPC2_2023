<%-- 
    Document   : reenviarPedido
    Created on : 14 mar. 2023, 12:34:09
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
        Conexion.actualizarEstadoPedido(Integer.parseInt(request.getParameter("idPedido").toString()), "PENDIENTE");
        response.sendRedirect("../AreaTienda.jsp");
        %>
    </body>
</html>
