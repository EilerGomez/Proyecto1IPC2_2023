
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../guardarAprobacionPedido" method="POST">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Motivo</label>
                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="mensaje">
                <input type="hidden" name="idPedido" value="<%=request.getSession().getAttribute("idPedido")%>"/>
                <div id="emailHelp" class="form-text">Ingrese un mensaje con la descripcion o el motivo del rechazo del pedido <%=request.getSession().getAttribute("idPedido")%></div>
            </div>
            <button type="submit" class="btn btn-primary" name="aceptarRechazo" onclick="hizoClick()">Aceptar y salir</button>
            <script>
                function hizoClick() {
                    alert("Se ha rechazado el pedido" + <%=request.getSession().getAttribute("idPedido")%>%>);
                }
            </script>
        </form> 
    </body>
</html>
