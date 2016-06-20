<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:importAttribute name="stylesheet" />
<tiles:importAttribute name="javascript" />
<%
    HttpSession sesion = request.getSession();
    if (null == sesion.getAttribute("idUsuario")) {
        response.sendRedirect("/logear");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title><tiles:insertAttribute name="title" ignore="true" /></title>
        <s:iterator value="#attr.stylesheet" var="cadaCSS">
            <link href="<s:url value="%{cadaCSS}"/>" rel="stylesheet" type="text/css" >
        </s:iterator>
    </head>

    <body>
        <s:hidden value="%{#session.idUsuario}" id="idUsuarioHidden"/>
        <div id="wrapper">
            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<s:url action="home" namespace="/"/>">Restaurante Ruhaj</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">
                    <s:action name="panel" namespace="/notificacion" executeResult="true"/>
                    <!-- /.dropdown -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="<s:url action="misdatos" namespace="/usuario"/>"><i class="fa fa-gear fa-fw"></i> Configuración</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="<s:url action="logout" namespace="/"/>"><i class="fa fa-sign-out fa-fw"></i> Cerrar sesión</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <s:if test="#session.rolUsuario">
                                <li>
                                    <a href="#"><i class="fa fa-users fa-fw"></i> Usuarios<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li><a href="<s:url action="listar" namespace="/usuario"/>"><i class="glyphicon glyphicon-list fa-fw "></i> Todos</a></li>
                                        <li><a href="<s:url action="nuevo" namespace="/usuario"/>"><i class="glyphicon glyphicon-plus fa-fw "></i> Nuevo</a></li>
                                    </ul>                              
                                </li>
                            </s:if>
                            <s:if test="#session.rolStock">
                                <li>
                                    <a href="#"><i class="fa fa-shopping-bag fa-fw"></i> Insumos<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li><a href="<s:url action="listar" namespace="/insumo"/>"><i class="glyphicon glyphicon-list fa-fw "></i> Todos</a></li>
                                        <li><a href="<s:url action="nuevo" namespace="/insumo"/>"><i class="glyphicon glyphicon-plus fa-fw "></i> Nuevo</a></li>
                                        <li>
                                            <a href="#"><i class="fa fa-cogs fa-fw"></i> Categorías<span class="fa arrow"></span></a>
                                            <ul class="nav nav-third-level">
                                                <li><a href="<s:url action="listar" namespace="/insumo/categoria"/>"><i class="glyphicon glyphicon-list fa-fw "></i> Todos</a></li>
                                                <li><a href="<s:url action="nuevo" namespace="/insumo/categoria"/>"><i class="glyphicon glyphicon-plus fa-fw "></i> Nuevo</a></li>
                                            </ul>  
                                        </li>
                                    </ul>    
                                </li>
                                <li>
                                    <a href="<s:url action="getAjusteStock" namespace="/stock"/>"><i class="fa fa-wrench fa-fw"></i> Ajuste de Stock</a>
                                </li>
                                <li>
                                    <a href="<s:url action="getListaCompra" namespace="/stock"/>"><i class="fa fa-cart-arrow-down fa-fw"></i> Generar Lista de Compra</a>
                                </li>
                                <li>
                                    <a href="<s:url action="getCargarCompra" namespace="/stock"/>"><i class="fa fa-edit fa-fw"></i> Cargar Compras</a>
                                </li>                                
                            </s:if>
                            <s:if test="#session.rolCocina">
                            </s:if>
                            <s:if test="#session.rolCaja">
                            </s:if>
                            <s:if test="#session.rolMesa">
                            </s:if>
                            <s:if test="#session.rolMozo">
                            </s:if>

                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <s:action name="mensajeAlerta" namespace="/modal" executeResult="true">
                                <s:param name="tipo"><%out.println(Soporte.Mensaje.TIPOINFO);%></s:param>
                            </s:action>
                            <tiles:insertAttribute name="body" />
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->
        </div>
        <!-- /#wrapper -->

        <s:iterator value="#attr.javascript" var="cadaJS">
            <script src="<s:url value="%{cadaJS}"/>" ></script>
        </s:iterator>
    </body>
</html>
