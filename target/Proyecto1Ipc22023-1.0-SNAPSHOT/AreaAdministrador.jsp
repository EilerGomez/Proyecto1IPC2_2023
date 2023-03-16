<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Area de Administracion| Inicio</title>       
        <link rel="stylesheet" href="CSS/bootstrap.min.css" type="text/css">
        <link href="CSS/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="CSS/skin-blue.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <%        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
            response.sendRedirect("index.jsp");
        }
        if (!sesion.getAttribute("area").equals("1")) {
            response.sendRedirect("index.jsp");
        }
    %>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <!-- Main Header -->
            <header class="main-header"style="color: thistle";>
                <a href="#" class="logo">
                    <span class="logo-lg"><b>Administracion </b>Administracion</span>
                </a>

                <!-- Navegacion -->
                <nav class="navbar navbar-static-top" role="navigation" style="background-color: #6c98cc">
                    <!-- botón para abrir el menu-->
                    <a href="#"  data-toggle="push-menu" >

                        <img src="https://img.icons8.com/bubbles/64/000000/menu.png"/>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <li> <a href="DelAdministrador/agregarUsuario.jsp" id="agregarUsuario"><img src="https://img.icons8.com/ios-glyphs/30/000000/add-user-male.png"/>Nuevo Usuario</a></li>                            
                            <li> <a href="#" id="agregarTiendaAUsuariosBodega"><img src="https://img.icons8.com/wired/30/000000/warehouse.png"/>Tiendas a Bodega</a></li>                            

                            <li> <a href="#" id="agregarTiendaNormalUsuario"><img src="https://img.icons8.com/carbon-copy/40/null/small-business.png"/>Tienda a Usuario</a></li> 
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAADr0lEQVR4nNWV709bVRjH+853/gv6Rk1MjG98rS+MW28v7a1ZXLYYM02MDrq2sLjye62TCQW2UlZko+2Fe29pCSEzKt2Q/qAOSjSURUMnOmsGw/JjQyhQ6ir0fs1pwoJs5aK3M/GbfJOb8zzn+ZznnCe5CsX/QZyOesVrYDxeg2Ze0NF/evTqdZ+RCQgfKl98IkC7XvlUr5ER+iq06bizUkz5bdiKXMGD0GeY7q7OkQP0nKQ1gl75dFHBXqPmq2DDe5mtby4DY65HnBDqxS/rjqWFUyUZQUcbiwLtPkkd+bzy6Ob2ja7HQnd77Xob+k9rM5yOPiwb7Ctnvpv1nZOE7vhOrwW+cmZcNljQ0ZlsuLMgSBx1kXdGgq8HRp35d/fo1ZuywbyO3tp7zeQgKf9F/NxTh8Gzb8N//h0MNZ1AuOl9kDngdKpt2eBevXo1E3RgYaARQ+dOoNeoge+0Fl+Yj2P0cinuRpsg/i5AXObxtfVdxBxGeAzqlGywr5y59UPnR+g3HcHMjU+RnXcDK8JjfX+qDcKpEvLG07LBXgPD8WWqPLQQcMfb9zhwZSr4jBpBNvhqAxUlxbLJwp3uNsm9ep6KygZf76CypNhBoDvgoQ7qgWxwiKXDAScFcZmThJIckhtk6aD8jjsPPxtk6Vx61iEJ3phxIMTSuZBL9YxsMFGIVQ/8Om7akgKTnHB3Sb+iWBpyH3o5yNKZzFxnQSiJBdmSTOAK9ZKimAo4VRVhToPV2xcfga7cvgASC7JUcf5MexVwKjHCM/h24DhSCVve5HtEYDDspKB4Uhp2KrEwVYPpkTJEBG3eP0VK82skVlRYVbPrkLmN81jauflhF4XEuAGL8dq/mayRmMXOJ83tnMfU6nzjXwPPWF0vmNv5m9auvo3oZFxcWl7F0tz3iHiOYmr4g4fQH8OliAhvYWlmAov3VzAWi4tkj8XOTVa1dj3/j6DVVvdrZ9t61sdv3sqJoojd+iN9Dy0OGxovXUDjpdb8N1nbLbInOhnfrrf1rFW2uF49cKf1tu61xGwShXR3MQVt7SCYWj/uLKwWzPtlJgkCP2Nln5MEk+slnUJCFR1jeUtpLBbPWez8xL5QMhTNXX0be693r9Y3s3iz7hq0ddeQSmf3zSW1yJtXt7peLwj+2M57ySBJdRGIzUFT4887GJs7aNdCQbDFziXJZErpE37iIbhBiEnmk5pmO/9bQXB1iztT1eLCfjY1s/mh2gFrawZhanbvu4eY1JYcsP9CfwEcID2nDJxBGwAAAABJRU5ErkJggg==">                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs"><%=sesion.getAttribute("user")%> </span>
                                </a>


                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="Images/image.jpg" class="img-circle" alt="User Image">

                                        <p>                    
                                            <%=sesion.getAttribute("user")%>

                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="LogOut.jsp" class="btn btn-default btn-flat">Cerrar Session</a>
                                        </div>

                                        <div class="pull-right margin-r-5">
                                            <a href="modificarUsuario.jsp" class="btn btn-default btn-flat">   Mi cuenta  </a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <aside class="main-sidebar">
                <section class="sidebar">
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="https://img.icons8.com/office/40/null/shop.png"/>                        
                        </div>
                        <div class="pull-left info">
                            <p>Bienvenido, <%=sesion.getAttribute("user")%>  </p>
                            <!-- Status -->
                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                             width="10" height="10"
                                             viewBox="0 0 172 172"
                                             style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g><path d="M86,165.55c-43.8643,0 -79.55,-35.6857 -79.55,-79.55c0,-43.8643 35.6857,-79.55 79.55,-79.55c43.8643,0 79.55,35.6857 79.55,79.55c0,43.8643 -35.6857,79.55 -79.55,79.55z" fill="#0bfd39"></path><path d="M86,8.6c42.6775,0 77.4,34.7225 77.4,77.4c0,42.6775 -34.7225,77.4 -77.4,77.4c-42.6775,0 -77.4,-34.7225 -77.4,-77.4c0,-42.6775 34.7225,-77.4 77.4,-77.4M86,4.3c-45.1199,0 -81.7,36.5801 -81.7,81.7c0,45.1199 36.5801,81.7 81.7,81.7c45.1199,0 81.7,-36.5801 81.7,-81.7c0,-45.1199 -36.5801,-81.7 -81.7,-81.7z" fill="#2ecc71"></path></g></g></svg>

                                En línea</a>
                        </div>
                    </div>


                    <ul class="sidebar-menu" data-widget="tree">
                        <li class="header">INICIO</li>
                        <li class="active"><a href="AreaAdministrador.jsp"><img src="https://img.icons8.com/fluency/30/000000/admin-settings-male.png"/></i> <span>Panel Administrativo</span></a></li>
                        <li class="treeview">
                            <a href="#"><img src="https://img.icons8.com/dusk/30/000000/blockchain-new-logo.png"/> <span>Registros</span>                               
                            </a>
                            <ul class="treeview-menu">

                                <li><a href="#" id="users"></i><img src="https://img.icons8.com/fluency/30/000000/group.png"/>Usuarios</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><img src="https://img.icons8.com/color/30/null/archive-folder.png"/> <span>Archivos</span>                                
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#" id="cargaDatos"></i><img src="https://img.icons8.com/color-glass/30/000000/upload-to-ftp.png"/>Cargar datos</a></li>
                            </ul>
                        </li>



                    </ul>

                </section>
            </aside>

            <div class="content-wrapper" style="background-color: rgb(175 216 250)">
                <section class="content-header">
                    <h1>
                        Seccion de reportes
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="LogOut.jsp"> Inicio</a></li>
                        <li class="active">Panel de Area de reportes administrativos</li>
                    </ol>
                </section>

                <section class="content">
                    <div class="row">

                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-gray">
                                <div class="inner">
                                    <p>TIENDAS CON MAS PEDIDO EN TIEMPO</P>

                                    <p>POR ESTADO DE PEDIDO</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="verificar5TiendasMayorPedidos"><img src="https://img.icons8.com/color/48/null/search--v1.png"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-blue-active">
                                <div class="inner">
                                    <p>USUARIOS CON MAS PEDIDOS REALIZADOS</P>

                                    <p>EN UN INTERVALO DE TIEMPO</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="verificar5UsuariosMayorPedidos"><img src="https://img.icons8.com/nolan/48/search.png"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-green-active">
                                <div class="inner">
                                    <p>USUARIOS CON MAS ENVIOS REALIZADOS</P>

                                    <p>EN UN INTERVALO DE TIEMPO</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="verificar5UsuariosMayorEnvios"><img src="https://img.icons8.com/stickers/48/null/search.png"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-purple-active">
                                <div class="inner">
                                    <p>PRODUCTO MAS PEDIDO EN TIENDAS</P>

                                    <p>EN UN INTERVALO DE TIEMPO</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="productoMasPedidoEnTiendas"><img src="https://img.icons8.com/color/48/null/search--v1.png"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-light-blue-gradient">
                                <div class="inner">
                                    <p>PRODUCTOS DAÑADOS EN TIENDAS</P>

                                    <p>EN UN INTERVALO DE TIEMPO</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="productosDañadosEnTiendas"><img src="https://img.icons8.com/nolan/48/search.png"/></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <fieldset style="margin-left: 100px;
                          margin-right: 100px;">
                    <div  id="Contenido">

                        <script type="text/javascript" src="Js/BotonesAdministrador.js"></script>

                    </div>
                </fieldset>

            </div>


            <footer class="main-footer ">
                <div class="pull-right hidden-xs">
                    Eiler Gómez
                </div>
                <strong>Copyright &NIKOCODE; 2023 <a href="#"></a>.</strong>
            </footer>

            <div class="control-sidebar-bg"></div>
        </div>

        <script src="Js/jquery.min.js"></script>
        <script src="Js/bootstrap.min.js"></script>
        <script src="Js/adminlte.min.js"></script>


    </body>
</html>
<%

%>
