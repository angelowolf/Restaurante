<%@taglib uri="/struts-tags" prefix="s" %>
<li id="navbar-logo">
    <img src="/imagenes/favicon.ico">
</li>
<s:if test="#session.rolUsuario">
    <li>
        <a href="#">
            <i class="fa fa-users fa-fw"></i> <s:text name="global.usuarios"/>
            <span class="fa arrow"></span>
        </a>
        <ul class="nav nav-second-level">
            <li>
                <a href='<s:url action="listar" namespace="/usuario"/>'>
                    <i class="fa fa-list fa-fw "></i> <s:text name="global.listado"/>
                </a>
            </li>
            <li>
                <a href='<s:url action="nuevo" namespace="/usuario"/>'>
                    <i class="fa fa-plus fa-fw "></i> <s:text name="global.nuevo"/>
                </a>
            </li>
        </ul>
    </li>
</s:if>
<s:if test="#session.rolStock">
    <li>
        <a href="#">
            <i class="fa fa-shopping-bag fa-fw"></i> <s:text name="global.insumos"/>
            <span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
            <li>
                <a href="#">
                    <i class="fa fa-apple fa-fw"></i> <s:text name="global.brutos"/>
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-third-level">
                    <li>
                        <a href='<s:url action="listar" namespace="/insumobruto"/>'>
                            <i class="fa fa-list fa-fw "></i> <s:text name="global.listado"/>
                        </a>
                    </li>
                    <li>
                        <a href='<s:url action="nuevo" namespace="/insumobruto"/>'>
                            <i class="fa fa-plus fa-fw"></i> <s:text name="global.nuevo"/>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-cogs fa-fw"></i> <s:text name="global.categorias"/>
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-third-level">
                    <li>
                        <a href='<s:url action="listar" namespace="/insumo/categoria"/>'>
                            <i class="fa fa-list fa-fw"></i> <s:text name="global.listado"/>
                        </a>
                    </li>
                    <li>
                        <a href='<s:url action="nuevo" namespace="/insumo/categoria"/>'>
                            <i class="fa fa-plus fa-fw"></i> <s:text name="global.nuevo"/>
                        </a>
                    </li>
                </ul>  
            </li>
            <li>
                <a href='<s:url action="getAjusteStock" namespace="/stock"/>'>
                    <i class="fa fa-wrench fa-fw"></i> <s:text name="global.ajustedestock"/>
                </a>
            </li>
            <li>
                <a href='<s:url action="getCargarCompra" namespace="/stock"/>'>
                    <i class="fa fa-edit fa-fw"></i> <s:text name="global.cargarcompra"/>
                </a>
            </li>
            <li>
                <a href='<s:url action="getListaCompra" namespace="/stock"/>'>
                    <i class="fa fa-cart-arrow-down fa-fw"></i> <s:text name="global.emitirlistadocompra"/>
                </a>
            </li>
        </ul>
    </li>
</s:if>
<s:if test="#session.rolCocina">
    <li>
        <a href="#"><i class="fa fa-fire fa-fw"></i> <s:text name="global.cocina"/><span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
            <li>
                <a href="#">
                    <i class="fa fa-sign-language fa-fw"></i> <s:text name="global.elaborados"/>
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-third-level">
                    <li>
                        <a href='<s:url action="listar" namespace="/insumoelaborado"/>'>
                            <i class="fa fa-list fa-fw "></i> <s:text name="global.listado"/>
                        </a>
                    </li>
                    <li>
                        <a href='<s:url action="nuevo" namespace="/insumoelaborado"/>'>
                            <i class="fa fa-plus fa-fw "></i> <s:text name="global.nuevo"/>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-book fa-fw"></i> <s:text name="global.recetas"/>
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-third-level">
                    <li>
                        <a href='<s:url action="listar" namespace="/receta"/>'>
                            <i class="fa fa-list fa-fw"></i> <s:text name="global.listado"/>
                        </a>
                    </li>
                    <li>
                        <a href='<s:url action="nuevo" namespace="/receta"/>'>
                            <i class="fa fa-plus fa-fw"></i> <s:text name="global.nuevo"/>
                        </a>
                    </li>
                </ul>  
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-cogs fa-fw"></i> <s:text name="global.categorias"/>
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-third-level">
                    <li>
                        <a href='<s:url action="listar" namespace="/receta/categoria"/>'>
                            <i class="fa fa-list fa-fw"></i> <s:text name="global.listado"/>
                        </a>
                    </li>
                    <li>
                        <a href='<s:url action="nuevo" namespace="/receta/categoria"/>'>
                            <i class="fa fa-plus fa-fw"></i> <s:text name="global.nuevo"/>
                        </a>
                    </li>
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