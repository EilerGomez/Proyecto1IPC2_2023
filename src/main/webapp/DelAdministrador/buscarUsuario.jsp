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
                    <form method="get" action="DelAdministrador/TablaUsuarios.jsp">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col" class="select2-container">
                                        <select class="form-select" aria-label="Default select example" id="combo" name="combobox" >
                                            <option value="1">Todos</option>
                                            <option value="2">Codigo</option>
                                            <option value="3">Nombre</option>
                                        </select>
                                    </th>
                                    <th scope="col" class="text-center">
                                        <input type="text" name="nombre" class="form-control" placeholder="Busqueda" />
                                    </th>
                                    <th scope="col" class="text-center">
                                        <button type="submit" name="buscar" class="form-control btn btn-primary">Buscar</button>
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                

                            </tbody>
                        </table>
                    </form>

                </div>
            </div>
        </div>

    </body>
</html>
