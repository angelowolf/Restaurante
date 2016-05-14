<%@taglib uri="/struts-tags" prefix="s" %>
<s:if test="#session.usuario.esResponsableUsuario()">
    <li>
        <a href="#"><i class="fa fa-users fa-fw"></i> Usuarios<span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
            <li><a href="<s:url action="listar" namespace="/usuario"/>"><i class="glyphicon glyphicon-list fa-fw "></i> Todos</a></li>
            <li><a href="<s:url action="nuevo" namespace="/usuario"/>"><i class="glyphicon glyphicon-plus fa-fw "></i> Nuevo</a></li>
        </ul>                              
    </li>
</s:if>
<s:if test="#session.usuario.esResponsableUsuario()">
    <li>
        <a href="#"><i class="fa fa-shopping-bag fa-fw"></i> Insumos<span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
            <li><a href="<s:url action="listar" namespace="/insumo"/>"><i class="glyphicon glyphicon-list fa-fw "></i> Todos</a></li>
            <li><a href="<s:url action="nuevo" namespace="/insumo"/>"><i class="glyphicon glyphicon-plus fa-fw "></i> Nuevo</a></li>
        </ul>                              
    </li>
</s:if>