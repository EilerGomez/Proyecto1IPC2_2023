<%-- 
    Document   : EditarUsuario
    Created on : 3 mar. 2023, 14:23:10
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id = (request.getParameter("codigo"));
            String name = (request.getParameter("nombre"));
            String nombreUsuario = (request.getParameter("nombreUsuario"));
            String correo = (request.getParameter("correo"));
            String estado = (request.getParameter("activo"));
            String area = "";
            String activo = "No activo";
            if (estado.equals("1")) {
                activo = "activo";
            }
            int numArea = Integer.parseInt(request.getParameter("area"));
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
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="../ServletEditarUsuario" method="get">
                        <div class="mb-3">
                            <label for="dpi" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="dpi" value="<%= name%>" name="nombre" aria-describedby="escribe el nombre" required="Campo requerido">
                        </div>
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre del usuario</label>
                            <input type="text" class="form-control" id="nombre" value="<%= nombreUsuario%>" name="nombreUsuario" aria-describedby="escribe el Nombre del usuario" required="Campo requerido">
                        </div> 
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Correo del Usuario</label>
                            <input type="text" class="form-control" id="nombre" value="<%= correo%>" name="correo" aria-describedby="escribe el correo del usuario" required="Campo requerido">
                        </div> 
                        <div class="mb-3">
                            <label for="nombre" class="form-label" >Estado actual del Usuario:<p style="background: #00e765"><%=activo%></p> </label>
                            <select class="form-select" aria-label="Default select example" id="combo" name="comboboxEstado" >
                                <option value="1">activo</option>
                                <option value="0">no activo</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Area actual del usuario: <p style="background: cyan"><%=area%></p></label>
                            <select class="form-select" aria-label="Default select example" id="combo" name="comboboxArea">
                                <option value="1">Administrador</option>
                                <option value="2">Bodega</option>
                                <option value="3">Tienda</option>
                                <option value="4">Supervisor</option>
                            </select>
                        </div> 
                        <a href="../AreaAdministrador.jsp" class="btn btn-danger">Cancelar<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAAsTAAALEwEAmpwYAAABUklEQVR4nKVTy0rDQBSdr/GBUj8j9BFsDZluMp0/SLvMrG3dtd11YfUrJG3EL1B8xAhOXFjBbMzKuIlQWiM3kJA0EWM9cOAy3HOHe+YMQjm4qVS2LYx7nJAToIlx77pW20K/4bbR2LMpNVxN+/D7/eBzOAwJtcuYx1utqSWKpVyxKUkHTqfzEol+oqOqMwvjeuZmp4A44mu7PTOr1d14gE3pRappNMoKV85sSvXYMJcxL9n45fvBfDqNm6GGs+SQN8a8K0HYRA/N5lHSsFCg60GwWARzw0jVyR5/MAgsjLvoUVFO8/YMhctlyFVxRK4oY/REyPgfA44RBGbtFWT5cH0TNe09NBHACTn/6zNySs9QBEsUS5CwwkFS1ec7QdiJB4RDMK5DwoqI7yVpPyWOAPHklE4gJGBS0jDYmRMyydycBzAHvjA8MdCS5e5lubyR1/wNlsBWjimHUKMAAAAASUVORK5CYII="></a>
                        <button type="submit" name="guardarUsuario" class="btn btn-primary" >Guardar<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAAsTAAALEwEAmpwYAAABqUlEQVR4nJWTTUsCURiFbdvf8SfUrp+Q0DZoEaVNZMYERVCNRRDJWOqUi4pIGWsaTW0sNZuyUlPou4i+KGqR0aKgE/dC6pT2ceDZXM55NpdXx7J8NWcU9JRWV81Ai2DobhtvMZv4rlI6TDzDmvha6FClKw1nFPSKL4fk6gV87g30MS44ZgJYVJLfsE0tvbtHZKdGwhkFPRkf554Q8qbRwzhpeSN9VKBjwInJ+RDcHgUZ9eZNGJamChLunwLS00i4EkHYm0Ev48DCypZGMCOtIRDdLQhUeQcqw76n6hsiGkE2eYd5VxSjNh9s9gUNdqcMUdpGKrGDWUmBZ24ZamPzqUbwG/vJPZypgwiGpzErrcButrYXBIn4KfzhdEWCgWUcrPcBj26cqP2I+SMgW92nILiaQaU8P57hMmWl46vMEMIhmX57WcHNi5ZcNoLDuIWOz3c55B+Oabei4Gu2RAtO1kw4inXSMcmPguuXIqIsQuSbEPdYkM0q9O1XQf61CD82BL/s1bz9S1COsgJyTD55E5e393+CdMmGCj7Pudc8UceyDsNfIF2yIdsPSksBnjSWnyMAAAAASUVORK5CYII="></button>
                        <input type="hidden" name="codigo" value="<%= id%>">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
