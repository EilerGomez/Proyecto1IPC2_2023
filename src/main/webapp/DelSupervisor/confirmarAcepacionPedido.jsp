
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
                <label for="exampleInputEmail1" class="form-label">Confirme la aceptacion del pedido: <%=request.getSession().getAttribute("idPedido")%> </label>
                <input type="hidden" name="idPedido" value="<%=request.getSession().getAttribute("idPedido")%>"/>
            </div>
            <button type="submit" class="btn btn-info" name="aceptarPedido" onclick="hizoClick()">Aceptar y salir</button>
            <script>
                function hizoClick() {
                    alert("Se ha aceptado el pedido" + <%=request.getSession().getAttribute("idPedido")%> % > );
                }
            </script>
        </form> 
    </body>
</html>
