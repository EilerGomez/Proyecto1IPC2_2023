
<%@page import="java.sql.SQLException"%>
<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% HttpSession sesion = request.getSession();
    if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
        response.sendRedirect("index.jsp");
    }
    if (!sesion.getAttribute("area").equals("4")) {
        response.sendRedirect("index.jsp");
    }


%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Area de Supervision| Inicio</title>       
        <link rel="stylesheet" href="CSS/bootstrap.min.css" type="text/css">


        <link href="CSS/AdminLTE.min.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="CSS/skin-blue.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>

    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <!-- Main Header -->
            <header class="main-header"style="color: #3366ff";>
                <a href="#" class="logo">
                    <span class="logo-lg"><b>Supervisores </b></span>
                </a>

                <!-- Navegacion -->
                <nav class="navbar navbar-static-top" role="navigation" style="background-color: #14d1ff">
                    <!-- botón para abrir el menu-->
                    <a href="#"  data-toggle="push-menu" >

                        <img src="https://img.icons8.com/nolan/64/drag-list-down.png"/>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <li><a href="#" id="AprobarPedidos">
                                    <img src="https://img.icons8.com/dusk/45/null/check-file.png"/>
                                    Aprobar Pedidos
                                </a></li>
                            <li>
                                <a href="#" id="buscarPorTienda"><img src="https://img.icons8.com/color/45/null/search--v1.png"/> Buscar por tienda</a>
                            </li>


                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="Images/Image2.jpg" class="user-image" alt="User Image">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs"> <%=sesion.getAttribute("user")%></span>
                                </a>


                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="Images/Image2.jpg" class="img-circle" alt="User Image">

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
                <section class="select2-container">
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="Images/Image2.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Bienvenido, <%=sesion.getAttribute("user")%></p>
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
                        <li class="active"><a href=""><img src="https://img.icons8.com/nolan/30/manufacturing.png"/></i> <span>Panel Ventas</span></a></li>
                        <li class="treeview">
                            <a href="#"><img src="https://img.icons8.com/nolan/30/blockchain-new-logo.png"/> <span>Pedidos</span>                               
                            </a>
                            <ul class="treeview-menu">

                                <li><a href="#" id="tablaPedidos"></i><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAyUlEQVR4nGNgYGBguHDzsfmFO4+Onb/z+OeFO4//k4LPg/U8Onr+7iMzBiTDfpNqECZ+9BtsaMfc1V8quuf8pwbumLvqC0P3wrX/qGVg94K1/xh6Fq2jimEV3XP+g8xiWLDj4P9Nfz5SBS/YcZAOBs6/9eF/93bi8MC4cBO1DVzxGuJtmPfx4VEX/h8iYTh/+4G/1DJw/rYDfxnmbNr9YsaBI/+pgWdv3POcAVQoUqeAffzr3N1HpuBSG2roUTKrgB8Xbj86AjMMAM9JMA5feQPzAAAAAElFTkSuQmCC">
                                        Todos</a></li>
                            </ul>
                        </li>

                    </ul>

                </section>
            </aside>

            <div class="content-wrapper" style="background-color: azure">
                <section class="content-header">
                    <h1>
                        Supervision de pedidos

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="LogOut.jsp"> Inicio</a></li>
                        <li class="active">Panel de listados de pedidos de tiendas supervisadas</li>
                    </ol>
                </section>

                <section class="content">
                    <div class="row">

                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-black">
                                <div class="inner">
                                    <h4>Buscar pedidos filtrados por codigo</h4>
                                    <h4>de tienda </h4>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="buscarPedidosPorCodigoTienda"><img src="https://img.icons8.com/color/48/null/search-property.png"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-blue-active">
                                <div class="inner">
                                    <h4>Buscar pedidos de tiendas supervisadas</h4>
                                    <h4>filtrado por estado</h4>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="buscarPedidosPorEstado"><img src="https://img.icons8.com/dusk/48/null/search-property.png"/></a>

                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-green-active">
                                <div class="inner">
                                    <h4>Buscar pedidos de tiendas supervisadas</h4>
                                    <h4>filtrado por fecha</h4>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="buscarPedidosPorFecha"><img src="https://img.icons8.com/fluency/48/null/search-property.png"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-aqua-active">
                                <div class="inner">
                                    <h4>Buscar pedidos filtrados por fecha, estado</h4>
                                    <h4>y tienda</h4>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="buscarPedidosPorFechaEstadoYCodigoT"><img src="https://img.icons8.com/plasticine/60/null/search-property.png"/></a>
                                </div>
                            </div>
                        </div>


                    </div>
                </section>
                <fieldset>
                    <div  id="Contenido">

                        <script type="text/javascript" src="Js/botonesSupervisor.js"></script>

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
    /*} else {
        response.sendRedirect("identificar.jsp");
    }*/
%>
