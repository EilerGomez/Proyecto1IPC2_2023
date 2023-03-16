<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


        <title>Insertar</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm" style="background: #dbeced; border: 4px solid;" >
                    <form method="post" action="ServletAgregarUsuario">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required="Campo requerido" placeholder="Escribe el nombre">
                        </div>
                        <div class="mb-3">
                            <label for="nombreUsuario" class="form-label">Nombre de usuario</label>
                            <input type="text" class="form-control" id="nombreUsuario" name="nombreUsuario" placeholder="Escribe el nombre de usuario" required="Campo requerido">
                        </div>
                        <div class="mb-3">
                            <label for="correo" class="form-label">Correo</label>
                            <input type="text" class="form-control" id="correo" name="correo" placeholder="Escribe el correo del usuario">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" id="password" name="password1" placeholder="Contraseña para el usuario" required="Campo requerido">
                        </div>
                        <div class="mb-3">
                            <label for="password2" class="form-label">Confirme contraseña</label>
                            <input type="password" class="form-control" id="password2" name="password2" placeholder="Repita la contraseña del usuario" required="Campo requerido">
                        </div>
                        <div class="mb-3">
                            <label >AREA A LA QUE PERTENECERÁ</label> 
                            <div>
                                <select class="form-select" aria-label="Default select example" id="combo" name="combobox" >
                                    <option value="1">Administrador</option>
                                    <option value="2">Bodega</option>
                                    <option value="3">Tienda</option>
                                    <option value="4">Supervisor</option>
                                </select>
                            </div> 
                        </div>
                        <div class="mb-3">
                            <label >ESTADO</label> 
                            <div>
                                <select class="form-select" aria-label="Default select example" id="combo" name="comboEstado" >
                                    <option value="1">Activo</option>
                                    <option value="0">Inactivo</option>
                                </select>
                            </div> 
                        </div>
                        <br><!-- comment -->
                        <div class="mb-3">
                            <button type="submit" name="guardarUsuario" class="btn btn-primary btn-lg" id="botonGuardarUsuario">Guardar<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAACXBIWXMAAAsTAAALEwEAmpwYAAABqUlEQVR4nJWTTUsCURiFbdvf8SfUrp+Q0DZoEaVNZMYERVCNRRDJWOqUi4pIGWsaTW0sNZuyUlPou4i+KGqR0aKgE/dC6pT2ceDZXM55NpdXx7J8NWcU9JRWV81Ai2DobhtvMZv4rlI6TDzDmvha6FClKw1nFPSKL4fk6gV87g30MS44ZgJYVJLfsE0tvbtHZKdGwhkFPRkf554Q8qbRwzhpeSN9VKBjwInJ+RDcHgUZ9eZNGJamChLunwLS00i4EkHYm0Ev48DCypZGMCOtIRDdLQhUeQcqw76n6hsiGkE2eYd5VxSjNh9s9gUNdqcMUdpGKrGDWUmBZ24ZamPzqUbwG/vJPZypgwiGpzErrcButrYXBIn4KfzhdEWCgWUcrPcBj26cqP2I+SMgW92nILiaQaU8P57hMmWl46vMEMIhmX57WcHNi5ZcNoLDuIWOz3c55B+Oabei4Gu2RAtO1kw4inXSMcmPguuXIqIsQuSbEPdYkM0q9O1XQf61CD82BL/s1bz9S1COsgJyTD55E5e393+CdMmGCj7Pudc8UceyDsNfIF2yIdsPSksBnjSWnyMAAAAASUVORK5CYII="></button>

                        </div>
                    </form>
                    <%
                        
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
