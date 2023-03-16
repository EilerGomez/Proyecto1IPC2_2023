
<%@page import="java.sql.SQLException"%>
<%@page import="SQL.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% HttpSession sesion = request.getSession();
    if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
        response.sendRedirect("index.jsp");
    }
    if (!sesion.getAttribute("area").equals("3")) {
        response.sendRedirect("index.jsp");
    }
    int codigoTienda = Integer.parseInt(sesion.getAttribute("tienda").toString());
    Conexion.traerTiendaPorId(codigoTienda);
    String tipoTienda = "";
    try {
        while (Conexion.rs.next()) {
            tipoTienda = Conexion.rs.getString("tipo");

        }
    } catch (SQLException ex) {
        System.out.println("error al traer tienda por codigo; " + ex);
    }

%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Area de Tienda| Inicio</title>       
        <link rel="stylesheet" href="CSS/bootstrap.min.css" type="text/css">


        <link href="CSS/AdminLTE.min.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="CSS/skin-blue.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>

    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <!-- Main Header -->
            <header class="main-header"style="color: thistle";>
                <a href="#" class="logo">
                    <span class="logo-lg"><b>Sistema </b>de Ventas</span>
                </a>

                <!-- Navegacion -->
                <nav class="navbar navbar-static-top" role="navigation" style="background-color: #36d8a0">
                    <!-- botón para abrir el menu-->
                    <a href="#"  data-toggle="push-menu" >

                        <img src="https://img.icons8.com/nolan/64/drag-list-down.png"/>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <li><a href="servletNuevoPedido" id="newVenta">
                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAACXBIWXMAAAsTAAALEwEAmpwYAAACSklEQVR4nO3YTWsTQRgH8CCI1IM3D4KIiM4G6a34GfQLeBB60Aq9FUQjNuDJVvQiiAd1s6sJpMU2YmYbgyJa40zeKvQmEa0ebNXOKKWKhto0NH/ZaAU3EvOyk0TMA//D7rK7P2Z2nl3W4+mWovJdTaGRnLqWWvcb2Zf1ntcQkEvUHSZQuDeHLVwiWOs5LQXGby8WTULP2NdISgxygWJnASfeFU3NgqnRcGRnpId9wEEmsdwyIBMoMYkcl5hgAroz1pW5+z+AFgxiZXTvnR1PPmIfl3iuHigwnngP7429ke0Bb/SIPZUV0Wh4A/gzb3USOzCzhG1MIqYEyATWmcBxe8oMQi+bGl11IFAthka/GSTaD2ATExi1Z8Ft4Hm9T99sEPq4HphZmbNJiT1cYsE9oMCnzAJ6TGKdbAZnEOtZPPSmn0ssuT3FIXvbIPRFwziNRi9N5mKnr6fLGFeBTGBY74ttdd701rFsIfGqUKXNlGElo3dqJLmIm8raTFJgQN8f2+UE3g3OV++DxPoaPjQ9wASyShs1Ezga1OhuJzAeqgp8HR3NHWYS88pfdfUCHz79svYg/XmQSazU+vZRAhwZevTbDepJW0eQN5AukHdH8C/PYLkPErr8K71Tq+dOTHfOInEes/e5tUB400CJRMWHqUSiY4C8BfH9V0DfHx52XzsXyT83grwLbNMI+jrl3wyvAnRWfmUNF8dnS34jm+44YL4ZnGpgvlmcSmDeDZwqYN4tnCrghbHZkj+QaR63AXQ7w4GZlCu4bnlqr+/b84FkL1wteAAAAABJRU5ErkJggg==">                                    
                                    Nuevo Pedido
                                </a></li>
                            <li><a href="#" id="enviosPendientes"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAACXBIWXMAAAsTAAALEwEAmpwYAAACQ0lEQVR4nO3YQWjTUBgH8CI4Eby6kyeheUXGQEGGePSmt130LHrRgwcjWkTqZbijhzq0eWWo8xLd8oauDGq7vufmBhYmTEW0Chuu72XgQcx0rqWfZFUpTdfFJW8NWz/4X0pIfnwv30doKNQuSaUOTIKbXE1Mm26vbZZNAZmAdUM5rFION3NFONrsOjfxHUgFvKGLcEQ/oO+9fyI9mH37MyBADmUqoD/1AfYkw6RHU4z3GBHIvF6epxw+OSLA3DIg5VBgJhzXD+kdmkL6NETKNm4tkZFjyfCTg/WxOzzFofMFh7NMwJwUIOVQYRzuTpiwD0eGuzAis/9gaIMoRgkrZAKHyak8wG7Koc9/oIBzsVBsF0bkCkbGimsccmTAvk8jpLcj5lAcvl04oynGogccVGOodieZgHd+v4Mr48+/XtaQMeMFqCHjm/1eUhNUKVOc+1yK4wh5WP/geG96OX46Y9XmTm/a0rpGSw5k2DiZW4LDMvdgZrAndX1tAFD1odm5xnvw2YMFRxcTCrnIirBf6qJmAhYeX5o9jxExmwHHx5acxxwZjdp7VDbQHp7vKf3LhWT300IwgX92ZPbjrxE6Xw4OsPYLhDX4rTaxaLa1HWQbpOVHzNrA7dhBdTsNCat+Dd2ov3fQgK8oh3u1YQJwYIDMRXYWUP2PIVHXyc7uIGsDW9RBdav/m9kMsL6sH6vQ/yhfiWrTU4EDWl5wsoGWV5xMoOUHThbQ8gsnC3hrKF+JJl56x/0F+p1riZlJX3DtCrmv3/Zre/1EbfgsAAAAAElFTkSuQmCC">
                                    Recibir Envios
                                </a></li>
                            <li>
                                <a href="#" id="crearIncidencia"><img src="https://img.icons8.com/dusk/35/null/inconsistency.png"/> Crear incidencia</a>
                            </li>
                            <li>
                                <a href="#" id="crearDevolucion"><img src="https://img.icons8.com/metro/35/000000/refresh.png"/> Crear devolucion</a>
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
                <section class="sidebar">
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
                                <%
                                    if (tipoTienda.equalsIgnoreCase("supervisada")) {
                                %>
                                <li><a href="#" id="tablaPedidosRechazados"></i><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAXCAYAAADgKtSgAAAACXBIWXMAAAsTAAALEwEAmpwYAAAC8UlEQVR4nK2VW08aQRTH97v08pHUWpPCgzxo7UutJY2N8dIGpWrbpLUhaPTBqqDWS6u1StR6rbK7KGKVBauLikoFEREWZP/NDIV6weLtJP9sZmfOb2ZOzjnDMAzDWJzrd3lB7LA4XH6Lw4VryM8LYjsriLeZf2CX95pQHBcvuHbpBg2dgz81ulZU6tpuTBpdKxo+DS4y75p7o2qtHqn0Sm9Al2kSY9wiphcETFsFjJptaP86hhd1H1P6JES4TF3LlzMTJW+aMDDBw2JfA9c/BPZlJdjHT8AVFoGtfg1ueBy8XUS3aQrPqhtSwgmXqe/4hrrmHugNfVT1xn5MWQVwIxMwK5RYVKmwrVbDV1EBX1kZ3EVFWFAqYc57CH52DqOsLembEOERLtM5NAWPdw/EZFmGsL4NvncAbFYWfOXlCNXWppSnuBjmzCxw4zNY297FcSM8wj0B9+wFwLNW6hTQaM4FJ+QtLYX5fg74pV/YPwz/H25b3QT7vATup+okIDo7i3BjY3IsGY30X2K8UvAI3HsdnBue8+GHYQmW5VWwGRkI1dRQx3BTExCJQD44oBsQcHKs09E1B1ot2AcKzDnXcRSLpYZ794Pgx37Alqs6cXWprQ2QJMihEBCNQg4G6abH13DZ2fRgwbCUGk7izfWbsJyXfya2EZMpfl9ZhtTVdWZ+TqEAz9mwHwxd4eSRSPzk5HuVk9OY20nMMy8V80BVFczpYk5sMZEt6ktmywc9nJue9HluYRcul+c58TwPpMvzRIVyn0mF3qPlfpEKFbe96SuUWPQohiVxC/zw396Sq8LWqd4yr1CCzS+gvYWEQ4rGLgYnFovJcO14MSeIND1ZjRZsYVG8K9a+pRvPO9fh3vVDPuF5Ct4+OBk+DU9YOBLFltcPx8YOlkQ3vdHKpgc7vgAiR0c4zwiPcJmekZmplr4RGPq/35ha+kbQPTwzyXAO1x3y5t3oG+oQf1vta7foI00eU94hGi2Ca+9aYOovGhLgPzAVyoBwyXjVAAAAAElFTkSuQmCC">
                                        Rechazados</a></li>
                                        <%
                                            }
                                        %>
                                <li><a href="#" id="tablaPedidos"></i><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAyUlEQVR4nGNgYGBguHDzsfmFO4+Onb/z+OeFO4//k4LPg/U8Onr+7iMzBiTDfpNqECZ+9BtsaMfc1V8quuf8pwbumLvqC0P3wrX/qGVg94K1/xh6Fq2jimEV3XP+g8xiWLDj4P9Nfz5SBS/YcZAOBs6/9eF/93bi8MC4cBO1DVzxGuJtmPfx4VEX/h8iYTh/+4G/1DJw/rYDfxnmbNr9YsaBI/+pgWdv3POcAVQoUqeAffzr3N1HpuBSG2roUTKrgB8Xbj86AjMMAM9JMA5feQPzAAAAAElFTkSuQmCC">
                                        Todos</a></li>
                            </ul>
                        </li>
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
                            </ul>

                        </li>
                        <li class="treeview">
                            <a href="#"><span><img src="https://img.icons8.com/fluency/25/null/refresh.png"/> Devoluciones</span>                               
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#" id="todasDevoluciones"><img src="https://img.icons8.com/color/23/null/checklist.png"/>
                                        Todas</a></li>
                            </ul>

                        </li>

                    </ul>

                </section>
            </aside>

            <div class="content-wrapper" style="background-color: #ccd9ea">
                <section class="content-header">
                    <h1>
                        Venta de productos de la tienda con codigo: <%=sesion.getAttribute("tienda")%>

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="LogOut.jsp"> Inicio</a></li>
                        <li class="active">Panel de Area de ventas de tienda : <%=sesion.getAttribute("tienda")%></li>
                    </ol>
                </section>

                <section class="content">
                    <div class="row">

                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-black">
                                <div class="inner">
                                    <h4>Buscar los productos de la tienda</h4>
                                    <h4>con existencias menores a:  </h4>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="consultarProductosMenorQueExistencia"><img src="https://img.icons8.com/color/48/null/search-property.png"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-blue-active">
                                <div class="inner">
                                    <h4>Buscar pedidos por estado generados</h4>
                                    <h4>en un intervalo de tiempo</h4>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="consultarPedidosEnXTiempoXEstado"><img src="https://img.icons8.com/dusk/48/null/search-property.png"/></a>

                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-green-active">
                                <div class="inner">
                                    <h4>Buscar envios recibidos en intervalo de</h4>
                                    <h4>tiempo, incidencias y devoluciones</h4>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="consultarEnviosEnINtervaloTiempo"><img src="https://img.icons8.com/fluency/48/null/search-property.png"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-aqua-active">
                                <div class="inner">
                                    <h4>Buscar incidencias generadas en</h4>
                                    <h4>intervalo de tiempo y estado</h4>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="consultarIncidenciasEnXTiempo"><img src="https://img.icons8.com/plasticine/60/null/search-property.png"/></a>
                                </div>
                            </div>
                        </div>
                        <div  class="col-lg-3 col-xs-6">
                            <div class="small-box bg-maroon-gradient">
                                <div class="inner">
                                    <h4>Buscar devoluciones generadas en</h4>
                                    <h4>intervalo de tiempo y estado</h4>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                    <a href="#" id="consultarDevolucionesEnXTiempo"><img src="https://img.icons8.com/plasticine/60/null/search-property.png"/></a>
                                </div>
                            </div>
                        </div>


                    </div>
                </section>
                <fieldset>
                    <div  id="Contenido">

                        <script type="text/javascript" src="Js/BotonesTienda.js"></script>

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
