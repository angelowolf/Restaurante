<%@taglib uri="/struts-tags" prefix="s" %>
<li>
    <a href="/home">
        <i class="fa fa-home fa-fw"></i>
        Inicio
    </a>
</li>
<s:if test="#session.usuario.esResponsableUsuario()">
    <li>
        <a href="#">
            <i class="fa fa-users fa-fw"></i> Usuarios
            <i class="fa arrow"></i>
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
            <i class="fa fa-shopping-bag fa-fw"></i> Insumos Brutos
            <i class="fa arrow"></i></a>
        <ul class="nav nav-second-level">
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
            <i class="fa fa-sort-alpha-asc fa-fw"></i> Categorías de Insumos Brutos
            <i class="fa arrow"></i>
        </a>
        <ul class="nav nav-third-level">
            <li>
                <a href='<s:url action="listar" namespace="/insumo/categoria"/>'>
                    <i class="fa fa-list fa-fw"></i> Ver Listado
                </a>
            </li>
            <li>
                <a href='<s:url action="nuevo" namespace="/insumo/categoria"/>'>
                    <i class="fa fa-plus fa-fw"></i> Añadir Nueva
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a href="#">
            <i class="fa fa-shopping-basket fa-fw"></i> Control de Inventario
            <i class="fa arrow"></i>
        </a>
        <ul class="nav nav-second-level">
            <li>
                <a href='<s:url action="getAjusteStock" namespace="/stock"/>'>
                    <i class="fa fa-calculator fa-fw"></i> Ajuste de Stock
                </a>
            </li>
            <li>
                <a href='<s:url action="getCargarCompra" namespace="/stock"/>'>
                    <i class="fa fa-shopping-cart fa-fw"></i> Cargar Compras
                </a>
            </li>
            <li>
                <a href='<s:url action="getListaCompra" namespace="/stock"/>'>
                    <i class="fa fa-file fa-fw"></i> Listado de Compras
                </a>
            </li>
        </ul>
    </li>
</s:if>
<s:if test="#session.usuario.esResponsableCocina()">
    <li>
        <a href="#">
            <i class="fa fa-sign-language fa-fw"></i> Insumos Elaborados
            <i class="fa arrow"></i>
        </a>
        <ul class="nav nav-second-level">
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
            <i class="fa arrow"></i>
        </a>
        <ul class="nav nav-second-level">
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
            <i class="fa fa-sort-alpha-asc fa-fw"></i> Categorías de Recetas
            <i class="fa arrow"></i>
        </a>
        <ul class="nav nav-second-level">
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
</s:if>
<s:if test="#session.usuario.esResponsableCaja()">
</s:if>
<s:if test="#session.usuario.esResponsableMesa()">
</s:if>
<s:if test="#session.usuario.esMozo()">
</s:if>