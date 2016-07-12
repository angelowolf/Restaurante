<%@taglib uri="/struts-tags" prefix="s" %>
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

            <li>
                <a href="#"><i class="fa fa-apple fa-fw"></i> Brutos<span class="fa arrow"></span></a>
                <ul class="nav nav-third-level">
                    <li><a href="<s:url action="listar" namespace="/insumobruto"/>"><i class="glyphicon glyphicon-list fa-fw "></i> Todos</a></li>
                    <li><a href="<s:url action="nuevo" namespace="/insumobruto"/>"><i class="glyphicon glyphicon-plus fa-fw "></i> Nuevo</a></li>
                </ul>  
            </li>
            <li>
                <a href="#"><i class="fa fa-cogs fa-fw"></i> Categorías<span class="fa arrow"></span></a>
                <ul class="nav nav-third-level">
                    <li><a href="<s:url action="listar" namespace="/insumo/categoria"/>"><i class="glyphicon glyphicon-list fa-fw "></i> Todos</a></li>
                    <li><a href="<s:url action="nuevo" namespace="/insumo/categoria"/>"><i class="glyphicon glyphicon-plus fa-fw "></i> Nuevo</a></li>
                </ul>  
            </li>
            <li>
                <a href="<s:url action="getAjusteStock" namespace="/stock"/>"><i class="fa fa-wrench fa-fw"></i> Ajuste de Stock</a>
            </li>
            <li>
                <a href="<s:url action="getCargarCompra" namespace="/stock"/>"><i class="fa fa-edit fa-fw"></i> Reponer Insumos</a>
            </li>
            <li>
                <a href="<s:url action="getListaCompra" namespace="/stock"/>"><i class="fa fa-cart-arrow-down fa-fw"></i> Generar Lista de Compra</a>
            </li>                                
        </ul>    
    </li>
</s:if>
<s:if test="#session.rolCocina">
    <li>
        <a href="#"><i class="fa fa-fire fa-fw"></i> Cocina<span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
            <li>
                <a href="#"><i class="fa fa-sign-language fa-fw"></i> Elaborados<span class="fa arrow"></span></a>
                <ul class="nav nav-third-level">
                    <li><a href="<s:url action="listar" namespace="/insumoelaborado"/>"><i class="glyphicon glyphicon-list fa-fw "></i> Todos</a></li>
                    <li><a href="<s:url action="nuevo" namespace="/insumoelaborado"/>"><i class="glyphicon glyphicon-plus fa-fw "></i> Nuevo</a></li>
                </ul>  
            </li>
        </ul>    
    </li>
</s:if>
<s:if test="#session.rolCaja">
</s:if>
<s:if test="#session.rolMesa">
</s:if>
<s:if test="#session.rolMozo">
</s:if>