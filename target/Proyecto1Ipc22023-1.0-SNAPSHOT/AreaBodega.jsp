<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
        response.sendRedirect("index.jsp");
    }
    if (!sesion.getAttribute("area").equals("2")) {
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Area de Fábrica| Inicio</title>       
        <link rel="stylesheet" href="CSS/bootstrap.min.css" type="text/css">


        <link href="CSS/AdminLTE.min.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="CSS/skin-blue.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>

    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <!-- Main Header -->
            <header class="main-header">
                <a href="#" class="logo">
                    <span class="logo-lg"><b>Bodega central </b></span>
                </a>

                <!-- Navegacion -->
                <nav class="navbar navbar-static-tp" role="navigation" style="background: #bce8f1">
                    <!-- botón para abrir el menu-->
                    <a href="#"  data-toggle="push-menu" >

                        <img src="https://img.icons8.com/nolan/64/drag-list-down.png"/>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <li><a href="#" id="nuevoEnvio"><img src="https://img.icons8.com/color/30/null/paper-plane.png"/> Nuevo Envio</a></li>
                            <li><a href="#" id="solucionarIncidencias"><img src="https://img.icons8.com/dusk/30/null/light-automation.png"/> Solucionar incidencias</a></li>
                            <li><a href="#" id="recibirDevoluciones"><img src="https://img.icons8.com/fluency/25/null/refresh.png"/> Recibir devoluciones</a></li>


                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="Images/bodega.jpg" class="user-image" alt="User Image">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs"> <%=sesion.getAttribute("user")%> </span>
                                </a>


                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="Images/bodega.jpg" class="img-circle" alt="User Image">

                                        <p>                    
                                            <%=sesion.getAttribute("user")%>
                                            <small>Usted es,<%=sesion.getAttribute("user")%> </small>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="LogOut.jsp" class="btn btn-default btn-flat">Cerrar Session</a>
                                        </div>

                                        <div class="pull-right margin-r-5">
                                            <a href="#" class="btn btn-default btn-flat">   Mi cuenta  </a>
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
                            <img src="Images/bodega.jpg" class="img-circle" alt="User Image">
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
                        <li class="active"><a href=""><img src="https://img.icons8.com/nolan/30/manufacturing.png"/></i> <span>Panel</span></a></li>
                        <li class="treeview">
                            <a href="#"><img src="https://img.icons8.com/nolan/30/send-file.png"/><span>Envios</span>                               
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#" id="TodosEnvios"><img src="https://img.icons8.com/color/30/000000/show-property.png"/>Todos</a></li>
                            </ul>

                        </li>
                        <li class="treeview">
                            <a href="#"><span><img src="https://img.icons8.com/dusk/25/null/inconsistency.png"/> Incidencias</span>                               
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#" id="todasIncidencias"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAcUlEQVR4nGNgGAWkAN5Lr7z5Lr1+wn/pzX8Y5rv0+jHvxbeeDNQAIMOQDYdbcvH1I6pYgM1wfiimim9JsYCPHN+SYgE/CWpHLfg/GkT/R1PR4MxofLQuKngvvvVEtwRkON+Ftx4DV1zzkuOqUcBAIQAAASZq8/MiJ6UAAAAASUVORK5CYII=">
                                        Todas</a></li>
                                <li>
                                    <a href="#" id="incidenciasActivas"><img src="https://img.icons8.com/color/25/null/checked-checkbox.png"/>
                                        Activas</a>
                                </li> 
                            </ul>                           


                        </li>
                        <li class="treeview">
                            <a href="#"><span><img src="https://img.icons8.com/fluency/25/null/refresh.png"/> Devoluciones</span>                               
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#" id="todasDevoluciones"><img src="https://img.icons8.com/color/23/null/checklist.png"/>
                                        Todas</a></li>
                                <li>
                                    <a href="#" id="devolucionesActivas"><img src="https://img.icons8.com/color/25/null/checked-checkbox.png"/>
                                        Activas</a>
                                </li>
                            </ul>

                        </li>
                    </ul>

                </section>
            </aside>

            <div class="content-wrapper" style="background: #ccc">
                <section class="content-header">
                    <h1>
                        Reportes de Bodega
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="LogOut.jsp"> Inicio</a></li>
                        <li class="active">Panel de reportes de bodegas</li>
                    </ol>
                </section>

                <section class="content">
                    <div class="row">

                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-info">
                                <div class="inner">
                                    <h4>Buscar envios filtrados por tienda e intervalo</h4>
                                    <h4>de tiempo</h4>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="buscarEnviosFiltradosTiendaYFecha"><img src="https://img.icons8.com/arcade/50/null/view-file.png"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-aqua-active">
                                <div class="inner">
                                    <h4>Buscar incidencias solucionadas filtradas por</h4>
                                    <h4>tienda e intervalo de tiempo</h4>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="buscarIncidenciasSolucionadas"><img src="https://img.icons8.com/dusk/50/null/view-file.png"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-blue-gradient">
                                <div class="inner">
                                    <h4>Buscar devoluciones de una tienda filtradas</h4>
                                    <h4>por intervalo de tiempo y estado</h4>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="buscarDevolucionesPorTiendaFechaYestadp"><img src="https://img.icons8.com/officel/50/null/view-file.png"/></a>
                                </div>
                            </div>
                        </div>

                    </div>
                </section>
                <fieldset>
                    <div  id="Contenido">
                        <script type="text/javascript" src="Js/botonesBodega.js"></script>
                    </div>
                </fieldset>

            </div>


            <footer class="main-footer ">
                <div class="pull-right hidden-xs">
                    Eiler Gómez
                </div>
                <strong>Copyright &NIKOCODE; 2023 <a href="#">MI</a>.</strong>
            </footer>

            <div class="control-sidebar-bg"></div>
        </div>

        <script src="Js/jquery.min.js"></script>
        <script src="Js/bootstrap.min.js"></script>
        <script src="Js/adminlte.min.js"></script>


    </body>
</html>
<%
    /*} else {
        response.sendRedirect("identificar.jsp");
    }*/
%>
