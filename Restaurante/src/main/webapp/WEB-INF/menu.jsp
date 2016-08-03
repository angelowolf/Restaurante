<%@taglib uri="/struts-tags" prefix="s" %>
<li id="navbar-logo">
    <img src="/imagenes/favicon.ico">
</li>
<s:if test="#session.usuario.esResponsableUsuario()">
    <li>
        <a href="#">
            <i class="fa fa-users fa-fw"></i> Usuarios
            <span class="fa arrow"></span>
        </a>
        <ul class="nav nav-second-level">
            <li>
                <a href='<s:url action="listar" namespace="/usuario"/>'>
                    <i class="fa fa-list fa-fw "></i> Ver Listado
                </a>
            </li>
            <li>
                <a href='<s:url action="nuevo" namespace="/usuario"/>'>
                    <i class="fa fa-plus fa-fw "></i> Añadir Nuevo
                </a>
            </li>
        </ul>
    </li>
</s:if>
<s:if test="#session.usuario.esResponsableStock()">
    <li>
        <a href="#">
            <i class="fa fa-shopping-bag fa-fw"></i> Almacén
            <span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
            <li>
                <a href="#">
                    <i class="fa fa-apple fa-fw"></i> Insumos
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-third-level">
                    <li>
                        <a href='<s:url action="listar" namespace="/insumobruto"/>'>
                            <i class="fa fa-list fa-fw "></i> Ver Listado
                        </a>
                    </li>
                    <li>
                        <a href='<s:url action="nuevo" namespace="/insumobruto"/>'>
                            <i class="fa fa-plus fa-fw"></i> Añadir Nuevo
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-cogs fa-fw"></i> Tipos Insumo
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-third-level">
                    <li>
                        <a href='<s:url action="listar" namespace="/insumo/categoria"/>'>
                            <i class="fa fa-list fa-fw"></i> Ver Listado
                        </a>
                    </li>
                    <li>
                        <a href='<s:url action="nuevo" namespace="/insumo/categoria"/>'>
                            <i class="fa fa-plus fa-fw"></i> Añadir Nuevo
                        </a>
                    </li>
                </ul>  
            </li>
            <li>
                <a href='<s:url action="getAjusteStock" namespace="/stock"/>'>
                    <i class="fa fa-wrench fa-fw"></i> Ajuste de Stock
                </a>
            </li>
            <li>
                <a href='<s:url action="getCargarCompra" namespace="/stock"/>'>
                    <i class="fa fa-edit fa-fw"></i> Cargar Compras
                </a>
            </li>
            <li>
                <a href='<s:url action="getListaCompra" namespace="/stock"/>'>
                    <i class="fa fa-cart-arrow-down fa-fw"></i> Listado de Compras
                </a>
            </li>
        </ul>
    </li>
</s:if>
<s:if test="#session.usuario.esResponsableCocina()">
    <li>
        <a href="#"><i class="fa fa-fire fa-fw"></i> Cocina<span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
            <li>
                <a href="#">
                    <i class="fa fa-sign-language fa-fw"></i> Elaborados
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-third-level">
                    <li>
                        <a href='<s:url action="listar" namespace="/insumoelaborado"/>'>
                            <i class="fa fa-list fa-fw "></i> Ver Listado
                        </a>
                    </li>
                    <li>
                        <a href='<s:url action="nuevo" namespace="/insumoelaborado"/>'>
                            <i class="fa fa-plus fa-fw "></i> Añadir Nuevo
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-book fa-fw"></i> Recetas
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-third-level">
                    <li>
                        <a href='<s:url action="listar" namespace="/receta"/>'>
                            <i class="fa fa-list fa-fw"></i> Ver Listado
                        </a>
                    </li>
                    <li>
                        <a href='<s:url action="nuevo" namespace="/receta"/>'>
                            <i class="fa fa-plus fa-fw"></i> Añadir Nueva
                        </a>
                    </li>
                </ul>  
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-cogs fa-fw"></i> Tipos Receta
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-third-level">
                    <li>
                        <a href='<s:url action="listar" namespace="/receta/categoria"/>'>
                            <i class="fa fa-list fa-fw"></i> Ver Listado
                        </a>
                    </li>
                    <li>
                        <a href='<s:url action="nuevo" namespace="/receta/categoria"/>'>
                            <i class="fa fa-plus fa-fw"></i> Añadir Nueva
                        </a>
                    </li>
                </ul>  
            </li>
        </ul>
    </li>
</s:if>
<s:if test="#session.usuario.esResponsableCaja()">
</s:if>
<s:if test="#session.usuario.esResponsableMesa()">
</s:if>
<s:if test="#session.usuario.esMozo()">
</s:if>